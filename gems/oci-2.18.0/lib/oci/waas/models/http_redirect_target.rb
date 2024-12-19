# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # HttpRedirectTarget model.
  class Waas::Models::HttpRedirectTarget
    PROTOCOL_ENUM = [
      PROTOCOL_HTTP = 'HTTP'.freeze,
      PROTOCOL_HTTPS = 'HTTPS'.freeze,
      PROTOCOL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The protocol used for the target, http or https.
    # @return [String]
    attr_reader :protocol

    # **[Required]** The host portion of the redirect.
    # @return [String]
    attr_accessor :host

    # Port number of the target destination of the redirect, default to match protocol
    # @return [Integer]
    attr_accessor :port

    # **[Required]** The path component of the target URL (e.g., \"/path/to/resource\" in \"https://target.example.com/path/to/resource?redirected\"), which can be empty, static, or request-copying, or request-prefixing. Use of \\ is not permitted except to escape a following \\, {, or }. An empty value is treated the same as static \"/\". A static value must begin with a leading \"/\", optionally followed by other path characters. A request-copying value must exactly match \"{path}\", and will be replaced with the path component of the request URL (including its initial \"/\"). A request-prefixing value must start with \"/\" and end with a non-escaped \"{path}\", which will be replaced with the path component of the request URL (including its initial \"/\"). Only one such replacement token is allowed.
    # @return [String]
    attr_accessor :path

    # **[Required]** The query component of the target URL (e.g., \"?redirected\" in \"https://target.example.com/path/to/resource?redirected\"), which can be empty, static, or request-copying. Use of \\ is not permitted except to escape a following \\, {, or }. An empty value results in a redirection target URL with no query component. A static value must begin with a leading \"?\", optionally followed by other query characters. A request-copying value must exactly match \"{query}\", and will be replaced with the query component of the request URL (including a leading \"?\" if and only if the request URL includes a query component).
    # @return [String]
    attr_accessor :query

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'protocol': :'protocol',
        'host': :'host',
        'port': :'port',
        'path': :'path',
        'query': :'query'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'protocol': :'String',
        'host': :'String',
        'port': :'Integer',
        'path': :'String',
        'query': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :host The value to assign to the {#host} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [String] :query The value to assign to the {#query} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.host = attributes[:'host'] if attributes[:'host']

      self.port = attributes[:'port'] if attributes[:'port']

      self.path = attributes[:'path'] if attributes[:'path']

      self.query = attributes[:'query'] if attributes[:'query']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] protocol Object to be assigned
    def protocol=(protocol)
      # rubocop:disable Style/ConditionalAssignment
      if protocol && !PROTOCOL_ENUM.include?(protocol)
        OCI.logger.debug("Unknown value for 'protocol' [" + protocol + "]. Mapping to 'PROTOCOL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @protocol = PROTOCOL_UNKNOWN_ENUM_VALUE
      else
        @protocol = protocol
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        protocol == other.protocol &&
        host == other.host &&
        port == other.port &&
        path == other.path &&
        query == other.query
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
      [protocol, host, port, path, query].hash
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
