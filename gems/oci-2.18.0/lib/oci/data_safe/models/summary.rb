# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of the audit report.
  class DataSafe::Models::Summary
    # **[Required]** Name of the report summary.
    # @return [String]
    attr_accessor :name

    # Indicates if the summary is hidden. Values can either be 'true' or 'false'.
    # @return [BOOLEAN]
    attr_accessor :is_hidden

    # **[Required]** Specifies the order in which the summary must be displayed.
    # @return [Integer]
    attr_accessor :display_order

    # A comma-delimited string that specifies the names of the fields by which the records must be aggregated to get the summary.
    # @return [String]
    attr_accessor :group_by_field_name

    # Name of the key or count of object.
    # @return [String]
    attr_accessor :count_of

    # Additional scim filters used to get the specific summary.
    # @return [String]
    attr_accessor :scim_filter

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'is_hidden': :'isHidden',
        'display_order': :'displayOrder',
        'group_by_field_name': :'groupByFieldName',
        'count_of': :'countOf',
        'scim_filter': :'scimFilter'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'is_hidden': :'BOOLEAN',
        'display_order': :'Integer',
        'group_by_field_name': :'String',
        'count_of': :'String',
        'scim_filter': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [BOOLEAN] :is_hidden The value to assign to the {#is_hidden} property
    # @option attributes [Integer] :display_order The value to assign to the {#display_order} property
    # @option attributes [String] :group_by_field_name The value to assign to the {#group_by_field_name} property
    # @option attributes [String] :count_of The value to assign to the {#count_of} property
    # @option attributes [String] :scim_filter The value to assign to the {#scim_filter} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.is_hidden = attributes[:'isHidden'] unless attributes[:'isHidden'].nil?
      self.is_hidden = true if is_hidden.nil? && !attributes.key?(:'isHidden') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isHidden and :is_hidden' if attributes.key?(:'isHidden') && attributes.key?(:'is_hidden')

      self.is_hidden = attributes[:'is_hidden'] unless attributes[:'is_hidden'].nil?
      self.is_hidden = true if is_hidden.nil? && !attributes.key?(:'isHidden') && !attributes.key?(:'is_hidden') # rubocop:disable Style/StringLiterals

      self.display_order = attributes[:'displayOrder'] if attributes[:'displayOrder']

      raise 'You cannot provide both :displayOrder and :display_order' if attributes.key?(:'displayOrder') && attributes.key?(:'display_order')

      self.display_order = attributes[:'display_order'] if attributes[:'display_order']

      self.group_by_field_name = attributes[:'groupByFieldName'] if attributes[:'groupByFieldName']

      raise 'You cannot provide both :groupByFieldName and :group_by_field_name' if attributes.key?(:'groupByFieldName') && attributes.key?(:'group_by_field_name')

      self.group_by_field_name = attributes[:'group_by_field_name'] if attributes[:'group_by_field_name']

      self.count_of = attributes[:'countOf'] if attributes[:'countOf']

      raise 'You cannot provide both :countOf and :count_of' if attributes.key?(:'countOf') && attributes.key?(:'count_of')

      self.count_of = attributes[:'count_of'] if attributes[:'count_of']

      self.scim_filter = attributes[:'scimFilter'] if attributes[:'scimFilter']

      raise 'You cannot provide both :scimFilter and :scim_filter' if attributes.key?(:'scimFilter') && attributes.key?(:'scim_filter')

      self.scim_filter = attributes[:'scim_filter'] if attributes[:'scim_filter']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        is_hidden == other.is_hidden &&
        display_order == other.display_order &&
        group_by_field_name == other.group_by_field_name &&
        count_of == other.count_of &&
        scim_filter == other.scim_filter
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
      [name, is_hidden, display_order, group_by_field_name, count_of, scim_filter].hash
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
