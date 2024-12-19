# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsParserFunctionParameter
  class LogAnalytics::Models::LogAnalyticsParserFunctionParameter
    # The parser function unique identifier.
    # @return [Integer]
    attr_accessor :parser_function_id

    # The internal name
    # @return [String]
    attr_accessor :parser_function_parameter_name

    # The parameter unique identifier.
    # @return [Integer]
    attr_accessor :parser_function_parameter_id

    # The parameter internal name.
    # @return [String]
    attr_accessor :parser_meta_plugin_parameter_name

    # The parameter value.
    # @return [String]
    attr_accessor :parser_meta_plugin_parameter_value

    # The parser internal name.
    # @return [String]
    attr_accessor :parser_name

    # @return [OCI::LogAnalytics::Models::LogAnalyticsParserMetaPluginParameter]
    attr_accessor :parser_meta_plugin_parameter

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_function_id': :'parserFunctionId',
        'parser_function_parameter_name': :'parserFunctionParameterName',
        'parser_function_parameter_id': :'parserFunctionParameterId',
        'parser_meta_plugin_parameter_name': :'parserMetaPluginParameterName',
        'parser_meta_plugin_parameter_value': :'parserMetaPluginParameterValue',
        'parser_name': :'parserName',
        'parser_meta_plugin_parameter': :'parserMetaPluginParameter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_function_id': :'Integer',
        'parser_function_parameter_name': :'String',
        'parser_function_parameter_id': :'Integer',
        'parser_meta_plugin_parameter_name': :'String',
        'parser_meta_plugin_parameter_value': :'String',
        'parser_name': :'String',
        'parser_meta_plugin_parameter': :'OCI::LogAnalytics::Models::LogAnalyticsParserMetaPluginParameter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :parser_function_id The value to assign to the {#parser_function_id} property
    # @option attributes [String] :parser_function_parameter_name The value to assign to the {#parser_function_parameter_name} property
    # @option attributes [Integer] :parser_function_parameter_id The value to assign to the {#parser_function_parameter_id} property
    # @option attributes [String] :parser_meta_plugin_parameter_name The value to assign to the {#parser_meta_plugin_parameter_name} property
    # @option attributes [String] :parser_meta_plugin_parameter_value The value to assign to the {#parser_meta_plugin_parameter_value} property
    # @option attributes [String] :parser_name The value to assign to the {#parser_name} property
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsParserMetaPluginParameter] :parser_meta_plugin_parameter The value to assign to the {#parser_meta_plugin_parameter} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.parser_function_id = attributes[:'parserFunctionId'] if attributes[:'parserFunctionId']

      raise 'You cannot provide both :parserFunctionId and :parser_function_id' if attributes.key?(:'parserFunctionId') && attributes.key?(:'parser_function_id')

      self.parser_function_id = attributes[:'parser_function_id'] if attributes[:'parser_function_id']

      self.parser_function_parameter_name = attributes[:'parserFunctionParameterName'] if attributes[:'parserFunctionParameterName']

      raise 'You cannot provide both :parserFunctionParameterName and :parser_function_parameter_name' if attributes.key?(:'parserFunctionParameterName') && attributes.key?(:'parser_function_parameter_name')

      self.parser_function_parameter_name = attributes[:'parser_function_parameter_name'] if attributes[:'parser_function_parameter_name']

      self.parser_function_parameter_id = attributes[:'parserFunctionParameterId'] if attributes[:'parserFunctionParameterId']

      raise 'You cannot provide both :parserFunctionParameterId and :parser_function_parameter_id' if attributes.key?(:'parserFunctionParameterId') && attributes.key?(:'parser_function_parameter_id')

      self.parser_function_parameter_id = attributes[:'parser_function_parameter_id'] if attributes[:'parser_function_parameter_id']

      self.parser_meta_plugin_parameter_name = attributes[:'parserMetaPluginParameterName'] if attributes[:'parserMetaPluginParameterName']

      raise 'You cannot provide both :parserMetaPluginParameterName and :parser_meta_plugin_parameter_name' if attributes.key?(:'parserMetaPluginParameterName') && attributes.key?(:'parser_meta_plugin_parameter_name')

      self.parser_meta_plugin_parameter_name = attributes[:'parser_meta_plugin_parameter_name'] if attributes[:'parser_meta_plugin_parameter_name']

      self.parser_meta_plugin_parameter_value = attributes[:'parserMetaPluginParameterValue'] if attributes[:'parserMetaPluginParameterValue']

      raise 'You cannot provide both :parserMetaPluginParameterValue and :parser_meta_plugin_parameter_value' if attributes.key?(:'parserMetaPluginParameterValue') && attributes.key?(:'parser_meta_plugin_parameter_value')

      self.parser_meta_plugin_parameter_value = attributes[:'parser_meta_plugin_parameter_value'] if attributes[:'parser_meta_plugin_parameter_value']

      self.parser_name = attributes[:'parserName'] if attributes[:'parserName']

      raise 'You cannot provide both :parserName and :parser_name' if attributes.key?(:'parserName') && attributes.key?(:'parser_name')

      self.parser_name = attributes[:'parser_name'] if attributes[:'parser_name']

      self.parser_meta_plugin_parameter = attributes[:'parserMetaPluginParameter'] if attributes[:'parserMetaPluginParameter']

      raise 'You cannot provide both :parserMetaPluginParameter and :parser_meta_plugin_parameter' if attributes.key?(:'parserMetaPluginParameter') && attributes.key?(:'parser_meta_plugin_parameter')

      self.parser_meta_plugin_parameter = attributes[:'parser_meta_plugin_parameter'] if attributes[:'parser_meta_plugin_parameter']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parser_function_id == other.parser_function_id &&
        parser_function_parameter_name == other.parser_function_parameter_name &&
        parser_function_parameter_id == other.parser_function_parameter_id &&
        parser_meta_plugin_parameter_name == other.parser_meta_plugin_parameter_name &&
        parser_meta_plugin_parameter_value == other.parser_meta_plugin_parameter_value &&
        parser_name == other.parser_name &&
        parser_meta_plugin_parameter == other.parser_meta_plugin_parameter
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
      [parser_function_id, parser_function_parameter_name, parser_function_parameter_id, parser_meta_plugin_parameter_name, parser_meta_plugin_parameter_value, parser_name, parser_meta_plugin_parameter].hash
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
