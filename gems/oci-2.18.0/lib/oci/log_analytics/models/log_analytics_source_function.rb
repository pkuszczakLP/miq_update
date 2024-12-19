# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsSourceFunction
  class LogAnalytics::Models::LogAnalyticsSourceFunction
    FUNCTION_NAME_ENUM = [
      FUNCTION_NAME_GEOLOCATION = 'GEOLOCATION'.freeze,
      FUNCTION_NAME_LOOKUP = 'LOOKUP'.freeze,
      FUNCTION_NAME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The function argument.
    # @return [Array<OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionArgument>]
    attr_accessor :arguments

    # A flag inidcating whether or not the source function is enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # @return [OCI::LogAnalytics::Models::LogAnalyticsMetaFunction]
    attr_accessor :function

    # The source function name
    # @return [String]
    attr_reader :function_name

    # The source function unique identifier as a string.
    # @return [String]
    attr_accessor :function_reference

    # The source unique identifier as a string.
    # @return [String]
    attr_accessor :source_reference

    # Features of the source function to use for enrichment.
    # @return [Array<String>]
    attr_accessor :features

    # The source function unique identifier.
    # @return [Integer]
    attr_accessor :function_id

    # The source function order.
    # @return [Integer]
    attr_accessor :order

    # The system flag.  A value of false denotes a custom, or user
    # defined object.  A value of true denotes a built in object.
    #
    # @return [BOOLEAN]
    attr_accessor :is_system

    # The lookup column.
    # @return [String]
    attr_accessor :lookup_column

    # The lookup column position.
    # @return [Integer]
    attr_accessor :lookup_column_position

    # The lookup display name.
    # @return [String]
    attr_accessor :lookup_display_name

    # The lookup  mode.
    # @return [Integer]
    attr_accessor :lookup_mode

    # The lookup table.
    # @return [String]
    attr_accessor :lookup_table

    # The source unique identifier.
    # @return [Integer]
    attr_accessor :source_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'arguments': :'arguments',
        'is_enabled': :'isEnabled',
        'function': :'function',
        'function_name': :'functionName',
        'function_reference': :'functionReference',
        'source_reference': :'sourceReference',
        'features': :'features',
        'function_id': :'functionId',
        'order': :'order',
        'is_system': :'isSystem',
        'lookup_column': :'lookupColumn',
        'lookup_column_position': :'lookupColumnPosition',
        'lookup_display_name': :'lookupDisplayName',
        'lookup_mode': :'lookupMode',
        'lookup_table': :'lookupTable',
        'source_id': :'sourceId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'arguments': :'Array<OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionArgument>',
        'is_enabled': :'BOOLEAN',
        'function': :'OCI::LogAnalytics::Models::LogAnalyticsMetaFunction',
        'function_name': :'String',
        'function_reference': :'String',
        'source_reference': :'String',
        'features': :'Array<String>',
        'function_id': :'Integer',
        'order': :'Integer',
        'is_system': :'BOOLEAN',
        'lookup_column': :'String',
        'lookup_column_position': :'Integer',
        'lookup_display_name': :'String',
        'lookup_mode': :'Integer',
        'lookup_table': :'String',
        'source_id': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<OCI::LogAnalytics::Models::LogAnalyticsMetaFunctionArgument>] :arguments The value to assign to the {#arguments} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [OCI::LogAnalytics::Models::LogAnalyticsMetaFunction] :function The value to assign to the {#function} property
    # @option attributes [String] :function_name The value to assign to the {#function_name} property
    # @option attributes [String] :function_reference The value to assign to the {#function_reference} property
    # @option attributes [String] :source_reference The value to assign to the {#source_reference} property
    # @option attributes [Array<String>] :features The value to assign to the {#features} property
    # @option attributes [Integer] :function_id The value to assign to the {#function_id} property
    # @option attributes [Integer] :order The value to assign to the {#order} property
    # @option attributes [BOOLEAN] :is_system The value to assign to the {#is_system} property
    # @option attributes [String] :lookup_column The value to assign to the {#lookup_column} property
    # @option attributes [Integer] :lookup_column_position The value to assign to the {#lookup_column_position} property
    # @option attributes [String] :lookup_display_name The value to assign to the {#lookup_display_name} property
    # @option attributes [Integer] :lookup_mode The value to assign to the {#lookup_mode} property
    # @option attributes [String] :lookup_table The value to assign to the {#lookup_table} property
    # @option attributes [Integer] :source_id The value to assign to the {#source_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.arguments = attributes[:'arguments'] if attributes[:'arguments']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.function = attributes[:'function'] if attributes[:'function']

      self.function_name = attributes[:'functionName'] if attributes[:'functionName']
      self.function_name = "LOOKUP" if function_name.nil? && !attributes.key?(:'functionName') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :functionName and :function_name' if attributes.key?(:'functionName') && attributes.key?(:'function_name')

      self.function_name = attributes[:'function_name'] if attributes[:'function_name']
      self.function_name = "LOOKUP" if function_name.nil? && !attributes.key?(:'functionName') && !attributes.key?(:'function_name') # rubocop:disable Style/StringLiterals

      self.function_reference = attributes[:'functionReference'] if attributes[:'functionReference']

      raise 'You cannot provide both :functionReference and :function_reference' if attributes.key?(:'functionReference') && attributes.key?(:'function_reference')

      self.function_reference = attributes[:'function_reference'] if attributes[:'function_reference']

      self.source_reference = attributes[:'sourceReference'] if attributes[:'sourceReference']

      raise 'You cannot provide both :sourceReference and :source_reference' if attributes.key?(:'sourceReference') && attributes.key?(:'source_reference')

      self.source_reference = attributes[:'source_reference'] if attributes[:'source_reference']

      self.features = attributes[:'features'] if attributes[:'features']

      self.function_id = attributes[:'functionId'] if attributes[:'functionId']

      raise 'You cannot provide both :functionId and :function_id' if attributes.key?(:'functionId') && attributes.key?(:'function_id')

      self.function_id = attributes[:'function_id'] if attributes[:'function_id']

      self.order = attributes[:'order'] if attributes[:'order']

      self.is_system = attributes[:'isSystem'] unless attributes[:'isSystem'].nil?

      raise 'You cannot provide both :isSystem and :is_system' if attributes.key?(:'isSystem') && attributes.key?(:'is_system')

      self.is_system = attributes[:'is_system'] unless attributes[:'is_system'].nil?

      self.lookup_column = attributes[:'lookupColumn'] if attributes[:'lookupColumn']

      raise 'You cannot provide both :lookupColumn and :lookup_column' if attributes.key?(:'lookupColumn') && attributes.key?(:'lookup_column')

      self.lookup_column = attributes[:'lookup_column'] if attributes[:'lookup_column']

      self.lookup_column_position = attributes[:'lookupColumnPosition'] if attributes[:'lookupColumnPosition']

      raise 'You cannot provide both :lookupColumnPosition and :lookup_column_position' if attributes.key?(:'lookupColumnPosition') && attributes.key?(:'lookup_column_position')

      self.lookup_column_position = attributes[:'lookup_column_position'] if attributes[:'lookup_column_position']

      self.lookup_display_name = attributes[:'lookupDisplayName'] if attributes[:'lookupDisplayName']

      raise 'You cannot provide both :lookupDisplayName and :lookup_display_name' if attributes.key?(:'lookupDisplayName') && attributes.key?(:'lookup_display_name')

      self.lookup_display_name = attributes[:'lookup_display_name'] if attributes[:'lookup_display_name']

      self.lookup_mode = attributes[:'lookupMode'] if attributes[:'lookupMode']

      raise 'You cannot provide both :lookupMode and :lookup_mode' if attributes.key?(:'lookupMode') && attributes.key?(:'lookup_mode')

      self.lookup_mode = attributes[:'lookup_mode'] if attributes[:'lookup_mode']

      self.lookup_table = attributes[:'lookupTable'] if attributes[:'lookupTable']

      raise 'You cannot provide both :lookupTable and :lookup_table' if attributes.key?(:'lookupTable') && attributes.key?(:'lookup_table')

      self.lookup_table = attributes[:'lookup_table'] if attributes[:'lookup_table']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] function_name Object to be assigned
    def function_name=(function_name)
      # rubocop:disable Style/ConditionalAssignment
      if function_name && !FUNCTION_NAME_ENUM.include?(function_name)
        OCI.logger.debug("Unknown value for 'function_name' [" + function_name + "]. Mapping to 'FUNCTION_NAME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @function_name = FUNCTION_NAME_UNKNOWN_ENUM_VALUE
      else
        @function_name = function_name
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        arguments == other.arguments &&
        is_enabled == other.is_enabled &&
        function == other.function &&
        function_name == other.function_name &&
        function_reference == other.function_reference &&
        source_reference == other.source_reference &&
        features == other.features &&
        function_id == other.function_id &&
        order == other.order &&
        is_system == other.is_system &&
        lookup_column == other.lookup_column &&
        lookup_column_position == other.lookup_column_position &&
        lookup_display_name == other.lookup_display_name &&
        lookup_mode == other.lookup_mode &&
        lookup_table == other.lookup_table &&
        source_id == other.source_id
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
      [arguments, is_enabled, function, function_name, function_reference, source_reference, features, function_id, order, is_system, lookup_column, lookup_column_position, lookup_display_name, lookup_mode, lookup_table, source_id].hash
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
