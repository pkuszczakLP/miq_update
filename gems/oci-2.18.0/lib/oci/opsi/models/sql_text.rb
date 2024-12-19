# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # SQL Text type object.
  class Opsi::Models::SqlText
    # Version
    # Example: `1`
    #
    # @return [Float]
    attr_accessor :version

    # **[Required]** Unique SQL_ID for a SQL Statement.
    #
    # @return [String]
    attr_accessor :sql_identifier

    # **[Required]** Collection timestamp
    # Example: `\"2020-05-06T00:00:00.000Z\"`
    #
    # @return [DateTime]
    attr_accessor :time_collected

    # **[Required]** SQL command
    # Example: `\"SELECT\"`
    #
    # @return [String]
    attr_accessor :sql_command

    # Exact matching signature
    # Example: `\"18067345456756876713\"`
    #
    # @return [String]
    attr_accessor :exact_matching_signature

    # Force matching signature
    # Example: `\"18067345456756876713\"`
    #
    # @return [String]
    attr_accessor :force_matching_signature

    # **[Required]** Full SQL Text
    # Example: `\"SELECT username,profile,default_tablespace,temporary_tablespace FROM dba_users\"`
    # Disclaimer: SQL text being uploaded explicitly via APIs is not masked. Any sensitive literals contained in the sqlFullText column should be masked prior to ingestion.
    #
    # @return [String]
    attr_accessor :sql_full_text

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'version': :'version',
        'sql_identifier': :'sqlIdentifier',
        'time_collected': :'timeCollected',
        'sql_command': :'sqlCommand',
        'exact_matching_signature': :'exactMatchingSignature',
        'force_matching_signature': :'forceMatchingSignature',
        'sql_full_text': :'sqlFullText'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'version': :'Float',
        'sql_identifier': :'String',
        'time_collected': :'DateTime',
        'sql_command': :'String',
        'exact_matching_signature': :'String',
        'force_matching_signature': :'String',
        'sql_full_text': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :version The value to assign to the {#version} property
    # @option attributes [String] :sql_identifier The value to assign to the {#sql_identifier} property
    # @option attributes [DateTime] :time_collected The value to assign to the {#time_collected} property
    # @option attributes [String] :sql_command The value to assign to the {#sql_command} property
    # @option attributes [String] :exact_matching_signature The value to assign to the {#exact_matching_signature} property
    # @option attributes [String] :force_matching_signature The value to assign to the {#force_matching_signature} property
    # @option attributes [String] :sql_full_text The value to assign to the {#sql_full_text} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.version = attributes[:'version'] if attributes[:'version']

      self.sql_identifier = attributes[:'sqlIdentifier'] if attributes[:'sqlIdentifier']

      raise 'You cannot provide both :sqlIdentifier and :sql_identifier' if attributes.key?(:'sqlIdentifier') && attributes.key?(:'sql_identifier')

      self.sql_identifier = attributes[:'sql_identifier'] if attributes[:'sql_identifier']

      self.time_collected = attributes[:'timeCollected'] if attributes[:'timeCollected']

      raise 'You cannot provide both :timeCollected and :time_collected' if attributes.key?(:'timeCollected') && attributes.key?(:'time_collected')

      self.time_collected = attributes[:'time_collected'] if attributes[:'time_collected']

      self.sql_command = attributes[:'sqlCommand'] if attributes[:'sqlCommand']

      raise 'You cannot provide both :sqlCommand and :sql_command' if attributes.key?(:'sqlCommand') && attributes.key?(:'sql_command')

      self.sql_command = attributes[:'sql_command'] if attributes[:'sql_command']

      self.exact_matching_signature = attributes[:'exactMatchingSignature'] if attributes[:'exactMatchingSignature']

      raise 'You cannot provide both :exactMatchingSignature and :exact_matching_signature' if attributes.key?(:'exactMatchingSignature') && attributes.key?(:'exact_matching_signature')

      self.exact_matching_signature = attributes[:'exact_matching_signature'] if attributes[:'exact_matching_signature']

      self.force_matching_signature = attributes[:'forceMatchingSignature'] if attributes[:'forceMatchingSignature']

      raise 'You cannot provide both :forceMatchingSignature and :force_matching_signature' if attributes.key?(:'forceMatchingSignature') && attributes.key?(:'force_matching_signature')

      self.force_matching_signature = attributes[:'force_matching_signature'] if attributes[:'force_matching_signature']

      self.sql_full_text = attributes[:'sqlFullText'] if attributes[:'sqlFullText']

      raise 'You cannot provide both :sqlFullText and :sql_full_text' if attributes.key?(:'sqlFullText') && attributes.key?(:'sql_full_text')

      self.sql_full_text = attributes[:'sql_full_text'] if attributes[:'sql_full_text']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        version == other.version &&
        sql_identifier == other.sql_identifier &&
        time_collected == other.time_collected &&
        sql_command == other.sql_command &&
        exact_matching_signature == other.exact_matching_signature &&
        force_matching_signature == other.force_matching_signature &&
        sql_full_text == other.sql_full_text
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
      [version, sql_identifier, time_collected, sql_command, exact_matching_signature, force_matching_signature, sql_full_text].hash
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
