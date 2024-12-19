# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A step in the SQL execution plan.
  class DatabaseManagement::Models::SqlTuningTaskSqlExecutionPlanStep
    # The numerical representation of the SQL execution plan.
    # @return [Integer]
    attr_accessor :plan_hash_value

    # The identification number of a step in the SQL execution plan. This is unique within the SQL execution plan.
    # This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @return [Integer]
    attr_accessor :step_id

    # The ID of the next step that operates on the results of this step.
    # This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @return [Integer]
    attr_accessor :parent_step_id

    # The order of processing for steps with the same parent ID.
    # @return [Integer]
    attr_accessor :position

    # The name of the operation performed at this step.
    # @return [String]
    attr_accessor :operation

    # The options used for the operation performed at this step.
    # @return [String]
    attr_accessor :options

    # The current mode of the optimizer, such as all_rows, first_rows_n (where n = 1, 10, 100, 1000, and so on).
    # @return [String]
    attr_accessor :optimizer_mode

    # The cost of the current operation estimated by the cost-based optimizer (CBO).
    # @return [Float]
    attr_accessor :cost

    # The number of rows returned by the current operation (estimated by the CBO).
    # @return [Integer]
    attr_accessor :cardinality

    # The number of bytes returned by the current operation.
    # @return [Integer]
    attr_accessor :bytes

    # The CPU cost of the current operation.
    # @return [Float]
    attr_accessor :cpu_cost

    # The I/O cost of the current operation.
    # @return [Float]
    attr_accessor :io_cost

    # The temporary space usage (in bytes) of the operation (sort or hash-join) as estimated by the CBO.
    # @return [Integer]
    attr_accessor :temp_space

    # The elapsed time (in seconds) of the operation as estimated by the CBO.
    # @return [Integer]
    attr_accessor :time

    # The name of the database link used to reference the object.
    # @return [String]
    attr_accessor :object_node

    # The owner of the object.
    # @return [String]
    attr_accessor :object_owner

    # The name of the object.
    # @return [String]
    attr_accessor :object_name

    # The numbered position of the object name in the original SQL statement.
    # @return [Integer]
    attr_accessor :object_position

    # The descriptive modifier that further describes the type of object.
    # @return [String]
    attr_accessor :object_type

    # A step may get data from a range of partitions of a partitioned object, such as table or index,
    # based on predicates and sorting order. The partionStart is the starting partition of the range.
    # The partitionStop is the ending partition of the range.
    #
    # @return [String]
    attr_accessor :partition_start

    # A step may get data from a range of partitions of a partitioned object, such as table or index,
    # based on predicates and sorting order. The partionStart is the starting partition of the range.
    # The partitionStop is the ending partition of the range.
    #
    # @return [String]
    attr_accessor :partition_stop

    # The ID of the step in the execution plan that has computed the pair of values of partitionStart and partitionStop.
    #
    # @return [Integer]
    attr_accessor :partition_id

    # The place for comments that can be added to the steps of the execution plan.
    # @return [String]
    attr_accessor :remarks

    # Number of index columns with start and stop keys (that is, the number of columns with matching predicates).
    #
    # @return [Integer]
    attr_accessor :number_of_search_column

    # Information about parallel execution servers and parallel queries
    # @return [String]
    attr_accessor :other

    # Describes the function of the SQL text in the OTHER column.
    # @return [String]
    attr_accessor :other_tag

    # The text string identifying the type of execution plan.
    # @return [String]
    attr_accessor :attribute

    # The predicates used to locate rows in an access structure. For example,
    # start or stop predicates for an index range scan.
    #
    # @return [String]
    attr_accessor :access_predicates

    # The predicates used to filter rows before producing them.
    # @return [String]
    attr_accessor :filter_predicates

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_hash_value': :'planHashValue',
        'step_id': :'stepId',
        'parent_step_id': :'parentStepId',
        'position': :'position',
        'operation': :'operation',
        'options': :'options',
        'optimizer_mode': :'optimizerMode',
        'cost': :'cost',
        'cardinality': :'cardinality',
        'bytes': :'bytes',
        'cpu_cost': :'cpuCost',
        'io_cost': :'ioCost',
        'temp_space': :'tempSpace',
        'time': :'time',
        'object_node': :'objectNode',
        'object_owner': :'objectOwner',
        'object_name': :'objectName',
        'object_position': :'objectPosition',
        'object_type': :'objectType',
        'partition_start': :'partitionStart',
        'partition_stop': :'partitionStop',
        'partition_id': :'partitionId',
        'remarks': :'remarks',
        'number_of_search_column': :'numberOfSearchColumn',
        'other': :'other',
        'other_tag': :'otherTag',
        'attribute': :'attribute',
        'access_predicates': :'accessPredicates',
        'filter_predicates': :'filterPredicates'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'plan_hash_value': :'Integer',
        'step_id': :'Integer',
        'parent_step_id': :'Integer',
        'position': :'Integer',
        'operation': :'String',
        'options': :'String',
        'optimizer_mode': :'String',
        'cost': :'Float',
        'cardinality': :'Integer',
        'bytes': :'Integer',
        'cpu_cost': :'Float',
        'io_cost': :'Float',
        'temp_space': :'Integer',
        'time': :'Integer',
        'object_node': :'String',
        'object_owner': :'String',
        'object_name': :'String',
        'object_position': :'Integer',
        'object_type': :'String',
        'partition_start': :'String',
        'partition_stop': :'String',
        'partition_id': :'Integer',
        'remarks': :'String',
        'number_of_search_column': :'Integer',
        'other': :'String',
        'other_tag': :'String',
        'attribute': :'String',
        'access_predicates': :'String',
        'filter_predicates': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :plan_hash_value The value to assign to the {#plan_hash_value} property
    # @option attributes [Integer] :step_id The value to assign to the {#step_id} property
    # @option attributes [Integer] :parent_step_id The value to assign to the {#parent_step_id} property
    # @option attributes [Integer] :position The value to assign to the {#position} property
    # @option attributes [String] :operation The value to assign to the {#operation} property
    # @option attributes [String] :options The value to assign to the {#options} property
    # @option attributes [String] :optimizer_mode The value to assign to the {#optimizer_mode} property
    # @option attributes [Float] :cost The value to assign to the {#cost} property
    # @option attributes [Integer] :cardinality The value to assign to the {#cardinality} property
    # @option attributes [Integer] :bytes The value to assign to the {#bytes} property
    # @option attributes [Float] :cpu_cost The value to assign to the {#cpu_cost} property
    # @option attributes [Float] :io_cost The value to assign to the {#io_cost} property
    # @option attributes [Integer] :temp_space The value to assign to the {#temp_space} property
    # @option attributes [Integer] :time The value to assign to the {#time} property
    # @option attributes [String] :object_node The value to assign to the {#object_node} property
    # @option attributes [String] :object_owner The value to assign to the {#object_owner} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [Integer] :object_position The value to assign to the {#object_position} property
    # @option attributes [String] :object_type The value to assign to the {#object_type} property
    # @option attributes [String] :partition_start The value to assign to the {#partition_start} property
    # @option attributes [String] :partition_stop The value to assign to the {#partition_stop} property
    # @option attributes [Integer] :partition_id The value to assign to the {#partition_id} property
    # @option attributes [String] :remarks The value to assign to the {#remarks} property
    # @option attributes [Integer] :number_of_search_column The value to assign to the {#number_of_search_column} property
    # @option attributes [String] :other The value to assign to the {#other} property
    # @option attributes [String] :other_tag The value to assign to the {#other_tag} property
    # @option attributes [String] :attribute The value to assign to the {#attribute} property
    # @option attributes [String] :access_predicates The value to assign to the {#access_predicates} property
    # @option attributes [String] :filter_predicates The value to assign to the {#filter_predicates} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.plan_hash_value = attributes[:'planHashValue'] if attributes[:'planHashValue']

      raise 'You cannot provide both :planHashValue and :plan_hash_value' if attributes.key?(:'planHashValue') && attributes.key?(:'plan_hash_value')

      self.plan_hash_value = attributes[:'plan_hash_value'] if attributes[:'plan_hash_value']

      self.step_id = attributes[:'stepId'] if attributes[:'stepId']

      raise 'You cannot provide both :stepId and :step_id' if attributes.key?(:'stepId') && attributes.key?(:'step_id')

      self.step_id = attributes[:'step_id'] if attributes[:'step_id']

      self.parent_step_id = attributes[:'parentStepId'] if attributes[:'parentStepId']

      raise 'You cannot provide both :parentStepId and :parent_step_id' if attributes.key?(:'parentStepId') && attributes.key?(:'parent_step_id')

      self.parent_step_id = attributes[:'parent_step_id'] if attributes[:'parent_step_id']

      self.position = attributes[:'position'] if attributes[:'position']

      self.operation = attributes[:'operation'] if attributes[:'operation']

      self.options = attributes[:'options'] if attributes[:'options']

      self.optimizer_mode = attributes[:'optimizerMode'] if attributes[:'optimizerMode']

      raise 'You cannot provide both :optimizerMode and :optimizer_mode' if attributes.key?(:'optimizerMode') && attributes.key?(:'optimizer_mode')

      self.optimizer_mode = attributes[:'optimizer_mode'] if attributes[:'optimizer_mode']

      self.cost = attributes[:'cost'] if attributes[:'cost']

      self.cardinality = attributes[:'cardinality'] if attributes[:'cardinality']

      self.bytes = attributes[:'bytes'] if attributes[:'bytes']

      self.cpu_cost = attributes[:'cpuCost'] if attributes[:'cpuCost']

      raise 'You cannot provide both :cpuCost and :cpu_cost' if attributes.key?(:'cpuCost') && attributes.key?(:'cpu_cost')

      self.cpu_cost = attributes[:'cpu_cost'] if attributes[:'cpu_cost']

      self.io_cost = attributes[:'ioCost'] if attributes[:'ioCost']

      raise 'You cannot provide both :ioCost and :io_cost' if attributes.key?(:'ioCost') && attributes.key?(:'io_cost')

      self.io_cost = attributes[:'io_cost'] if attributes[:'io_cost']

      self.temp_space = attributes[:'tempSpace'] if attributes[:'tempSpace']

      raise 'You cannot provide both :tempSpace and :temp_space' if attributes.key?(:'tempSpace') && attributes.key?(:'temp_space')

      self.temp_space = attributes[:'temp_space'] if attributes[:'temp_space']

      self.time = attributes[:'time'] if attributes[:'time']

      self.object_node = attributes[:'objectNode'] if attributes[:'objectNode']

      raise 'You cannot provide both :objectNode and :object_node' if attributes.key?(:'objectNode') && attributes.key?(:'object_node')

      self.object_node = attributes[:'object_node'] if attributes[:'object_node']

      self.object_owner = attributes[:'objectOwner'] if attributes[:'objectOwner']

      raise 'You cannot provide both :objectOwner and :object_owner' if attributes.key?(:'objectOwner') && attributes.key?(:'object_owner')

      self.object_owner = attributes[:'object_owner'] if attributes[:'object_owner']

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.object_position = attributes[:'objectPosition'] if attributes[:'objectPosition']

      raise 'You cannot provide both :objectPosition and :object_position' if attributes.key?(:'objectPosition') && attributes.key?(:'object_position')

      self.object_position = attributes[:'object_position'] if attributes[:'object_position']

      self.object_type = attributes[:'objectType'] if attributes[:'objectType']

      raise 'You cannot provide both :objectType and :object_type' if attributes.key?(:'objectType') && attributes.key?(:'object_type')

      self.object_type = attributes[:'object_type'] if attributes[:'object_type']

      self.partition_start = attributes[:'partitionStart'] if attributes[:'partitionStart']

      raise 'You cannot provide both :partitionStart and :partition_start' if attributes.key?(:'partitionStart') && attributes.key?(:'partition_start')

      self.partition_start = attributes[:'partition_start'] if attributes[:'partition_start']

      self.partition_stop = attributes[:'partitionStop'] if attributes[:'partitionStop']

      raise 'You cannot provide both :partitionStop and :partition_stop' if attributes.key?(:'partitionStop') && attributes.key?(:'partition_stop')

      self.partition_stop = attributes[:'partition_stop'] if attributes[:'partition_stop']

      self.partition_id = attributes[:'partitionId'] if attributes[:'partitionId']

      raise 'You cannot provide both :partitionId and :partition_id' if attributes.key?(:'partitionId') && attributes.key?(:'partition_id')

      self.partition_id = attributes[:'partition_id'] if attributes[:'partition_id']

      self.remarks = attributes[:'remarks'] if attributes[:'remarks']

      self.number_of_search_column = attributes[:'numberOfSearchColumn'] if attributes[:'numberOfSearchColumn']

      raise 'You cannot provide both :numberOfSearchColumn and :number_of_search_column' if attributes.key?(:'numberOfSearchColumn') && attributes.key?(:'number_of_search_column')

      self.number_of_search_column = attributes[:'number_of_search_column'] if attributes[:'number_of_search_column']

      self.other = attributes[:'other'] if attributes[:'other']

      self.other_tag = attributes[:'otherTag'] if attributes[:'otherTag']

      raise 'You cannot provide both :otherTag and :other_tag' if attributes.key?(:'otherTag') && attributes.key?(:'other_tag')

      self.other_tag = attributes[:'other_tag'] if attributes[:'other_tag']

      self.attribute = attributes[:'attribute'] if attributes[:'attribute']

      self.access_predicates = attributes[:'accessPredicates'] if attributes[:'accessPredicates']

      raise 'You cannot provide both :accessPredicates and :access_predicates' if attributes.key?(:'accessPredicates') && attributes.key?(:'access_predicates')

      self.access_predicates = attributes[:'access_predicates'] if attributes[:'access_predicates']

      self.filter_predicates = attributes[:'filterPredicates'] if attributes[:'filterPredicates']

      raise 'You cannot provide both :filterPredicates and :filter_predicates' if attributes.key?(:'filterPredicates') && attributes.key?(:'filter_predicates')

      self.filter_predicates = attributes[:'filter_predicates'] if attributes[:'filter_predicates']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        plan_hash_value == other.plan_hash_value &&
        step_id == other.step_id &&
        parent_step_id == other.parent_step_id &&
        position == other.position &&
        operation == other.operation &&
        options == other.options &&
        optimizer_mode == other.optimizer_mode &&
        cost == other.cost &&
        cardinality == other.cardinality &&
        bytes == other.bytes &&
        cpu_cost == other.cpu_cost &&
        io_cost == other.io_cost &&
        temp_space == other.temp_space &&
        time == other.time &&
        object_node == other.object_node &&
        object_owner == other.object_owner &&
        object_name == other.object_name &&
        object_position == other.object_position &&
        object_type == other.object_type &&
        partition_start == other.partition_start &&
        partition_stop == other.partition_stop &&
        partition_id == other.partition_id &&
        remarks == other.remarks &&
        number_of_search_column == other.number_of_search_column &&
        other == other.other &&
        other_tag == other.other_tag &&
        attribute == other.attribute &&
        access_predicates == other.access_predicates &&
        filter_predicates == other.filter_predicates
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
      [plan_hash_value, step_id, parent_step_id, position, operation, options, optimizer_mode, cost, cardinality, bytes, cpu_cost, io_cost, temp_space, time, object_node, object_owner, object_name, object_position, object_type, partition_start, partition_stop, partition_id, remarks, number_of_search_column, other, other_tag, attribute, access_predicates, filter_predicates].hash
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
