# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # This is the input used to purge data
  #
  class LogAnalytics::Models::PurgeStorageDataDetails
    DATA_TYPE_ENUM = [
      DATA_TYPE_LOG = 'LOG'.freeze,
      DATA_TYPE_LOOKUP = 'LOOKUP'.freeze
    ].freeze

    # **[Required]** This is the compartment OCID under which the data will be purged and required permission will be checked
    # @return [String]
    attr_accessor :compartment_id

    # If true, purge child compartments data
    # @return [BOOLEAN]
    attr_accessor :compartment_id_in_subtree

    # **[Required]** This is the end of the purge time interval
    # @return [DateTime]
    attr_accessor :time_data_ended

    # This is the solr query used to filter data, '*' means all
    # @return [String]
    attr_accessor :purge_query_string

    # This is the type of the log data to be purged
    # @return [String]
    attr_reader :data_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'compartment_id_in_subtree': :'compartmentIdInSubtree',
        'time_data_ended': :'timeDataEnded',
        'purge_query_string': :'purgeQueryString',
        'data_type': :'dataType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'compartment_id_in_subtree': :'BOOLEAN',
        'time_data_ended': :'DateTime',
        'purge_query_string': :'String',
        'data_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :compartment_id_in_subtree The value to assign to the {#compartment_id_in_subtree} property
    # @option attributes [DateTime] :time_data_ended The value to assign to the {#time_data_ended} property
    # @option attributes [String] :purge_query_string The value to assign to the {#purge_query_string} property
    # @option attributes [String] :data_type The value to assign to the {#data_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.compartment_id_in_subtree = attributes[:'compartmentIdInSubtree'] unless attributes[:'compartmentIdInSubtree'].nil?
      self.compartment_id_in_subtree = true if compartment_id_in_subtree.nil? && !attributes.key?(:'compartmentIdInSubtree') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :compartmentIdInSubtree and :compartment_id_in_subtree' if attributes.key?(:'compartmentIdInSubtree') && attributes.key?(:'compartment_id_in_subtree')

      self.compartment_id_in_subtree = attributes[:'compartment_id_in_subtree'] unless attributes[:'compartment_id_in_subtree'].nil?
      self.compartment_id_in_subtree = true if compartment_id_in_subtree.nil? && !attributes.key?(:'compartmentIdInSubtree') && !attributes.key?(:'compartment_id_in_subtree') # rubocop:disable Style/StringLiterals

      self.time_data_ended = attributes[:'timeDataEnded'] if attributes[:'timeDataEnded']

      raise 'You cannot provide both :timeDataEnded and :time_data_ended' if attributes.key?(:'timeDataEnded') && attributes.key?(:'time_data_ended')

      self.time_data_ended = attributes[:'time_data_ended'] if attributes[:'time_data_ended']

      self.purge_query_string = attributes[:'purgeQueryString'] if attributes[:'purgeQueryString']

      raise 'You cannot provide both :purgeQueryString and :purge_query_string' if attributes.key?(:'purgeQueryString') && attributes.key?(:'purge_query_string')

      self.purge_query_string = attributes[:'purge_query_string'] if attributes[:'purge_query_string']

      self.data_type = attributes[:'dataType'] if attributes[:'dataType']

      raise 'You cannot provide both :dataType and :data_type' if attributes.key?(:'dataType') && attributes.key?(:'data_type')

      self.data_type = attributes[:'data_type'] if attributes[:'data_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] data_type Object to be assigned
    def data_type=(data_type)
      raise "Invalid value for 'data_type': this must be one of the values in DATA_TYPE_ENUM." if data_type && !DATA_TYPE_ENUM.include?(data_type)

      @data_type = data_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        compartment_id_in_subtree == other.compartment_id_in_subtree &&
        time_data_ended == other.time_data_ended &&
        purge_query_string == other.purge_query_string &&
        data_type == other.data_type
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
      [compartment_id, compartment_id_in_subtree, time_data_ended, purge_query_string, data_type].hash
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
