# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties used in pattern create operations.
  class DataCatalog::Models::CreatePatternDetails
    # **[Required]** A user-friendly display name. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Detailed description of the Pattern.
    # @return [String]
    attr_accessor :description

    # Input string which drives the selection process, allowing for fine-grained control using qualifiers.
    # Refer to the user documentation for details of the format and examples. A pattern cannot include both
    # a prefix and an expression.
    #
    # @return [String]
    attr_accessor :expression

    # Input string which drives the selection process.
    # Refer to the user documentation for details of the format and examples. A pattern cannot include both
    # a prefix and an expression.
    #
    # @return [String]
    attr_accessor :file_path_prefix

    # List of file paths against which the pattern can be tried, as a check. This documents, for reference
    # purposes, some example objects a pattern is meant to work with. If isEnableCheckFailureLimit is set to true,
    # this will be run as a validation during the request, such that if the check fails the request fails. If
    # isEnableCheckFailureLimit instead is set to (the default) false, a pattern will still be created or updated even
    # if the check fails, with a lifecycleState of FAILED.
    #
    # @return [Array<String>]
    attr_accessor :check_file_path_list

    # Indicates whether the pattern check, against the checkFilePathList, will fail the request if the count of
    # UNMATCHED files is above the checkFailureLimit.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enable_check_failure_limit

    # The maximum number of UNMATCHED files, in checkFilePathList, above which the check fails. Optional, if
    # checkFilePathList is provided - but if isEnableCheckFailureLimit is set to true it is required.
    #
    # @return [Integer]
    attr_accessor :check_failure_limit

    # A map of maps that contains the properties which are specific to the pattern type. Each pattern type
    # definition defines it's set of required and optional properties.
    # Example: `{\"properties\": { \"default\": { \"tbd\"}}}`
    #
    # @return [Hash<String, Hash<String, String>>]
    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'description': :'description',
        'expression': :'expression',
        'file_path_prefix': :'filePathPrefix',
        'check_file_path_list': :'checkFilePathList',
        'is_enable_check_failure_limit': :'isEnableCheckFailureLimit',
        'check_failure_limit': :'checkFailureLimit',
        'properties': :'properties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'description': :'String',
        'expression': :'String',
        'file_path_prefix': :'String',
        'check_file_path_list': :'Array<String>',
        'is_enable_check_failure_limit': :'BOOLEAN',
        'check_failure_limit': :'Integer',
        'properties': :'Hash<String, Hash<String, String>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :expression The value to assign to the {#expression} property
    # @option attributes [String] :file_path_prefix The value to assign to the {#file_path_prefix} property
    # @option attributes [Array<String>] :check_file_path_list The value to assign to the {#check_file_path_list} property
    # @option attributes [BOOLEAN] :is_enable_check_failure_limit The value to assign to the {#is_enable_check_failure_limit} property
    # @option attributes [Integer] :check_failure_limit The value to assign to the {#check_failure_limit} property
    # @option attributes [Hash<String, Hash<String, String>>] :properties The value to assign to the {#properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.expression = attributes[:'expression'] if attributes[:'expression']

      self.file_path_prefix = attributes[:'filePathPrefix'] if attributes[:'filePathPrefix']

      raise 'You cannot provide both :filePathPrefix and :file_path_prefix' if attributes.key?(:'filePathPrefix') && attributes.key?(:'file_path_prefix')

      self.file_path_prefix = attributes[:'file_path_prefix'] if attributes[:'file_path_prefix']

      self.check_file_path_list = attributes[:'checkFilePathList'] if attributes[:'checkFilePathList']

      raise 'You cannot provide both :checkFilePathList and :check_file_path_list' if attributes.key?(:'checkFilePathList') && attributes.key?(:'check_file_path_list')

      self.check_file_path_list = attributes[:'check_file_path_list'] if attributes[:'check_file_path_list']

      self.is_enable_check_failure_limit = attributes[:'isEnableCheckFailureLimit'] unless attributes[:'isEnableCheckFailureLimit'].nil?
      self.is_enable_check_failure_limit = false if is_enable_check_failure_limit.nil? && !attributes.key?(:'isEnableCheckFailureLimit') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isEnableCheckFailureLimit and :is_enable_check_failure_limit' if attributes.key?(:'isEnableCheckFailureLimit') && attributes.key?(:'is_enable_check_failure_limit')

      self.is_enable_check_failure_limit = attributes[:'is_enable_check_failure_limit'] unless attributes[:'is_enable_check_failure_limit'].nil?
      self.is_enable_check_failure_limit = false if is_enable_check_failure_limit.nil? && !attributes.key?(:'isEnableCheckFailureLimit') && !attributes.key?(:'is_enable_check_failure_limit') # rubocop:disable Style/StringLiterals

      self.check_failure_limit = attributes[:'checkFailureLimit'] if attributes[:'checkFailureLimit']

      raise 'You cannot provide both :checkFailureLimit and :check_failure_limit' if attributes.key?(:'checkFailureLimit') && attributes.key?(:'check_failure_limit')

      self.check_failure_limit = attributes[:'check_failure_limit'] if attributes[:'check_failure_limit']

      self.properties = attributes[:'properties'] if attributes[:'properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        description == other.description &&
        expression == other.expression &&
        file_path_prefix == other.file_path_prefix &&
        check_file_path_list == other.check_file_path_list &&
        is_enable_check_failure_limit == other.is_enable_check_failure_limit &&
        check_failure_limit == other.check_failure_limit &&
        properties == other.properties
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
      [display_name, description, expression, file_path_prefix, check_file_path_list, is_enable_check_failure_limit, check_failure_limit, properties].hash
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
