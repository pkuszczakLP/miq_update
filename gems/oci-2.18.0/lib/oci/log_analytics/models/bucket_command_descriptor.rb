# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'abstract_command_descriptor'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Command descriptor for querylanguage BUCKET command.
  #
  class LogAnalytics::Models::BucketCommandDescriptor < LogAnalytics::Models::AbstractCommandDescriptor
    # number of auto calculated ranges to compute if specified.
    #
    # @return [Integer]
    attr_accessor :max_buckets

    # Size of each numeric range if specified. Data type should match numeric field data type specified in the query string.
    #
    # @return [Float]
    attr_accessor :span

    # List of the specified numeric ranges.
    #
    # @return [Array<OCI::LogAnalytics::Models::BucketRange>]
    attr_accessor :ranges

    # Default value to use in place of null if a result does not fit into any of the specified / calculated ranges.
    #
    # @return [String]
    attr_accessor :default_value

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'display_query_string': :'displayQueryString',
        'internal_query_string': :'internalQueryString',
        'category': :'category',
        'referenced_fields': :'referencedFields',
        'declared_fields': :'declaredFields',
        'max_buckets': :'maxBuckets',
        'span': :'span',
        'ranges': :'ranges',
        'default_value': :'defaultValue'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'display_query_string': :'String',
        'internal_query_string': :'String',
        'category': :'String',
        'referenced_fields': :'Array<OCI::LogAnalytics::Models::AbstractField>',
        'declared_fields': :'Array<OCI::LogAnalytics::Models::AbstractField>',
        'max_buckets': :'Integer',
        'span': :'Float',
        'ranges': :'Array<OCI::LogAnalytics::Models::BucketRange>',
        'default_value': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_query_string The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#display_query_string #display_query_string} proprety
    # @option attributes [String] :internal_query_string The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#internal_query_string #internal_query_string} proprety
    # @option attributes [String] :category The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#category #category} proprety
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractField>] :referenced_fields The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#referenced_fields #referenced_fields} proprety
    # @option attributes [Array<OCI::LogAnalytics::Models::AbstractField>] :declared_fields The value to assign to the {OCI::LogAnalytics::Models::AbstractCommandDescriptor#declared_fields #declared_fields} proprety
    # @option attributes [Integer] :max_buckets The value to assign to the {#max_buckets} property
    # @option attributes [Float] :span The value to assign to the {#span} property
    # @option attributes [Array<OCI::LogAnalytics::Models::BucketRange>] :ranges The value to assign to the {#ranges} property
    # @option attributes [String] :default_value The value to assign to the {#default_value} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['name'] = 'BUCKET'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.max_buckets = attributes[:'maxBuckets'] if attributes[:'maxBuckets']
      self.max_buckets = 10 if max_buckets.nil? && !attributes.key?(:'maxBuckets') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :maxBuckets and :max_buckets' if attributes.key?(:'maxBuckets') && attributes.key?(:'max_buckets')

      self.max_buckets = attributes[:'max_buckets'] if attributes[:'max_buckets']
      self.max_buckets = 10 if max_buckets.nil? && !attributes.key?(:'maxBuckets') && !attributes.key?(:'max_buckets') # rubocop:disable Style/StringLiterals

      self.span = attributes[:'span'] if attributes[:'span']

      self.ranges = attributes[:'ranges'] if attributes[:'ranges']

      self.default_value = attributes[:'defaultValue'] if attributes[:'defaultValue']

      raise 'You cannot provide both :defaultValue and :default_value' if attributes.key?(:'defaultValue') && attributes.key?(:'default_value')

      self.default_value = attributes[:'default_value'] if attributes[:'default_value']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        display_query_string == other.display_query_string &&
        internal_query_string == other.internal_query_string &&
        category == other.category &&
        referenced_fields == other.referenced_fields &&
        declared_fields == other.declared_fields &&
        max_buckets == other.max_buckets &&
        span == other.span &&
        ranges == other.ranges &&
        default_value == other.default_value
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
      [name, display_query_string, internal_query_string, category, referenced_fields, declared_fields, max_buckets, span, ranges, default_value].hash
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
