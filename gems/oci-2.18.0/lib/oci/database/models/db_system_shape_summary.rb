# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The shape of the DB system. The shape determines resources to allocate to the DB system - CPU cores and memory for VM shapes; CPU cores, memory and storage for non-VM (or bare metal) shapes.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator.
  # If you're an administrator who needs to write policies to give users access,
  # see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Database::Models::DbSystemShapeSummary
    SHAPE_TYPE_ENUM = [
      SHAPE_TYPE_AMD = 'AMD'.freeze,
      SHAPE_TYPE_INTEL = 'INTEL'.freeze,
      SHAPE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the shape used for the DB system.
    # @return [String]
    attr_accessor :name

    # The family of the shape used for the DB system.
    # @return [String]
    attr_accessor :shape_family

    # The shape type for the virtual machine DB system. Shape type is determined by CPU hardware. Valid values are `AMD` and `INTEL`.
    # @return [String]
    attr_reader :shape_type

    # Deprecated. Use `name` instead of `shape`.
    # @return [String]
    attr_accessor :shape

    # **[Required]** The maximum number of CPU cores that can be enabled on the DB system for this shape.
    # @return [Integer]
    attr_accessor :available_core_count

    # The minimum number of CPU cores that can be enabled on the DB system for this shape.
    # @return [Integer]
    attr_accessor :minimum_core_count

    # The discrete number by which the CPU core count for this shape can be increased or decreased.
    # @return [Integer]
    attr_accessor :core_count_increment

    # The minimum number of Exadata storage servers available for the Exadata infrastructure.
    # @return [Integer]
    attr_accessor :min_storage_count

    # The maximum number of Exadata storage servers available for the Exadata infrastructure.
    # @return [Integer]
    attr_accessor :max_storage_count

    # The maximum data storage available per storage server for this shape. Only applicable to ExaCC Elastic shapes.
    # @return [Float]
    attr_accessor :available_data_storage_per_server_in_tbs

    # The maximum memory available per database node for this shape. Only applicable to ExaCC Elastic shapes.
    # @return [Integer]
    attr_accessor :available_memory_per_node_in_gbs

    # The maximum Db Node storage available per database node for this shape. Only applicable to ExaCC Elastic shapes.
    # @return [Integer]
    attr_accessor :available_db_node_per_node_in_gbs

    # The minimum number of CPU cores that can be enabled per node for this shape.
    # @return [Integer]
    attr_accessor :min_core_count_per_node

    # The maximum memory that can be enabled for this shape.
    # @return [Integer]
    attr_accessor :available_memory_in_gbs

    # The minimum memory that need be allocated per node for this shape.
    # @return [Integer]
    attr_accessor :min_memory_per_node_in_g_bs

    # The maximum Db Node storage that can be enabled for this shape.
    # @return [Integer]
    attr_accessor :available_db_node_storage_in_g_bs

    # The minimum Db Node storage that need be allocated per node for this shape.
    # @return [Integer]
    attr_accessor :min_db_node_storage_per_node_in_g_bs

    # The maximum DATA storage that can be enabled for this shape.
    # @return [Integer]
    attr_accessor :available_data_storage_in_t_bs

    # The minimum data storage that need be allocated for this shape.
    # @return [Integer]
    attr_accessor :min_data_storage_in_t_bs

    # The minimum number of database nodes available for this shape.
    # @return [Integer]
    attr_accessor :minimum_node_count

    # The maximum number of database nodes available for this shape.
    # @return [Integer]
    attr_accessor :maximum_node_count

    # The maximum number of CPU cores per database node that can be enabled for this shape. Only applicable to the flex Exadata shape and ExaCC Elastic shapes.
    # @return [Integer]
    attr_accessor :available_core_count_per_node

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'shape_family': :'shapeFamily',
        'shape_type': :'shapeType',
        'shape': :'shape',
        'available_core_count': :'availableCoreCount',
        'minimum_core_count': :'minimumCoreCount',
        'core_count_increment': :'coreCountIncrement',
        'min_storage_count': :'minStorageCount',
        'max_storage_count': :'maxStorageCount',
        'available_data_storage_per_server_in_tbs': :'availableDataStoragePerServerInTBs',
        'available_memory_per_node_in_gbs': :'availableMemoryPerNodeInGBs',
        'available_db_node_per_node_in_gbs': :'availableDbNodePerNodeInGBs',
        'min_core_count_per_node': :'minCoreCountPerNode',
        'available_memory_in_gbs': :'availableMemoryInGBs',
        'min_memory_per_node_in_g_bs': :'minMemoryPerNodeInGBs',
        'available_db_node_storage_in_g_bs': :'availableDbNodeStorageInGBs',
        'min_db_node_storage_per_node_in_g_bs': :'minDbNodeStoragePerNodeInGBs',
        'available_data_storage_in_t_bs': :'availableDataStorageInTBs',
        'min_data_storage_in_t_bs': :'minDataStorageInTBs',
        'minimum_node_count': :'minimumNodeCount',
        'maximum_node_count': :'maximumNodeCount',
        'available_core_count_per_node': :'availableCoreCountPerNode'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'shape_family': :'String',
        'shape_type': :'String',
        'shape': :'String',
        'available_core_count': :'Integer',
        'minimum_core_count': :'Integer',
        'core_count_increment': :'Integer',
        'min_storage_count': :'Integer',
        'max_storage_count': :'Integer',
        'available_data_storage_per_server_in_tbs': :'Float',
        'available_memory_per_node_in_gbs': :'Integer',
        'available_db_node_per_node_in_gbs': :'Integer',
        'min_core_count_per_node': :'Integer',
        'available_memory_in_gbs': :'Integer',
        'min_memory_per_node_in_g_bs': :'Integer',
        'available_db_node_storage_in_g_bs': :'Integer',
        'min_db_node_storage_per_node_in_g_bs': :'Integer',
        'available_data_storage_in_t_bs': :'Integer',
        'min_data_storage_in_t_bs': :'Integer',
        'minimum_node_count': :'Integer',
        'maximum_node_count': :'Integer',
        'available_core_count_per_node': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :shape_family The value to assign to the {#shape_family} property
    # @option attributes [String] :shape_type The value to assign to the {#shape_type} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [Integer] :available_core_count The value to assign to the {#available_core_count} property
    # @option attributes [Integer] :minimum_core_count The value to assign to the {#minimum_core_count} property
    # @option attributes [Integer] :core_count_increment The value to assign to the {#core_count_increment} property
    # @option attributes [Integer] :min_storage_count The value to assign to the {#min_storage_count} property
    # @option attributes [Integer] :max_storage_count The value to assign to the {#max_storage_count} property
    # @option attributes [Float] :available_data_storage_per_server_in_tbs The value to assign to the {#available_data_storage_per_server_in_tbs} property
    # @option attributes [Integer] :available_memory_per_node_in_gbs The value to assign to the {#available_memory_per_node_in_gbs} property
    # @option attributes [Integer] :available_db_node_per_node_in_gbs The value to assign to the {#available_db_node_per_node_in_gbs} property
    # @option attributes [Integer] :min_core_count_per_node The value to assign to the {#min_core_count_per_node} property
    # @option attributes [Integer] :available_memory_in_gbs The value to assign to the {#available_memory_in_gbs} property
    # @option attributes [Integer] :min_memory_per_node_in_g_bs The value to assign to the {#min_memory_per_node_in_g_bs} property
    # @option attributes [Integer] :available_db_node_storage_in_g_bs The value to assign to the {#available_db_node_storage_in_g_bs} property
    # @option attributes [Integer] :min_db_node_storage_per_node_in_g_bs The value to assign to the {#min_db_node_storage_per_node_in_g_bs} property
    # @option attributes [Integer] :available_data_storage_in_t_bs The value to assign to the {#available_data_storage_in_t_bs} property
    # @option attributes [Integer] :min_data_storage_in_t_bs The value to assign to the {#min_data_storage_in_t_bs} property
    # @option attributes [Integer] :minimum_node_count The value to assign to the {#minimum_node_count} property
    # @option attributes [Integer] :maximum_node_count The value to assign to the {#maximum_node_count} property
    # @option attributes [Integer] :available_core_count_per_node The value to assign to the {#available_core_count_per_node} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.shape_family = attributes[:'shapeFamily'] if attributes[:'shapeFamily']

      raise 'You cannot provide both :shapeFamily and :shape_family' if attributes.key?(:'shapeFamily') && attributes.key?(:'shape_family')

      self.shape_family = attributes[:'shape_family'] if attributes[:'shape_family']

      self.shape_type = attributes[:'shapeType'] if attributes[:'shapeType']

      raise 'You cannot provide both :shapeType and :shape_type' if attributes.key?(:'shapeType') && attributes.key?(:'shape_type')

      self.shape_type = attributes[:'shape_type'] if attributes[:'shape_type']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.available_core_count = attributes[:'availableCoreCount'] if attributes[:'availableCoreCount']

      raise 'You cannot provide both :availableCoreCount and :available_core_count' if attributes.key?(:'availableCoreCount') && attributes.key?(:'available_core_count')

      self.available_core_count = attributes[:'available_core_count'] if attributes[:'available_core_count']

      self.minimum_core_count = attributes[:'minimumCoreCount'] if attributes[:'minimumCoreCount']

      raise 'You cannot provide both :minimumCoreCount and :minimum_core_count' if attributes.key?(:'minimumCoreCount') && attributes.key?(:'minimum_core_count')

      self.minimum_core_count = attributes[:'minimum_core_count'] if attributes[:'minimum_core_count']

      self.core_count_increment = attributes[:'coreCountIncrement'] if attributes[:'coreCountIncrement']

      raise 'You cannot provide both :coreCountIncrement and :core_count_increment' if attributes.key?(:'coreCountIncrement') && attributes.key?(:'core_count_increment')

      self.core_count_increment = attributes[:'core_count_increment'] if attributes[:'core_count_increment']

      self.min_storage_count = attributes[:'minStorageCount'] if attributes[:'minStorageCount']

      raise 'You cannot provide both :minStorageCount and :min_storage_count' if attributes.key?(:'minStorageCount') && attributes.key?(:'min_storage_count')

      self.min_storage_count = attributes[:'min_storage_count'] if attributes[:'min_storage_count']

      self.max_storage_count = attributes[:'maxStorageCount'] if attributes[:'maxStorageCount']

      raise 'You cannot provide both :maxStorageCount and :max_storage_count' if attributes.key?(:'maxStorageCount') && attributes.key?(:'max_storage_count')

      self.max_storage_count = attributes[:'max_storage_count'] if attributes[:'max_storage_count']

      self.available_data_storage_per_server_in_tbs = attributes[:'availableDataStoragePerServerInTBs'] if attributes[:'availableDataStoragePerServerInTBs']

      raise 'You cannot provide both :availableDataStoragePerServerInTBs and :available_data_storage_per_server_in_tbs' if attributes.key?(:'availableDataStoragePerServerInTBs') && attributes.key?(:'available_data_storage_per_server_in_tbs')

      self.available_data_storage_per_server_in_tbs = attributes[:'available_data_storage_per_server_in_tbs'] if attributes[:'available_data_storage_per_server_in_tbs']

      self.available_memory_per_node_in_gbs = attributes[:'availableMemoryPerNodeInGBs'] if attributes[:'availableMemoryPerNodeInGBs']

      raise 'You cannot provide both :availableMemoryPerNodeInGBs and :available_memory_per_node_in_gbs' if attributes.key?(:'availableMemoryPerNodeInGBs') && attributes.key?(:'available_memory_per_node_in_gbs')

      self.available_memory_per_node_in_gbs = attributes[:'available_memory_per_node_in_gbs'] if attributes[:'available_memory_per_node_in_gbs']

      self.available_db_node_per_node_in_gbs = attributes[:'availableDbNodePerNodeInGBs'] if attributes[:'availableDbNodePerNodeInGBs']

      raise 'You cannot provide both :availableDbNodePerNodeInGBs and :available_db_node_per_node_in_gbs' if attributes.key?(:'availableDbNodePerNodeInGBs') && attributes.key?(:'available_db_node_per_node_in_gbs')

      self.available_db_node_per_node_in_gbs = attributes[:'available_db_node_per_node_in_gbs'] if attributes[:'available_db_node_per_node_in_gbs']

      self.min_core_count_per_node = attributes[:'minCoreCountPerNode'] if attributes[:'minCoreCountPerNode']

      raise 'You cannot provide both :minCoreCountPerNode and :min_core_count_per_node' if attributes.key?(:'minCoreCountPerNode') && attributes.key?(:'min_core_count_per_node')

      self.min_core_count_per_node = attributes[:'min_core_count_per_node'] if attributes[:'min_core_count_per_node']

      self.available_memory_in_gbs = attributes[:'availableMemoryInGBs'] if attributes[:'availableMemoryInGBs']

      raise 'You cannot provide both :availableMemoryInGBs and :available_memory_in_gbs' if attributes.key?(:'availableMemoryInGBs') && attributes.key?(:'available_memory_in_gbs')

      self.available_memory_in_gbs = attributes[:'available_memory_in_gbs'] if attributes[:'available_memory_in_gbs']

      self.min_memory_per_node_in_g_bs = attributes[:'minMemoryPerNodeInGBs'] if attributes[:'minMemoryPerNodeInGBs']

      raise 'You cannot provide both :minMemoryPerNodeInGBs and :min_memory_per_node_in_g_bs' if attributes.key?(:'minMemoryPerNodeInGBs') && attributes.key?(:'min_memory_per_node_in_g_bs')

      self.min_memory_per_node_in_g_bs = attributes[:'min_memory_per_node_in_g_bs'] if attributes[:'min_memory_per_node_in_g_bs']

      self.available_db_node_storage_in_g_bs = attributes[:'availableDbNodeStorageInGBs'] if attributes[:'availableDbNodeStorageInGBs']

      raise 'You cannot provide both :availableDbNodeStorageInGBs and :available_db_node_storage_in_g_bs' if attributes.key?(:'availableDbNodeStorageInGBs') && attributes.key?(:'available_db_node_storage_in_g_bs')

      self.available_db_node_storage_in_g_bs = attributes[:'available_db_node_storage_in_g_bs'] if attributes[:'available_db_node_storage_in_g_bs']

      self.min_db_node_storage_per_node_in_g_bs = attributes[:'minDbNodeStoragePerNodeInGBs'] if attributes[:'minDbNodeStoragePerNodeInGBs']

      raise 'You cannot provide both :minDbNodeStoragePerNodeInGBs and :min_db_node_storage_per_node_in_g_bs' if attributes.key?(:'minDbNodeStoragePerNodeInGBs') && attributes.key?(:'min_db_node_storage_per_node_in_g_bs')

      self.min_db_node_storage_per_node_in_g_bs = attributes[:'min_db_node_storage_per_node_in_g_bs'] if attributes[:'min_db_node_storage_per_node_in_g_bs']

      self.available_data_storage_in_t_bs = attributes[:'availableDataStorageInTBs'] if attributes[:'availableDataStorageInTBs']

      raise 'You cannot provide both :availableDataStorageInTBs and :available_data_storage_in_t_bs' if attributes.key?(:'availableDataStorageInTBs') && attributes.key?(:'available_data_storage_in_t_bs')

      self.available_data_storage_in_t_bs = attributes[:'available_data_storage_in_t_bs'] if attributes[:'available_data_storage_in_t_bs']

      self.min_data_storage_in_t_bs = attributes[:'minDataStorageInTBs'] if attributes[:'minDataStorageInTBs']

      raise 'You cannot provide both :minDataStorageInTBs and :min_data_storage_in_t_bs' if attributes.key?(:'minDataStorageInTBs') && attributes.key?(:'min_data_storage_in_t_bs')

      self.min_data_storage_in_t_bs = attributes[:'min_data_storage_in_t_bs'] if attributes[:'min_data_storage_in_t_bs']

      self.minimum_node_count = attributes[:'minimumNodeCount'] if attributes[:'minimumNodeCount']

      raise 'You cannot provide both :minimumNodeCount and :minimum_node_count' if attributes.key?(:'minimumNodeCount') && attributes.key?(:'minimum_node_count')

      self.minimum_node_count = attributes[:'minimum_node_count'] if attributes[:'minimum_node_count']

      self.maximum_node_count = attributes[:'maximumNodeCount'] if attributes[:'maximumNodeCount']

      raise 'You cannot provide both :maximumNodeCount and :maximum_node_count' if attributes.key?(:'maximumNodeCount') && attributes.key?(:'maximum_node_count')

      self.maximum_node_count = attributes[:'maximum_node_count'] if attributes[:'maximum_node_count']

      self.available_core_count_per_node = attributes[:'availableCoreCountPerNode'] if attributes[:'availableCoreCountPerNode']

      raise 'You cannot provide both :availableCoreCountPerNode and :available_core_count_per_node' if attributes.key?(:'availableCoreCountPerNode') && attributes.key?(:'available_core_count_per_node')

      self.available_core_count_per_node = attributes[:'available_core_count_per_node'] if attributes[:'available_core_count_per_node']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] shape_type Object to be assigned
    def shape_type=(shape_type)
      # rubocop:disable Style/ConditionalAssignment
      if shape_type && !SHAPE_TYPE_ENUM.include?(shape_type)
        OCI.logger.debug("Unknown value for 'shape_type' [" + shape_type + "]. Mapping to 'SHAPE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @shape_type = SHAPE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @shape_type = shape_type
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
        shape_family == other.shape_family &&
        shape_type == other.shape_type &&
        shape == other.shape &&
        available_core_count == other.available_core_count &&
        minimum_core_count == other.minimum_core_count &&
        core_count_increment == other.core_count_increment &&
        min_storage_count == other.min_storage_count &&
        max_storage_count == other.max_storage_count &&
        available_data_storage_per_server_in_tbs == other.available_data_storage_per_server_in_tbs &&
        available_memory_per_node_in_gbs == other.available_memory_per_node_in_gbs &&
        available_db_node_per_node_in_gbs == other.available_db_node_per_node_in_gbs &&
        min_core_count_per_node == other.min_core_count_per_node &&
        available_memory_in_gbs == other.available_memory_in_gbs &&
        min_memory_per_node_in_g_bs == other.min_memory_per_node_in_g_bs &&
        available_db_node_storage_in_g_bs == other.available_db_node_storage_in_g_bs &&
        min_db_node_storage_per_node_in_g_bs == other.min_db_node_storage_per_node_in_g_bs &&
        available_data_storage_in_t_bs == other.available_data_storage_in_t_bs &&
        min_data_storage_in_t_bs == other.min_data_storage_in_t_bs &&
        minimum_node_count == other.minimum_node_count &&
        maximum_node_count == other.maximum_node_count &&
        available_core_count_per_node == other.available_core_count_per_node
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
      [name, shape_family, shape_type, shape, available_core_count, minimum_core_count, core_count_increment, min_storage_count, max_storage_count, available_data_storage_per_server_in_tbs, available_memory_per_node_in_gbs, available_db_node_per_node_in_gbs, min_core_count_per_node, available_memory_in_gbs, min_memory_per_node_in_g_bs, available_db_node_storage_in_g_bs, min_db_node_storage_per_node_in_g_bs, available_data_storage_in_t_bs, min_data_storage_in_t_bs, minimum_node_count, maximum_node_count, available_core_count_per_node].hash
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