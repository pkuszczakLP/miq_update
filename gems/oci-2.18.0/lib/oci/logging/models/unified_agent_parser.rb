# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # source parser object.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Logging::Models::UnifiedAgentParser
    PARSER_TYPE_ENUM = [
      PARSER_TYPE_AUDITD = 'AUDITD'.freeze,
      PARSER_TYPE_JSON = 'JSON'.freeze,
      PARSER_TYPE_TSV = 'TSV'.freeze,
      PARSER_TYPE_CSV = 'CSV'.freeze,
      PARSER_TYPE_NONE = 'NONE'.freeze,
      PARSER_TYPE_SYSLOG = 'SYSLOG'.freeze,
      PARSER_TYPE_APACHE2 = 'APACHE2'.freeze,
      PARSER_TYPE_APACHE_ERROR = 'APACHE_ERROR'.freeze,
      PARSER_TYPE_MSGPACK = 'MSGPACK'.freeze,
      PARSER_TYPE_REGEXP = 'REGEXP'.freeze,
      PARSER_TYPE_MULTILINE = 'MULTILINE'.freeze,
      PARSER_TYPE_GROK = 'GROK'.freeze,
      PARSER_TYPE_MULTILINE_GROK = 'MULTILINE_GROK'.freeze,
      PARSER_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Type of fluent parser.
    # @return [String]
    attr_reader :parser_type

    # Specify time field for the event time. If the event doesn't have this field, the current time is used.
    # @return [String]
    attr_accessor :field_time_key

    # Specify types for converting a field into another type.
    # @return [Hash<String, String>]
    attr_accessor :types

    # Specify the null value pattern.
    # @return [String]
    attr_accessor :null_value_pattern

    # If true, an empty string field is replaced with nil.
    # @return [BOOLEAN]
    attr_accessor :is_null_empty_string

    # If true, use Fluent::EventTime.now(current time) as a timestamp when time_key is specified.
    # @return [BOOLEAN]
    attr_accessor :is_estimate_current_event

    # If true, keep time field in the record.
    # @return [BOOLEAN]
    attr_accessor :is_keep_time_key

    # Specify the timeout for parse processing. This is mainly for detecting an incorrect regexp pattern.
    # @return [Integer]
    attr_accessor :timeout_in_milliseconds

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_type': :'parserType',
        'field_time_key': :'fieldTimeKey',
        'types': :'types',
        'null_value_pattern': :'nullValuePattern',
        'is_null_empty_string': :'isNullEmptyString',
        'is_estimate_current_event': :'isEstimateCurrentEvent',
        'is_keep_time_key': :'isKeepTimeKey',
        'timeout_in_milliseconds': :'timeoutInMilliseconds'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'parser_type': :'String',
        'field_time_key': :'String',
        'types': :'Hash<String, String>',
        'null_value_pattern': :'String',
        'is_null_empty_string': :'BOOLEAN',
        'is_estimate_current_event': :'BOOLEAN',
        'is_keep_time_key': :'BOOLEAN',
        'timeout_in_milliseconds': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'parserType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Logging::Models::UnifiedAgentMultilineGrokParser' if type == 'MULTILINE_GROK'
      return 'OCI::Logging::Models::UnifiedJSONParser' if type == 'JSON'
      return 'OCI::Logging::Models::UnifiedAgentGrokParser' if type == 'GROK'
      return 'OCI::Logging::Models::UnifiedAgentNoneParser' if type == 'NONE'
      return 'OCI::Logging::Models::UnifiedAgentSyslogParser' if type == 'SYSLOG'
      return 'OCI::Logging::Models::UnifiedAgentAuditdParser' if type == 'AUDITD'
      return 'OCI::Logging::Models::UnifiedAgentApache2Parser' if type == 'APACHE2'
      return 'OCI::Logging::Models::UnifiedAgentRegexParser' if type == 'REGEXP'
      return 'OCI::Logging::Models::UnifiedAgentMultilineParser' if type == 'MULTILINE'
      return 'OCI::Logging::Models::UnifiedAgentTsvParser' if type == 'TSV'
      return 'OCI::Logging::Models::UnifiedAgentApacheErrorParser' if type == 'APACHE_ERROR'
      return 'OCI::Logging::Models::UnifiedAgentMsgpackParser' if type == 'MSGPACK'
      return 'OCI::Logging::Models::UnifiedAgentCsvParser' if type == 'CSV'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Logging::Models::UnifiedAgentParser'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :parser_type The value to assign to the {#parser_type} property
    # @option attributes [String] :field_time_key The value to assign to the {#field_time_key} property
    # @option attributes [Hash<String, String>] :types The value to assign to the {#types} property
    # @option attributes [String] :null_value_pattern The value to assign to the {#null_value_pattern} property
    # @option attributes [BOOLEAN] :is_null_empty_string The value to assign to the {#is_null_empty_string} property
    # @option attributes [BOOLEAN] :is_estimate_current_event The value to assign to the {#is_estimate_current_event} property
    # @option attributes [BOOLEAN] :is_keep_time_key The value to assign to the {#is_keep_time_key} property
    # @option attributes [Integer] :timeout_in_milliseconds The value to assign to the {#timeout_in_milliseconds} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.parser_type = attributes[:'parserType'] if attributes[:'parserType']

      raise 'You cannot provide both :parserType and :parser_type' if attributes.key?(:'parserType') && attributes.key?(:'parser_type')

      self.parser_type = attributes[:'parser_type'] if attributes[:'parser_type']

      self.field_time_key = attributes[:'fieldTimeKey'] if attributes[:'fieldTimeKey']

      raise 'You cannot provide both :fieldTimeKey and :field_time_key' if attributes.key?(:'fieldTimeKey') && attributes.key?(:'field_time_key')

      self.field_time_key = attributes[:'field_time_key'] if attributes[:'field_time_key']

      self.types = attributes[:'types'] if attributes[:'types']

      self.null_value_pattern = attributes[:'nullValuePattern'] if attributes[:'nullValuePattern']

      raise 'You cannot provide both :nullValuePattern and :null_value_pattern' if attributes.key?(:'nullValuePattern') && attributes.key?(:'null_value_pattern')

      self.null_value_pattern = attributes[:'null_value_pattern'] if attributes[:'null_value_pattern']

      self.is_null_empty_string = attributes[:'isNullEmptyString'] unless attributes[:'isNullEmptyString'].nil?
      self.is_null_empty_string = false if is_null_empty_string.nil? && !attributes.key?(:'isNullEmptyString') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isNullEmptyString and :is_null_empty_string' if attributes.key?(:'isNullEmptyString') && attributes.key?(:'is_null_empty_string')

      self.is_null_empty_string = attributes[:'is_null_empty_string'] unless attributes[:'is_null_empty_string'].nil?
      self.is_null_empty_string = false if is_null_empty_string.nil? && !attributes.key?(:'isNullEmptyString') && !attributes.key?(:'is_null_empty_string') # rubocop:disable Style/StringLiterals

      self.is_estimate_current_event = attributes[:'isEstimateCurrentEvent'] unless attributes[:'isEstimateCurrentEvent'].nil?
      self.is_estimate_current_event = true if is_estimate_current_event.nil? && !attributes.key?(:'isEstimateCurrentEvent') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isEstimateCurrentEvent and :is_estimate_current_event' if attributes.key?(:'isEstimateCurrentEvent') && attributes.key?(:'is_estimate_current_event')

      self.is_estimate_current_event = attributes[:'is_estimate_current_event'] unless attributes[:'is_estimate_current_event'].nil?
      self.is_estimate_current_event = true if is_estimate_current_event.nil? && !attributes.key?(:'isEstimateCurrentEvent') && !attributes.key?(:'is_estimate_current_event') # rubocop:disable Style/StringLiterals

      self.is_keep_time_key = attributes[:'isKeepTimeKey'] unless attributes[:'isKeepTimeKey'].nil?
      self.is_keep_time_key = false if is_keep_time_key.nil? && !attributes.key?(:'isKeepTimeKey') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isKeepTimeKey and :is_keep_time_key' if attributes.key?(:'isKeepTimeKey') && attributes.key?(:'is_keep_time_key')

      self.is_keep_time_key = attributes[:'is_keep_time_key'] unless attributes[:'is_keep_time_key'].nil?
      self.is_keep_time_key = false if is_keep_time_key.nil? && !attributes.key?(:'isKeepTimeKey') && !attributes.key?(:'is_keep_time_key') # rubocop:disable Style/StringLiterals

      self.timeout_in_milliseconds = attributes[:'timeoutInMilliseconds'] if attributes[:'timeoutInMilliseconds']

      raise 'You cannot provide both :timeoutInMilliseconds and :timeout_in_milliseconds' if attributes.key?(:'timeoutInMilliseconds') && attributes.key?(:'timeout_in_milliseconds')

      self.timeout_in_milliseconds = attributes[:'timeout_in_milliseconds'] if attributes[:'timeout_in_milliseconds']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] parser_type Object to be assigned
    def parser_type=(parser_type)
      # rubocop:disable Style/ConditionalAssignment
      if parser_type && !PARSER_TYPE_ENUM.include?(parser_type)
        OCI.logger.debug("Unknown value for 'parser_type' [" + parser_type + "]. Mapping to 'PARSER_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @parser_type = PARSER_TYPE_UNKNOWN_ENUM_VALUE
      else
        @parser_type = parser_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        parser_type == other.parser_type &&
        field_time_key == other.field_time_key &&
        types == other.types &&
        null_value_pattern == other.null_value_pattern &&
        is_null_empty_string == other.is_null_empty_string &&
        is_estimate_current_event == other.is_estimate_current_event &&
        is_keep_time_key == other.is_keep_time_key &&
        timeout_in_milliseconds == other.timeout_in_milliseconds
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
      [parser_type, field_time_key, types, null_value_pattern, is_null_empty_string, is_estimate_current_event, is_keep_time_key, timeout_in_milliseconds].hash
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
