# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Optional parameters for Data Pump Export and Import. Refer to [Configuring Optional Initial Load Advanced Settings](https://docs.us.oracle.com/en/cloud/paas/database-migration/dmsus/working-migration-resources.html#GUID-24BD3054-FDF8-48FF-8492-636C1D4B71ED)
  #
  class DatabaseMigration::Models::DataPumpParameters
    ESTIMATE_ENUM = [
      ESTIMATE_BLOCKS = 'BLOCKS'.freeze,
      ESTIMATE_STATISTICS = 'STATISTICS'.freeze,
      ESTIMATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    TABLE_EXISTS_ACTION_ENUM = [
      TABLE_EXISTS_ACTION_TRUNCATE = 'TRUNCATE'.freeze,
      TABLE_EXISTS_ACTION_REPLACE = 'REPLACE'.freeze,
      TABLE_EXISTS_ACTION_APPEND = 'APPEND'.freeze,
      TABLE_EXISTS_ACTION_SKIP = 'SKIP'.freeze,
      TABLE_EXISTS_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Set to false to force Data Pump worker processes to run on one instance.
    #
    # @return [BOOLEAN]
    attr_accessor :is_cluster

    # Estimate size of dumps that will be generated.
    #
    # @return [String]
    attr_reader :estimate

    # IMPORT: Specifies the action to be performed when data is loaded into a preexisting table.
    #
    # @return [String]
    attr_reader :table_exists_action

    # Exclude paratemers for Export and Import.
    #
    # @return [Array<OCI::DatabaseMigration::Models::DataPumpExcludeParameters>]
    attr_accessor :exclude_parameters

    # Maximum number of worker processes that can be used for a Data Pump Import job.
    # For an Autonomous Database, ODMS will automatically query its CPU core count and set this property.
    #
    # @return [Integer]
    attr_accessor :import_parallelism_degree

    # Maximum number of worker processes that can be used for a Data Pump Export job.
    #
    # @return [Integer]
    attr_accessor :export_parallelism_degree

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_cluster': :'isCluster',
        'estimate': :'estimate',
        'table_exists_action': :'tableExistsAction',
        'exclude_parameters': :'excludeParameters',
        'import_parallelism_degree': :'importParallelismDegree',
        'export_parallelism_degree': :'exportParallelismDegree'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_cluster': :'BOOLEAN',
        'estimate': :'String',
        'table_exists_action': :'String',
        'exclude_parameters': :'Array<OCI::DatabaseMigration::Models::DataPumpExcludeParameters>',
        'import_parallelism_degree': :'Integer',
        'export_parallelism_degree': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_cluster The value to assign to the {#is_cluster} property
    # @option attributes [String] :estimate The value to assign to the {#estimate} property
    # @option attributes [String] :table_exists_action The value to assign to the {#table_exists_action} property
    # @option attributes [Array<OCI::DatabaseMigration::Models::DataPumpExcludeParameters>] :exclude_parameters The value to assign to the {#exclude_parameters} property
    # @option attributes [Integer] :import_parallelism_degree The value to assign to the {#import_parallelism_degree} property
    # @option attributes [Integer] :export_parallelism_degree The value to assign to the {#export_parallelism_degree} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_cluster = attributes[:'isCluster'] unless attributes[:'isCluster'].nil?
      self.is_cluster = true if is_cluster.nil? && !attributes.key?(:'isCluster') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isCluster and :is_cluster' if attributes.key?(:'isCluster') && attributes.key?(:'is_cluster')

      self.is_cluster = attributes[:'is_cluster'] unless attributes[:'is_cluster'].nil?
      self.is_cluster = true if is_cluster.nil? && !attributes.key?(:'isCluster') && !attributes.key?(:'is_cluster') # rubocop:disable Style/StringLiterals

      self.estimate = attributes[:'estimate'] if attributes[:'estimate']
      self.estimate = "STATISTICS" if estimate.nil? && !attributes.key?(:'estimate') # rubocop:disable Style/StringLiterals

      self.table_exists_action = attributes[:'tableExistsAction'] if attributes[:'tableExistsAction']
      self.table_exists_action = "SKIP" if table_exists_action.nil? && !attributes.key?(:'tableExistsAction') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :tableExistsAction and :table_exists_action' if attributes.key?(:'tableExistsAction') && attributes.key?(:'table_exists_action')

      self.table_exists_action = attributes[:'table_exists_action'] if attributes[:'table_exists_action']
      self.table_exists_action = "SKIP" if table_exists_action.nil? && !attributes.key?(:'tableExistsAction') && !attributes.key?(:'table_exists_action') # rubocop:disable Style/StringLiterals

      self.exclude_parameters = attributes[:'excludeParameters'] if attributes[:'excludeParameters']

      raise 'You cannot provide both :excludeParameters and :exclude_parameters' if attributes.key?(:'excludeParameters') && attributes.key?(:'exclude_parameters')

      self.exclude_parameters = attributes[:'exclude_parameters'] if attributes[:'exclude_parameters']

      self.import_parallelism_degree = attributes[:'importParallelismDegree'] if attributes[:'importParallelismDegree']

      raise 'You cannot provide both :importParallelismDegree and :import_parallelism_degree' if attributes.key?(:'importParallelismDegree') && attributes.key?(:'import_parallelism_degree')

      self.import_parallelism_degree = attributes[:'import_parallelism_degree'] if attributes[:'import_parallelism_degree']

      self.export_parallelism_degree = attributes[:'exportParallelismDegree'] if attributes[:'exportParallelismDegree']

      raise 'You cannot provide both :exportParallelismDegree and :export_parallelism_degree' if attributes.key?(:'exportParallelismDegree') && attributes.key?(:'export_parallelism_degree')

      self.export_parallelism_degree = attributes[:'export_parallelism_degree'] if attributes[:'export_parallelism_degree']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] estimate Object to be assigned
    def estimate=(estimate)
      # rubocop:disable Style/ConditionalAssignment
      if estimate && !ESTIMATE_ENUM.include?(estimate)
        OCI.logger.debug("Unknown value for 'estimate' [" + estimate + "]. Mapping to 'ESTIMATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @estimate = ESTIMATE_UNKNOWN_ENUM_VALUE
      else
        @estimate = estimate
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] table_exists_action Object to be assigned
    def table_exists_action=(table_exists_action)
      # rubocop:disable Style/ConditionalAssignment
      if table_exists_action && !TABLE_EXISTS_ACTION_ENUM.include?(table_exists_action)
        OCI.logger.debug("Unknown value for 'table_exists_action' [" + table_exists_action + "]. Mapping to 'TABLE_EXISTS_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @table_exists_action = TABLE_EXISTS_ACTION_UNKNOWN_ENUM_VALUE
      else
        @table_exists_action = table_exists_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_cluster == other.is_cluster &&
        estimate == other.estimate &&
        table_exists_action == other.table_exists_action &&
        exclude_parameters == other.exclude_parameters &&
        import_parallelism_degree == other.import_parallelism_degree &&
        export_parallelism_degree == other.export_parallelism_degree
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
      [is_cluster, estimate, table_exists_action, exclude_parameters, import_parallelism_degree, export_parallelism_degree].hash
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
