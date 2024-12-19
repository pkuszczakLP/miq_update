# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_target_type_tablespace_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Migration tablespace settings valid for NON-ADB target type using auto create feature.
  #
  class DatabaseMigration::Models::CreateNonADBAutoCreateTablespaceDetails < DatabaseMigration::Models::CreateTargetTypeTablespaceDetails
    # True to auto-create tablespace in the target Database.
    #
    # @return [BOOLEAN]
    attr_accessor :is_auto_create

    # True set tablespace to big file.
    #
    # @return [BOOLEAN]
    attr_accessor :is_big_file

    # Size of extend in MB. Can only be specified if 'isBigFile' property is set to true.
    #
    # @return [Integer]
    attr_accessor :extend_size_in_mbs

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target_type': :'targetType',
        'is_auto_create': :'isAutoCreate',
        'is_big_file': :'isBigFile',
        'extend_size_in_mbs': :'extendSizeInMBs'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target_type': :'String',
        'is_auto_create': :'BOOLEAN',
        'is_big_file': :'BOOLEAN',
        'extend_size_in_mbs': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_auto_create The value to assign to the {#is_auto_create} property
    # @option attributes [BOOLEAN] :is_big_file The value to assign to the {#is_big_file} property
    # @option attributes [Integer] :extend_size_in_mbs The value to assign to the {#extend_size_in_mbs} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['targetType'] = 'NON_ADB_AUTOCREATE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_auto_create = attributes[:'isAutoCreate'] unless attributes[:'isAutoCreate'].nil?
      self.is_auto_create = true if is_auto_create.nil? && !attributes.key?(:'isAutoCreate') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isAutoCreate and :is_auto_create' if attributes.key?(:'isAutoCreate') && attributes.key?(:'is_auto_create')

      self.is_auto_create = attributes[:'is_auto_create'] unless attributes[:'is_auto_create'].nil?
      self.is_auto_create = true if is_auto_create.nil? && !attributes.key?(:'isAutoCreate') && !attributes.key?(:'is_auto_create') # rubocop:disable Style/StringLiterals

      self.is_big_file = attributes[:'isBigFile'] unless attributes[:'isBigFile'].nil?
      self.is_big_file = true if is_big_file.nil? && !attributes.key?(:'isBigFile') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isBigFile and :is_big_file' if attributes.key?(:'isBigFile') && attributes.key?(:'is_big_file')

      self.is_big_file = attributes[:'is_big_file'] unless attributes[:'is_big_file'].nil?
      self.is_big_file = true if is_big_file.nil? && !attributes.key?(:'isBigFile') && !attributes.key?(:'is_big_file') # rubocop:disable Style/StringLiterals

      self.extend_size_in_mbs = attributes[:'extendSizeInMBs'] if attributes[:'extendSizeInMBs']

      raise 'You cannot provide both :extendSizeInMBs and :extend_size_in_mbs' if attributes.key?(:'extendSizeInMBs') && attributes.key?(:'extend_size_in_mbs')

      self.extend_size_in_mbs = attributes[:'extend_size_in_mbs'] if attributes[:'extend_size_in_mbs']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target_type == other.target_type &&
        is_auto_create == other.is_auto_create &&
        is_big_file == other.is_big_file &&
        extend_size_in_mbs == other.extend_size_in_mbs
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
      [target_type, is_auto_create, is_big_file, extend_size_in_mbs].hash
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
