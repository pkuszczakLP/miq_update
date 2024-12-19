# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsImportCustomContent
  class LogAnalytics::Models::LogAnalyticsImportCustomContent
    # The parser names.
    # @return [Array<String>]
    attr_accessor :parser_names

    # The source names.
    # @return [Array<String>]
    attr_accessor :source_names

    # The field names.
    # @return [Array<String>]
    attr_accessor :field_names

    # @return [OCI::LogAnalytics::Models::LogAnalyticsImportCustomChangeList]
    attr_accessor :change_list

    # The content name.
    # @return [String]
    attr_accessor :content_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_names': :'parserNames',
        'source_names': :'sourceNames',
        'field_names': :'fieldNames',
        'change_list': :'changeList',
        'content_name': :'contentName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_names': :'Array<String>',
        'source_names': :'Array<String>',
        'field_names': :'Array<String>',
        'change_list': :'OCI::LogAnalytics::Models::LogAnalyticsImportCustomChangeList',
        'content_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :parser_names The value to assign to the {#parser_names} property
    # @option attributes [Array<String>] :source_names The value to assign to the {#source_names} property
    # @option attributes [Array<String>] :field_names The value to assign to the {#field_names} property
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsImportCustomChangeList] :change_list The value to assign to the {#change_list} property
    # @option attributes [String] :content_name The value to assign to the {#content_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.parser_names = attributes[:'parserNames'] if attributes[:'parserNames']

      raise 'You cannot provide both :parserNames and :parser_names' if attributes.key?(:'parserNames') && attributes.key?(:'parser_names')

      self.parser_names = attributes[:'parser_names'] if attributes[:'parser_names']

      self.source_names = attributes[:'sourceNames'] if attributes[:'sourceNames']

      raise 'You cannot provide both :sourceNames and :source_names' if attributes.key?(:'sourceNames') && attributes.key?(:'source_names')

      self.source_names = attributes[:'source_names'] if attributes[:'source_names']

      self.field_names = attributes[:'fieldNames'] if attributes[:'fieldNames']

      raise 'You cannot provide both :fieldNames and :field_names' if attributes.key?(:'fieldNames') && attributes.key?(:'field_names')

      self.field_names = attributes[:'field_names'] if attributes[:'field_names']

      self.change_list = attributes[:'changeList'] if attributes[:'changeList']

      raise 'You cannot provide both :changeList and :change_list' if attributes.key?(:'changeList') && attributes.key?(:'change_list')

      self.change_list = attributes[:'change_list'] if attributes[:'change_list']

      self.content_name = attributes[:'contentName'] if attributes[:'contentName']

      raise 'You cannot provide both :contentName and :content_name' if attributes.key?(:'contentName') && attributes.key?(:'content_name')

      self.content_name = attributes[:'content_name'] if attributes[:'content_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parser_names == other.parser_names &&
        source_names == other.source_names &&
        field_names == other.field_names &&
        change_list == other.change_list &&
        content_name == other.content_name
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
      [parser_names, source_names, field_names, change_list, content_name].hash
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
