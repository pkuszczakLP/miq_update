# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'url_pattern'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Pattern describing an http/https URL or set thereof
  # as a concatenation of optional host component and optional path component.
  #
  # Key points:
  # 1. Use the specific URLs or construct the URL patterns you want to match using wildcard `*` and token characters `./`.
  # 2. In the host component and path component don't enter consecutive wildcard `*` for example: `example.*.*.com`.
  # 3. To match the exact domain and its subdirectories add a trailing slash `/` to your entry.
  # 4. The firewall interprets entries that do not end in a `/` or `*` with an implicit asterisk `*` to their end, which further increases the potential matches.
  # 5. The Use of multiple wildcards in a single pattern can impact the performance of the firewall.
  #
  # Domain/subdomains match examples:
  # 1. `*.example.com.*` will match `sub1.sub2.example.com.info.us` and `sub1.example.com.us` and `sub1.example.com/subdirectory` but not match `sub1.example.com`.
  # 2. `*.example.com` will match `sub1.example.com` and `sub1.sub2.example.com` and `sub1.example.com.au` but not match `example.com`.
  # 3. `*.example.com/` will match `sub1.sub2.example.com` and `sub1.example.com` but not match `sub1.example.com.au`.
  # 4. `example.com` will match `example.com` and `example.com.au` and `example.com.info.us` and `example.com/subdirectory`.
  # 5. `example.com/` will match `example.com` and `example.com/foo` but not `example.com.info.us`.
  # 6. `example.*.com` will match `example.sub1.com` and `example.sub1.sub2.com` and `example.sub1.com.au` and `example.sub1.com/subdirecroty`.
  # 7. `example.*.com/` will match `example.sub1.com` and `example.sub1.sub2.com` and `example.sub1.com/subdirecroty` but not match `example.sub1.com.au`.
  # 8. `example.com.*` will match `example.com.us` and `example.com.info.us` and `example.com.us/subdirectory` but not match `sub1.example.com`.
  #
  # Subdirectory or path match examples:
  # 1. `example.com/*` will match `example.com/foo` and `example.com/bar` and any `example.com/subdirectory`.
  # 2. `example.com/foo` will match `example.com/foo`.
  # 3. `www.example.com/foo/*` will match `www.exampe.com/foo/subdiectory`, but not match `www.example.com/FOO` or `www.example.com/bar/subdirectory`.
  # 4. `*.example.com/foo/*` will match `sub2.sub.example.com/foo/subdirectory` but not match `sub1.example.com/FOO` or `sub1.example.com/bar/subdirectory`.
  #
  # Other examples containing IP addresses in urls:
  # 1. 103.12.14.122/ will match 103.12.14.122 and 103.12.14.122/subdirectory.
  # 2. 103.12.14.122:8081/ will match 103.12.14.122:8081 and 103.12.14.122:8081/subdirectory.
  # 3. 2607:9d80:4680:3f01:0000:0000:00d0:00c0/ will match 2607:9d80:4680:3f01:0000:0000:00d0:00c0 and 2607:9d80:4680:3f01:0000:0000:00d0:00c0/subdirecroty.
  # 4. [2607:9d80:4680:3f01:0000:0000:00d0:00c0]:8081/ will match [2607:9d80:4680:3f01:0000:0000:00d0:00c0]:8081 and [2607:9d80:4680:3f01:0000:0000:00d0:00c0]:8081/subdirecroty.
  #
  class NetworkFirewall::Models::SimpleUrlPattern < NetworkFirewall::Models::UrlPattern
    # **[Required]** A string consisting of a concatenation of optional host component and optional path component.
    # The host component may start with `*.` to match the case-insensitive domain and all its subdomains.
    # The path component must start with a `/`, and may end with `*` to match all paths of which it is a case-sensitive prefix.
    # A missing host component matches all request domains, and a missing path component matches all request paths.
    # An empty value matches all requests.
    #
    # @return [String]
    attr_accessor :pattern

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'pattern': :'pattern'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'pattern': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :pattern The value to assign to the {#pattern} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'SIMPLE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.pattern = attributes[:'pattern'] if attributes[:'pattern']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        pattern == other.pattern
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
      [type, pattern].hash
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
