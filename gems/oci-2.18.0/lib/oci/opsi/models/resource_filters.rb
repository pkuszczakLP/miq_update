# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Information to filter the actual target resources in an operation.
  # e.g: While quering a DATABASE_INSIGHTS_DATA_OBJECT using /opsiDataObjects/{opsiDataObjectidentifier}/actions/queryData API,
  # if resourceFilters is set with valid value for definedTagEquals field, only data of the database insights
  # resources for which the specified freeform tags exist will be considered for the actual query scope.
  #
  class Opsi::Models::ResourceFilters
    # A list of tag filters to apply.  Only resources with a defined tag matching the value will be considered.
    # Each item in the list has the format \"{namespace}.{tagName}.{value}\".  All inputs are case-insensitive.
    # Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    # Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @return [Array<String>]
    attr_accessor :defined_tag_equals

    # A list of tag filters to apply.  Only resources with a freeform tag matching the value will be considered.
    # The key for each tag is \"{tagName}.{value}\".  All inputs are case-insensitive.
    # Multiple values for the same tag name are interpreted as \"OR\".  Values for different tag names are interpreted as \"AND\".
    #
    # @return [Array<String>]
    attr_accessor :freeform_tag_equals

    # A list of tag existence filters to apply.  Only resources for which the specified defined tags exist will be considered.
    # Each item in the list has the format \"{namespace}.{tagName}.true\" (for checking existence of a defined tag)
    # or \"{namespace}.true\".  All inputs are case-insensitive.
    # Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    # Multiple values for the same key (i.e. same namespace and tag name) are interpreted as \"OR\".
    # Values for different keys (i.e. different namespaces, different tag names, or both) are interpreted as \"AND\".
    #
    # @return [Array<String>]
    attr_accessor :defined_tag_exists

    # A list of tag existence filters to apply.  Only resources for which the specified freeform tags exist will be considered.
    # The key for each tag is \"{tagName}.true\".  All inputs are case-insensitive.
    # Currently, only existence (\"true\" at the end) is supported. Absence (\"false\" at the end) is not supported.
    # Multiple values for different tag names are interpreted as \"AND\".
    #
    # @return [Array<String>]
    attr_accessor :freeform_tag_exists

    # A flag to consider all resources within a given compartment and all sub-compartments.
    # @return [BOOLEAN]
    attr_accessor :compartment_id_in_subtree

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'defined_tag_equals': :'definedTagEquals',
        'freeform_tag_equals': :'freeformTagEquals',
        'defined_tag_exists': :'definedTagExists',
        'freeform_tag_exists': :'freeformTagExists',
        'compartment_id_in_subtree': :'compartmentIdInSubtree'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'defined_tag_equals': :'Array<String>',
        'freeform_tag_equals': :'Array<String>',
        'defined_tag_exists': :'Array<String>',
        'freeform_tag_exists': :'Array<String>',
        'compartment_id_in_subtree': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Array<String>] :defined_tag_equals The value to assign to the {#defined_tag_equals} property
    # @option attributes [Array<String>] :freeform_tag_equals The value to assign to the {#freeform_tag_equals} property
    # @option attributes [Array<String>] :defined_tag_exists The value to assign to the {#defined_tag_exists} property
    # @option attributes [Array<String>] :freeform_tag_exists The value to assign to the {#freeform_tag_exists} property
    # @option attributes [BOOLEAN] :compartment_id_in_subtree The value to assign to the {#compartment_id_in_subtree} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.defined_tag_equals = attributes[:'definedTagEquals'] if attributes[:'definedTagEquals']

      raise 'You cannot provide both :definedTagEquals and :defined_tag_equals' if attributes.key?(:'definedTagEquals') && attributes.key?(:'defined_tag_equals')

      self.defined_tag_equals = attributes[:'defined_tag_equals'] if attributes[:'defined_tag_equals']

      self.freeform_tag_equals = attributes[:'freeformTagEquals'] if attributes[:'freeformTagEquals']

      raise 'You cannot provide both :freeformTagEquals and :freeform_tag_equals' if attributes.key?(:'freeformTagEquals') && attributes.key?(:'freeform_tag_equals')

      self.freeform_tag_equals = attributes[:'freeform_tag_equals'] if attributes[:'freeform_tag_equals']

      self.defined_tag_exists = attributes[:'definedTagExists'] if attributes[:'definedTagExists']

      raise 'You cannot provide both :definedTagExists and :defined_tag_exists' if attributes.key?(:'definedTagExists') && attributes.key?(:'defined_tag_exists')

      self.defined_tag_exists = attributes[:'defined_tag_exists'] if attributes[:'defined_tag_exists']

      self.freeform_tag_exists = attributes[:'freeformTagExists'] if attributes[:'freeformTagExists']

      raise 'You cannot provide both :freeformTagExists and :freeform_tag_exists' if attributes.key?(:'freeformTagExists') && attributes.key?(:'freeform_tag_exists')

      self.freeform_tag_exists = attributes[:'freeform_tag_exists'] if attributes[:'freeform_tag_exists']

      self.compartment_id_in_subtree = attributes[:'compartmentIdInSubtree'] unless attributes[:'compartmentIdInSubtree'].nil?
      self.compartment_id_in_subtree = false if compartment_id_in_subtree.nil? && !attributes.key?(:'compartmentIdInSubtree') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :compartmentIdInSubtree and :compartment_id_in_subtree' if attributes.key?(:'compartmentIdInSubtree') && attributes.key?(:'compartment_id_in_subtree')

      self.compartment_id_in_subtree = attributes[:'compartment_id_in_subtree'] unless attributes[:'compartment_id_in_subtree'].nil?
      self.compartment_id_in_subtree = false if compartment_id_in_subtree.nil? && !attributes.key?(:'compartmentIdInSubtree') && !attributes.key?(:'compartment_id_in_subtree') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        defined_tag_equals == other.defined_tag_equals &&
        freeform_tag_equals == other.freeform_tag_equals &&
        defined_tag_exists == other.defined_tag_exists &&
        freeform_tag_exists == other.freeform_tag_exists &&
        compartment_id_in_subtree == other.compartment_id_in_subtree
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
      [defined_tag_equals, freeform_tag_equals, defined_tag_exists, freeform_tag_exists, compartment_id_in_subtree].hash
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
