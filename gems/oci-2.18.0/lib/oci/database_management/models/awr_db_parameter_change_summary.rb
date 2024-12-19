# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the changes made to a single AWR database parameter.
  class DatabaseManagement::Models::AwrDbParameterChangeSummary
    # The start time of the interval.
    # @return [DateTime]
    attr_accessor :time_begin

    # The end time of the interval.
    # @return [DateTime]
    attr_accessor :time_end

    # The database instance number.
    # @return [Integer]
    attr_accessor :instance_number

    # The previous value of the database parameter.
    # @return [String]
    attr_accessor :previous_value

    # The current value of the database parameter.
    # @return [String]
    attr_accessor :value

    # **[Required]** The ID of the snapshot with the parameter value changed. The snapshot ID is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # It can be retrieved from the following endpoint:
    # /managedDatabases/{managedDatabaseId}/awrDbs/{awrDbId}/awrDbSnapshots
    #
    # @return [Integer]
    attr_accessor :snapshot_id

    # Indicates whether the parameter has been modified after instance startup:
    #  - MODIFIED - Parameter has been modified with ALTER SESSION
    #  - SYSTEM_MOD - Parameter has been modified with ALTER SYSTEM (which causes all the currently logged in sessions\u2019 values to be modified)
    #  - FALSE - Parameter has not been modified after instance startup
    #
    # @return [String]
    attr_accessor :value_modified

    # Indicates whether the parameter value in the end snapshot is the default.
    # @return [BOOLEAN]
    attr_accessor :is_default

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_begin': :'timeBegin',
        'time_end': :'timeEnd',
        'instance_number': :'instanceNumber',
        'previous_value': :'previousValue',
        'value': :'value',
        'snapshot_id': :'snapshotId',
        'value_modified': :'valueModified',
        'is_default': :'isDefault'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_begin': :'DateTime',
        'time_end': :'DateTime',
        'instance_number': :'Integer',
        'previous_value': :'String',
        'value': :'String',
        'snapshot_id': :'Integer',
        'value_modified': :'String',
        'is_default': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_begin The value to assign to the {#time_begin} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [Integer] :instance_number The value to assign to the {#instance_number} property
    # @option attributes [String] :previous_value The value to assign to the {#previous_value} property
    # @option attributes [String] :value The value to assign to the {#value} property
    # @option attributes [Integer] :snapshot_id The value to assign to the {#snapshot_id} property
    # @option attributes [String] :value_modified The value to assign to the {#value_modified} property
    # @option attributes [BOOLEAN] :is_default The value to assign to the {#is_default} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_begin = attributes[:'timeBegin'] if attributes[:'timeBegin']

      raise 'You cannot provide both :timeBegin and :time_begin' if attributes.key?(:'timeBegin') && attributes.key?(:'time_begin')

      self.time_begin = attributes[:'time_begin'] if attributes[:'time_begin']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.instance_number = attributes[:'instanceNumber'] if attributes[:'instanceNumber']

      raise 'You cannot provide both :instanceNumber and :instance_number' if attributes.key?(:'instanceNumber') && attributes.key?(:'instance_number')

      self.instance_number = attributes[:'instance_number'] if attributes[:'instance_number']

      self.previous_value = attributes[:'previousValue'] if attributes[:'previousValue']

      raise 'You cannot provide both :previousValue and :previous_value' if attributes.key?(:'previousValue') && attributes.key?(:'previous_value')

      self.previous_value = attributes[:'previous_value'] if attributes[:'previous_value']

      self.value = attributes[:'value'] if attributes[:'value']

      self.snapshot_id = attributes[:'snapshotId'] if attributes[:'snapshotId']

      raise 'You cannot provide both :snapshotId and :snapshot_id' if attributes.key?(:'snapshotId') && attributes.key?(:'snapshot_id')

      self.snapshot_id = attributes[:'snapshot_id'] if attributes[:'snapshot_id']

      self.value_modified = attributes[:'valueModified'] if attributes[:'valueModified']

      raise 'You cannot provide both :valueModified and :value_modified' if attributes.key?(:'valueModified') && attributes.key?(:'value_modified')

      self.value_modified = attributes[:'value_modified'] if attributes[:'value_modified']

      self.is_default = attributes[:'isDefault'] unless attributes[:'isDefault'].nil?

      raise 'You cannot provide both :isDefault and :is_default' if attributes.key?(:'isDefault') && attributes.key?(:'is_default')

      self.is_default = attributes[:'is_default'] unless attributes[:'is_default'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_begin == other.time_begin &&
        time_end == other.time_end &&
        instance_number == other.instance_number &&
        previous_value == other.previous_value &&
        value == other.value &&
        snapshot_id == other.snapshot_id &&
        value_modified == other.value_modified &&
        is_default == other.is_default
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
      [time_begin, time_end, instance_number, previous_value, value, snapshot_id, value_modified, is_default].hash
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
