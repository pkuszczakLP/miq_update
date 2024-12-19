# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # An object that specifies an HTTP response caching policy.
  #
  class Waa::Models::ResponseCachingPolicy
    # When false, responses will not be cached by the backend based on response headers.
    #
    # When true, responses that contain one of the supported cache control headers will be cached according to the
    # values specified in the cache control headers.
    #
    # The \"X-Accel-Expires\" header field sets caching time of a response in seconds. The zero value disables
    # caching for a response. If the value starts with the @ prefix, it sets an absolute time in seconds since
    # Epoch, up to which the response may be cached.
    #
    # If the header does not include the \"X-Accel-Expires\" field, parameters of caching may be set in the header
    # fields \"Expires\" or \"Cache-Control\".
    #
    # If the header includes the \"Set-Cookie\" field, such a response will not be cached.
    #
    # If the header includes the \"Vary\" field with the special value \"*\", such a response will not be cached. If the
    # header includes the \"Vary\" field with another value, such a response will be cached taking into account the
    # corresponding request header fields.
    #
    # @return [BOOLEAN]
    attr_accessor :is_response_header_based_caching_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_response_header_based_caching_enabled': :'isResponseHeaderBasedCachingEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_response_header_based_caching_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_response_header_based_caching_enabled The value to assign to the {#is_response_header_based_caching_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_response_header_based_caching_enabled = attributes[:'isResponseHeaderBasedCachingEnabled'] unless attributes[:'isResponseHeaderBasedCachingEnabled'].nil?
      self.is_response_header_based_caching_enabled = false if is_response_header_based_caching_enabled.nil? && !attributes.key?(:'isResponseHeaderBasedCachingEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isResponseHeaderBasedCachingEnabled and :is_response_header_based_caching_enabled' if attributes.key?(:'isResponseHeaderBasedCachingEnabled') && attributes.key?(:'is_response_header_based_caching_enabled')

      self.is_response_header_based_caching_enabled = attributes[:'is_response_header_based_caching_enabled'] unless attributes[:'is_response_header_based_caching_enabled'].nil?
      self.is_response_header_based_caching_enabled = false if is_response_header_based_caching_enabled.nil? && !attributes.key?(:'isResponseHeaderBasedCachingEnabled') && !attributes.key?(:'is_response_header_based_caching_enabled') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_response_header_based_caching_enabled == other.is_response_header_based_caching_enabled
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
      [is_response_header_based_caching_enabled].hash
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
