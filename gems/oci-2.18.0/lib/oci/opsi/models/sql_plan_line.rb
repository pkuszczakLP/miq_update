# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SQL Plan Line type object.
  class Opsi::Models::SqlPlanLine
    # Version
    # Example: `1`
    #
    # @return [Float]
    attr_accessor :version

    # **[Required]** Unique SQL_ID for a SQL Statement.
    #
    # @return [String]
    attr_accessor :sql_identifier

    # **[Required]** Plan hash value for the SQL Execution Plan
    # @return [Integer]
    attr_accessor :plan_hash

    # **[Required]** Collection time stamp
    # Example: `\"2020-05-06T00:00:00.000Z\"`
    #
    # @return [DateTime]
    attr_accessor :time_collected

    # **[Required]** Operation
    # Example: `\"SELECT STATEMENT\"`
    #
    # @return [String]
    attr_accessor :operation

    # Remark
    # Example: `\"\"`
    #
    # @return [String]
    attr_accessor :remark

    # Options
    # Example: `\"RANGE SCAN\"`
    #
    # @return [String]
    attr_accessor :options

    # Object Node
    # Example: `\"Q4000\"`
    #
    # @return [String]
    attr_accessor :object_node

    # Object Owner
    # Example: `\"TENANT_A#SCHEMA\"`
    #
    # @return [String]
    attr_accessor :object_owner

    # Object Name
    # Example: `\"PLAN_LINES_PK\"`
    #
    # @return [String]
    attr_accessor :object_name

    # Object Alias
    # Example: `\"PLAN_LINES@SEL$1\"`
    #
    # @return [String]
    attr_accessor :object_alias

    # Object Instance
    # Example: `37472`
    #
    # @return [Integer]
    attr_accessor :object_instance

    # Object Type
    # Example: `\"INDEX (UNIQUE)\"`
    #
    # @return [String]
    attr_accessor :object_type

    # Optimizer
    # Example: `\"CLUSTER\"`
    #
    # @return [String]
    attr_accessor :optimizer

    # Search Columns
    # Example: `3`
    #
    # @return [Integer]
    attr_accessor :search_columns

    # **[Required]** Identifier
    # Example: `3`
    #
    # @return [Integer]
    attr_accessor :identifier

    # Parent Identifier
    # Example: `2`
    #
    # @return [Integer]
    attr_accessor :parent_identifier

    # Depth
    # Example: `3`
    #
    # @return [Integer]
    attr_accessor :depth

    # Position
    # Example: `1`
    #
    # @return [Integer]
    attr_accessor :position

    # Cost
    # Example: `1`
    #
    # @return [Integer]
    attr_accessor :cost

    # Cardinality
    # Example: `1`
    #
    # @return [Integer]
    attr_accessor :cardinality

    # Bytes
    # Example: `150`
    #
    # @return [Integer]
    attr_accessor :bytes

    # Other
    # Example: ``
    #
    # @return [String]
    attr_accessor :other

    # Other Tag
    # Example: `\"PARALLEL_COMBINED_WITH_PARENT\"`
    #
    # @return [String]
    attr_accessor :other_tag

    # Partition start
    # Example: `1`
    #
    # @return [String]
    attr_accessor :partition_start

    # Partition stop
    # Example: `2`
    #
    # @return [String]
    attr_accessor :partition_stop

    # Partition identifier
    # Example: `8`
    #
    # @return [Integer]
    attr_accessor :partition_identifier

    # Distribution
    # Example: `\"QC (RANDOM)\"`
    #
    # @return [String]
    attr_accessor :distribution

    # CPU cost
    # Example: `7321`
    #
    # @return [Integer]
    attr_accessor :cpu_cost

    # IO cost
    # Example: `1`
    #
    # @return [Integer]
    attr_accessor :io_cost

    # Time space
    # Example: `15614000`
    #
    # @return [Integer]
    attr_accessor :temp_space

    # Access predicates
    # Example: `\"\\\"RESOURCE_ID\\\"=:1 AND \\\"QUERY_ID\\\"=:2\"`
    #
    # @return [String]
    attr_accessor :access_predicates

    # Filter predicates
    # Example: `\"(INTERNAL_FUNCTION(\\\"J\\\".\\\"DATABASE_ROLE\\\") OR (\\\"J\\\".\\\"DATABASE_ROLE\\\" IS NULL AND SYS_CONTEXT('userenv','database_role')='PRIMARY'))\"`
    #
    # @return [String]
    attr_accessor :filter_predicates

    # Projection
    # Example: `\"COUNT(*)[22]\"`
    #
    # @return [String]
    attr_accessor :projection

    # Qblock Name
    # Example: `\"SEL$1\"`
    #
    # @return [String]
    attr_accessor :qblock_name

    # Total elapsed time
    # Example: `1.2`
    #
    # @return [Float]
    attr_accessor :elapsed_time_in_sec

    # Other SQL
    # Example: `\"<other_xml><info type=\\\"db_version\\\">18.0.0.0</info><info type=\\\"parse_schema\\\"><![CDATA[\\\"SYS\\\"]]></info><info type=\\\"plan_hash_full\\\">483892784</info><info type=\\\"plan_hash\\\">2709293936</info><info type=\\\"plan_hash_2\\\">483892784</info><outline_data><hint><![CDATA[IGNORE_OPTIM_EMBEDDED_HINTS]]></hint><hint><![CDATA[OPTIMIZER_FEATURES_ENABLE('18.1.0')]]></hint><hint><![CDATA[DB_VERSION('18.1.0')]]></hint><hint><![CDATA[OPT_PARAM('_b_tree_bitmap_plans' 'false')]]></hint><hint><![CDATA[OPT_PARAM('_optim_peek_user_binds' 'false')]]></hint><hint><![CDATA[OPT_PARAM('result_cache_mode' 'FORCE')]]></hint><hint><![CDATA[OPT_PARAM('_fix_control' '20648883:0 27745220:1 30001331:1 30142527:1 30539126:1')]]></hint><hint><![CDATA[OUTLINE_LEAF(@\\\"SEL$1\\\")]]></hint><hint><![CDATA[INDEX(@\\\"SEL$1\\\" \\\"USER$\\\"@\\\"SEL$1\\\" \\\"I_USER#\\\")]]></hint></outline_data></other_xml>\"`
    #
    # @return [String]
    attr_accessor :other_xml

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'version': :'version',
        'sql_identifier': :'sqlIdentifier',
        'plan_hash': :'planHash',
        'time_collected': :'timeCollected',
        'operation': :'operation',
        'remark': :'remark',
        'options': :'options',
        'object_node': :'objectNode',
        'object_owner': :'objectOwner',
        'object_name': :'objectName',
        'object_alias': :'objectAlias',
        'object_instance': :'objectInstance',
        'object_type': :'objectType',
        'optimizer': :'optimizer',
        'search_columns': :'searchColumns',
        'identifier': :'identifier',
        'parent_identifier': :'parentIdentifier',
        'depth': :'depth',
        'position': :'position',
        'cost': :'cost',
        'cardinality': :'cardinality',
        'bytes': :'bytes',
        'other': :'other',
        'other_tag': :'otherTag',
        'partition_start': :'partitionStart',
        'partition_stop': :'partitionStop',
        'partition_identifier': :'partitionIdentifier',
        'distribution': :'distribution',
        'cpu_cost': :'cpuCost',
        'io_cost': :'ioCost',
        'temp_space': :'tempSpace',
        'access_predicates': :'accessPredicates',
        'filter_predicates': :'filterPredicates',
        'projection': :'projection',
        'qblock_name': :'qblockName',
        'elapsed_time_in_sec': :'elapsedTimeInSec',
        'other_xml': :'otherXML'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'version': :'Float',
        'sql_identifier': :'String',
        'plan_hash': :'Integer',
        'time_collected': :'DateTime',
        'operation': :'String',
        'remark': :'String',
        'options': :'String',
        'object_node': :'String',
        'object_owner': :'String',
        'object_name': :'String',
        'object_alias': :'String',
        'object_instance': :'Integer',
        'object_type': :'String',
        'optimizer': :'String',
        'search_columns': :'Integer',
        'identifier': :'Integer',
        'parent_identifier': :'Integer',
        'depth': :'Integer',
        'position': :'Integer',
        'cost': :'Integer',
        'cardinality': :'Integer',
        'bytes': :'Integer',
        'other': :'String',
        'other_tag': :'String',
        'partition_start': :'String',
        'partition_stop': :'String',
        'partition_identifier': :'Integer',
        'distribution': :'String',
        'cpu_cost': :'Integer',
        'io_cost': :'Integer',
        'temp_space': :'Integer',
        'access_predicates': :'String',
        'filter_predicates': :'String',
        'projection': :'String',
        'qblock_name': :'String',
        'elapsed_time_in_sec': :'Float',
        'other_xml': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :version The value to assign to the {#version} property
    # @option attributes [String] :sql_identifier The value to assign to the {#sql_identifier} property
    # @option attributes [Integer] :plan_hash The value to assign to the {#plan_hash} property
    # @option attributes [DateTime] :time_collected The value to assign to the {#time_collected} property
    # @option attributes [String] :operation The value to assign to the {#operation} property
    # @option attributes [String] :remark The value to assign to the {#remark} property
    # @option attributes [String] :options The value to assign to the {#options} property
    # @option attributes [String] :object_node The value to assign to the {#object_node} property
    # @option attributes [String] :object_owner The value to assign to the {#object_owner} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :object_alias The value to assign to the {#object_alias} property
    # @option attributes [Integer] :object_instance The value to assign to the {#object_instance} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :optimizer The value to assign to the {#optimizer} property
    # @option attributes [Integer] :search_columns The value to assign to the {#search_columns} property
    # @option attributes [Integer] :identifier The value to assign to the {#identifier} property
    # @option attributes [Integer] :parent_identifier The value to assign to the {#parent_identifier} property
    # @option attributes [Integer] :depth The value to assign to the {#depth} property
    # @option attributes [Integer] :position The value to assign to the {#position} property
    # @option attributes [Integer] :cost The value to assign to the {#cost} property
    # @option attributes [Integer] :cardinality The value to assign to the {#cardinality} property
    # @option attributes [Integer] :bytes The value to assign to the {#bytes} property
    # @option attributes [String] :other The value to assign to the {#other} property
    # @option attributes [String] :other_tag The value to assign to the {#other_tag} property
    # @option attributes [String] :partition_start The value to assign to the {#partition_start} property
    # @option attributes [String] :partition_stop The value to assign to the {#partition_stop} property
    # @option attributes [Integer] :partition_identifier The value to assign to the {#partition_identifier} property
    # @option attributes [String] :distribution The value to assign to the {#distribution} property
    # @option attributes [Integer] :cpu_cost The value to assign to the {#cpu_cost} property
    # @option attributes [Integer] :io_cost The value to assign to the {#io_cost} property
    # @option attributes [Integer] :temp_space The value to assign to the {#temp_space} property
    # @option attributes [String] :access_predicates The value to assign to the {#access_predicates} property
    # @option attributes [String] :filter_predicates The value to assign to the {#filter_predicates} property
    # @option attributes [String] :projection The value to assign to the {#projection} property
    # @option attributes [String] :qblock_name The value to assign to the {#qblock_name} property
    # @option attributes [Float] :elapsed_time_in_sec The value to assign to the {#elapsed_time_in_sec} property
    # @option attributes [String] :other_xml The value to assign to the {#other_xml} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.version = attributes[:'version'] if attributes[:'version']

      self.sql_identifier = attributes[:'sqlIdentifier'] if attributes[:'sqlIdentifier']

      raise 'You cannot provide both :sqlIdentifier and :sql_identifier' if attributes.key?(:'sqlIdentifier') && attributes.key?(:'sql_identifier')

      self.sql_identifier = attributes[:'sql_identifier'] if attributes[:'sql_identifier']

      self.plan_hash = attributes[:'planHash'] if attributes[:'planHash']

      raise 'You cannot provide both :planHash and :plan_hash' if attributes.key?(:'planHash') && attributes.key?(:'plan_hash')

      self.plan_hash = attributes[:'plan_hash'] if attributes[:'plan_hash']

      self.time_collected = attributes[:'timeCollected'] if attributes[:'timeCollected']

      raise 'You cannot provide both :timeCollected and :time_collected' if attributes.key?(:'timeCollected') && attributes.key?(:'time_collected')

      self.time_collected = attributes[:'time_collected'] if attributes[:'time_collected']

      self.operation = attributes[:'operation'] if attributes[:'operation']

      self.remark = attributes[:'remark'] if attributes[:'remark']

      self.options = attributes[:'options'] if attributes[:'options']

      self.object_node = attributes[:'objectNode'] if attributes[:'objectNode']

      raise 'You cannot provide both :objectNode and :object_node' if attributes.key?(:'objectNode') && attributes.key?(:'object_node')

      self.object_node = attributes[:'object_node'] if attributes[:'object_node']

      self.object_owner = attributes[:'objectOwner'] if attributes[:'objectOwner']

      raise 'You cannot provide both :objectOwner and :object_owner' if attributes.key?(:'objectOwner') && attributes.key?(:'object_owner')

      self.object_owner = attributes[:'object_owner'] if attributes[:'object_owner']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.object_alias = attributes[:'objectAlias'] if attributes[:'objectAlias']

      raise 'You cannot provide both :objectAlias and :object_alias' if attributes.key?(:'objectAlias') && attributes.key?(:'object_alias')

      self.object_alias = attributes[:'object_alias'] if attributes[:'object_alias']

      self.object_instance = attributes[:'objectInstance'] if attributes[:'objectInstance']

      raise 'You cannot provide both :objectInstance and :object_instance' if attributes.key?(:'objectInstance') && attributes.key?(:'object_instance')

      self.object_instance = attributes[:'object_instance'] if attributes[:'object_instance']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']

      self.optimizer = attributes[:'optimizer'] if attributes[:'optimizer']

      self.search_columns = attributes[:'searchColumns'] if attributes[:'searchColumns']

      raise 'You cannot provide both :searchColumns and :search_columns' if attributes.key?(:'searchColumns') && attributes.key?(:'search_columns')

      self.search_columns = attributes[:'search_columns'] if attributes[:'search_columns']

      self.identifier = attributes[:'identifier'] if attributes[:'identifier']

      self.parent_identifier = attributes[:'parentIdentifier'] if attributes[:'parentIdentifier']

      raise 'You cannot provide both :parentIdentifier and :parent_identifier' if attributes.key?(:'parentIdentifier') && attributes.key?(:'parent_identifier')

      self.parent_identifier = attributes[:'parent_identifier'] if attributes[:'parent_identifier']

      self.depth = attributes[:'depth'] if attributes[:'depth']

      self.position = attributes[:'position'] if attributes[:'position']

      self.cost = attributes[:'cost'] if attributes[:'cost']

      self.cardinality = attributes[:'cardinality'] if attributes[:'cardinality']

      self.bytes = attributes[:'bytes'] if attributes[:'bytes']

      self.other = attributes[:'other'] if attributes[:'other']

      self.other_tag = attributes[:'otherTag'] if attributes[:'otherTag']

      raise 'You cannot provide both :otherTag and :other_tag' if attributes.key?(:'otherTag') && attributes.key?(:'other_tag')

      self.other_tag = attributes[:'other_tag'] if attributes[:'other_tag']

      self.partition_start = attributes[:'partitionStart'] if attributes[:'partitionStart']

      raise 'You cannot provide both :partitionStart and :partition_start' if attributes.key?(:'partitionStart') && attributes.key?(:'partition_start')

      self.partition_start = attributes[:'partition_start'] if attributes[:'partition_start']

      self.partition_stop = attributes[:'partitionStop'] if attributes[:'partitionStop']

      raise 'You cannot provide both :partitionStop and :partition_stop' if attributes.key?(:'partitionStop') && attributes.key?(:'partition_stop')

      self.partition_stop = attributes[:'partition_stop'] if attributes[:'partition_stop']

      self.partition_identifier = attributes[:'partitionIdentifier'] if attributes[:'partitionIdentifier']

      raise 'You cannot provide both :partitionIdentifier and :partition_identifier' if attributes.key?(:'partitionIdentifier') && attributes.key?(:'partition_identifier')

      self.partition_identifier = attributes[:'partition_identifier'] if attributes[:'partition_identifier']

      self.distribution = attributes[:'distribution'] if attributes[:'distribution']

      self.cpu_cost = attributes[:'cpuCost'] if attributes[:'cpuCost']

      raise 'You cannot provide both :cpuCost and :cpu_cost' if attributes.key?(:'cpuCost') && attributes.key?(:'cpu_cost')

      self.cpu_cost = attributes[:'cpu_cost'] if attributes[:'cpu_cost']

      self.io_cost = attributes[:'ioCost'] if attributes[:'ioCost']

      raise 'You cannot provide both :ioCost and :io_cost' if attributes.key?(:'ioCost') && attributes.key?(:'io_cost')

      self.io_cost = attributes[:'io_cost'] if attributes[:'io_cost']

      self.temp_space = attributes[:'tempSpace'] if attributes[:'tempSpace']

      raise 'You cannot provide both :tempSpace and :temp_space' if attributes.key?(:'tempSpace') && attributes.key?(:'temp_space')

      self.temp_space = attributes[:'temp_space'] if attributes[:'temp_space']

      self.access_predicates = attributes[:'accessPredicates'] if attributes[:'accessPredicates']

      raise 'You cannot provide both :accessPredicates and :access_predicates' if attributes.key?(:'accessPredicates') && attributes.key?(:'access_predicates')

      self.access_predicates = attributes[:'access_predicates'] if attributes[:'access_predicates']

      self.filter_predicates = attributes[:'filterPredicates'] if attributes[:'filterPredicates']

      raise 'You cannot provide both :filterPredicates and :filter_predicates' if attributes.key?(:'filterPredicates') && attributes.key?(:'filter_predicates')

      self.filter_predicates = attributes[:'filter_predicates'] if attributes[:'filter_predicates']

      self.projection = attributes[:'projection'] if attributes[:'projection']

      self.qblock_name = attributes[:'qblockName'] if attributes[:'qblockName']

      raise 'You cannot provide both :qblockName and :qblock_name' if attributes.key?(:'qblockName') && attributes.key?(:'qblock_name')

      self.qblock_name = attributes[:'qblock_name'] if attributes[:'qblock_name']

      self.elapsed_time_in_sec = attributes[:'elapsedTimeInSec'] if attributes[:'elapsedTimeInSec']

      raise 'You cannot provide both :elapsedTimeInSec and :elapsed_time_in_sec' if attributes.key?(:'elapsedTimeInSec') && attributes.key?(:'elapsed_time_in_sec')

      self.elapsed_time_in_sec = attributes[:'elapsed_time_in_sec'] if attributes[:'elapsed_time_in_sec']

      self.other_xml = attributes[:'otherXML'] if attributes[:'otherXML']

      raise 'You cannot provide both :otherXML and :other_xml' if attributes.key?(:'otherXML') && attributes.key?(:'other_xml')

      self.other_xml = attributes[:'other_xml'] if attributes[:'other_xml']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        version == other.version &&
        sql_identifier == other.sql_identifier &&
        plan_hash == other.plan_hash &&
        time_collected == other.time_collected &&
        operation == other.operation &&
        remark == other.remark &&
        options == other.options &&
        object_node == other.object_node &&
        object_owner == other.object_owner &&
        object_name == other.object_name &&
        object_alias == other.object_alias &&
        object_instance == other.object_instance &&
        object_type == other.object_type &&
        optimizer == other.optimizer &&
        search_columns == other.search_columns &&
        identifier == other.identifier &&
        parent_identifier == other.parent_identifier &&
        depth == other.depth &&
        position == other.position &&
        cost == other.cost &&
        cardinality == other.cardinality &&
        bytes == other.bytes &&
        other == other.other &&
        other_tag == other.other_tag &&
        partition_start == other.partition_start &&
        partition_stop == other.partition_stop &&
        partition_identifier == other.partition_identifier &&
        distribution == other.distribution &&
        cpu_cost == other.cpu_cost &&
        io_cost == other.io_cost &&
        temp_space == other.temp_space &&
        access_predicates == other.access_predicates &&
        filter_predicates == other.filter_predicates &&
        projection == other.projection &&
        qblock_name == other.qblock_name &&
        elapsed_time_in_sec == other.elapsed_time_in_sec &&
        other_xml == other.other_xml
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
      [version, sql_identifier, plan_hash, time_collected, operation, remark, options, object_node, object_owner, object_name, object_alias, object_instance, object_type, optimizer, search_columns, identifier, parent_identifier, depth, position, cost, cardinality, bytes, other, other_tag, partition_start, partition_stop, partition_identifier, distribution, cpu_cost, io_cost, temp_space, access_predicates, filter_predicates, projection, qblock_name, elapsed_time_in_sec, other_xml].hash
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
