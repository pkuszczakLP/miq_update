# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'rule'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that represents the advance http header options that allow the setting of http header size and allow/disallow
  # invalid characters in the http headers.
  # For example httpLargeHeaderSizeInKB=32, the http header could have 4 buffers of 32KBs each
  # This rule applies only to HTTP listeners. No more than one `HttpHeaderRule` object can be present in
  # a given listener.
  #
  class LoadBalancer::Models::HttpHeaderRule < LoadBalancer::Models::Rule
    # Indicates whether or not invalid characters in client header fields will be allowed.
    # Valid names are composed of English letters, digits, hyphens and underscores.
    # If \"true\", invalid characters are allowed in the HTTP header.
    # If \"false\", invalid characters are not allowed in the HTTP header
    #
    # @return [BOOLEAN]
    attr_accessor :are_invalid_characters_allowed

    # The maximum size of each buffer used for reading http client request header.
    # This value indicates the maximum size allowed for each buffer.
    # The allowed values for buffer size are 8, 16, 32 and 64.
    #
    # @return [Integer]
    attr_accessor :http_large_header_size_in_kb

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'action',
        'are_invalid_characters_allowed': :'areInvalidCharactersAllowed',
        'http_large_header_size_in_kb': :'httpLargeHeaderSizeInKB'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'action': :'String',
        'are_invalid_characters_allowed': :'BOOLEAN',
        'http_large_header_size_in_kb': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :are_invalid_characters_allowed The value to assign to the {#are_invalid_characters_allowed} property
    # @option attributes [Integer] :http_large_header_size_in_kb The value to assign to the {#http_large_header_size_in_kb} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['action'] = 'HTTP_HEADER'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.are_invalid_characters_allowed = attributes[:'areInvalidCharactersAllowed'] unless attributes[:'areInvalidCharactersAllowed'].nil?

      raise 'You cannot provide both :areInvalidCharactersAllowed and :are_invalid_characters_allowed' if attributes.key?(:'areInvalidCharactersAllowed') && attributes.key?(:'are_invalid_characters_allowed')

      self.are_invalid_characters_allowed = attributes[:'are_invalid_characters_allowed'] unless attributes[:'are_invalid_characters_allowed'].nil?

      self.http_large_header_size_in_kb = attributes[:'httpLargeHeaderSizeInKB'] if attributes[:'httpLargeHeaderSizeInKB']

      raise 'You cannot provide both :httpLargeHeaderSizeInKB and :http_large_header_size_in_kb' if attributes.key?(:'httpLargeHeaderSizeInKB') && attributes.key?(:'http_large_header_size_in_kb')

      self.http_large_header_size_in_kb = attributes[:'http_large_header_size_in_kb'] if attributes[:'http_large_header_size_in_kb']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        action == other.action &&
        are_invalid_characters_allowed == other.are_invalid_characters_allowed &&
        http_large_header_size_in_kb == other.http_large_header_size_in_kb
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
      [action, are_invalid_characters_allowed, http_large_header_size_in_kb].hash
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
