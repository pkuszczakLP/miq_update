# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Search request object.
  class Loggingsearch::Models::SearchLogsDetails
    # **[Required]** Start filter log's date and time, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_start

    # **[Required]** End filter log's date and time, in the format defined by RFC3339.
    #
    # @return [DateTime]
    attr_accessor :time_end

    # **[Required]** Query corresponding to the search operation. This query is parsed and validated before execution and
    # should follow the specification. For more information on the query language specification, see
    # [Logging Query Language Specification](https://docs.cloud.oracle.com/Content/Logging/Reference/query_language_specification.htm).
    #
    # @return [String]
    attr_accessor :search_query

    # Whether to return field schema information for the log stream specified in searchQuery.
    #
    # @return [BOOLEAN]
    attr_accessor :is_return_field_info

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'time_start': :'timeStart',
        'time_end': :'timeEnd',
        'search_query': :'searchQuery',
        'is_return_field_info': :'isReturnFieldInfo'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'time_start': :'DateTime',
        'time_end': :'DateTime',
        'search_query': :'String',
        'is_return_field_info': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_start The value to assign to the {#time_start} property
    # @option attributes [DateTime] :time_end The value to assign to the {#time_end} property
    # @option attributes [String] :search_query The value to assign to the {#search_query} property
    # @option attributes [BOOLEAN] :is_return_field_info The value to assign to the {#is_return_field_info} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.time_start = attributes[:'timeStart'] if attributes[:'timeStart']

      raise 'You cannot provide both :timeStart and :time_start' if attributes.key?(:'timeStart') && attributes.key?(:'time_start')

      self.time_start = attributes[:'time_start'] if attributes[:'time_start']

      self.time_end = attributes[:'timeEnd'] if attributes[:'timeEnd']

      raise 'You cannot provide both :timeEnd and :time_end' if attributes.key?(:'timeEnd') && attributes.key?(:'time_end')

      self.time_end = attributes[:'time_end'] if attributes[:'time_end']

      self.search_query = attributes[:'searchQuery'] if attributes[:'searchQuery']

      raise 'You cannot provide both :searchQuery and :search_query' if attributes.key?(:'searchQuery') && attributes.key?(:'search_query')

      self.search_query = attributes[:'search_query'] if attributes[:'search_query']

      self.is_return_field_info = attributes[:'isReturnFieldInfo'] unless attributes[:'isReturnFieldInfo'].nil?

      raise 'You cannot provide both :isReturnFieldInfo and :is_return_field_info' if attributes.key?(:'isReturnFieldInfo') && attributes.key?(:'is_return_field_info')

      self.is_return_field_info = attributes[:'is_return_field_info'] unless attributes[:'is_return_field_info'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        time_start == other.time_start &&
        time_end == other.time_end &&
        search_query == other.search_query &&
        is_return_field_info == other.is_return_field_info
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
      [time_start, time_end, search_query, is_return_field_info].hash
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
