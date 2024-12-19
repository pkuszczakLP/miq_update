# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information about the data collected as a ZIP file when the event occurred.
  class OsManagement::Models::EventContent
    CONTENT_AVAILABILITY_ENUM = [
      CONTENT_AVAILABILITY_NOT_AVAILABLE = 'NOT_AVAILABLE'.freeze,
      CONTENT_AVAILABILITY_AVAILABLE_ON_INSTANCE = 'AVAILABLE_ON_INSTANCE'.freeze,
      CONTENT_AVAILABILITY_AVAILABLE_ON_SERVICE = 'AVAILABLE_ON_SERVICE'.freeze,
      CONTENT_AVAILABILITY_AVAILABLE_ON_INSTANCE_AND_SERVICE = 'AVAILABLE_ON_INSTANCE_AND_SERVICE'.freeze,
      CONTENT_AVAILABILITY_AVAILABLE_ON_INSTANCE_UPLOAD_IN_PROGRESS = 'AVAILABLE_ON_INSTANCE_UPLOAD_IN_PROGRESS'.freeze,
      CONTENT_AVAILABILITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Status of the event content
    # @return [String]
    attr_reader :content_availability

    # Path to the event content on the instance
    # @return [String]
    attr_accessor :instance_path

    # size in bytes of the event content (size of the zip file uploaded)
    # @return [Integer]
    attr_accessor :size

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'content_availability': :'contentAvailability',
        'instance_path': :'instancePath',
        'size': :'size'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'content_availability': :'String',
        'instance_path': :'String',
        'size': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :content_availability The value to assign to the {#content_availability} property
    # @option attributes [String] :instance_path The value to assign to the {#instance_path} property
    # @option attributes [Integer] :size The value to assign to the {#size} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.content_availability = attributes[:'contentAvailability'] if attributes[:'contentAvailability']

      raise 'You cannot provide both :contentAvailability and :content_availability' if attributes.key?(:'contentAvailability') && attributes.key?(:'content_availability')

      self.content_availability = attributes[:'content_availability'] if attributes[:'content_availability']

      self.instance_path = attributes[:'instancePath'] if attributes[:'instancePath']

      raise 'You cannot provide both :instancePath and :instance_path' if attributes.key?(:'instancePath') && attributes.key?(:'instance_path')

      self.instance_path = attributes[:'instance_path'] if attributes[:'instance_path']

      self.size = attributes[:'size'] if attributes[:'size']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] content_availability Object to be assigned
    def content_availability=(content_availability)
      # rubocop:disable Style/ConditionalAssignment
      if content_availability && !CONTENT_AVAILABILITY_ENUM.include?(content_availability)
        OCI.logger.debug("Unknown value for 'content_availability' [" + content_availability + "]. Mapping to 'CONTENT_AVAILABILITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @content_availability = CONTENT_AVAILABILITY_UNKNOWN_ENUM_VALUE
      else
        @content_availability = content_availability
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        content_availability == other.content_availability &&
        instance_path == other.instance_path &&
        size == other.size
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
      [content_availability, instance_path, size].hash
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
