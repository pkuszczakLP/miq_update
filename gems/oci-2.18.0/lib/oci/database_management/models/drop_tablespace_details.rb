# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details required to drop a tablespace.
  class DatabaseManagement::Models::DropTablespaceDetails
    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails]
    attr_accessor :credential_details

    # Specifies whether all the contents of the tablespace being dropped should be dropped.
    #
    # @return [BOOLEAN]
    attr_accessor :is_including_contents

    # Specifies whether all the associated data files of the tablespace being dropped should be dropped.
    #
    # @return [BOOLEAN]
    attr_accessor :is_dropping_data_files

    # Specifies whether all the constraints on the tablespace being dropped should be dropped.
    #
    # @return [BOOLEAN]
    attr_accessor :is_cascade_constraints

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_details': :'credentialDetails',
        'is_including_contents': :'isIncludingContents',
        'is_dropping_data_files': :'isDroppingDataFiles',
        'is_cascade_constraints': :'isCascadeConstraints'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'credential_details': :'OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails',
        'is_including_contents': :'BOOLEAN',
        'is_dropping_data_files': :'BOOLEAN',
        'is_cascade_constraints': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::DatabaseManagement::Models::TablespaceAdminCredentialDetails] :credential_details The value to assign to the {#credential_details} property
    # @option attributes [BOOLEAN] :is_including_contents The value to assign to the {#is_including_contents} property
    # @option attributes [BOOLEAN] :is_dropping_data_files The value to assign to the {#is_dropping_data_files} property
    # @option attributes [BOOLEAN] :is_cascade_constraints The value to assign to the {#is_cascade_constraints} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.credential_details = attributes[:'credentialDetails'] if attributes[:'credentialDetails']

      raise 'You cannot provide both :credentialDetails and :credential_details' if attributes.key?(:'credentialDetails') && attributes.key?(:'credential_details')

      self.credential_details = attributes[:'credential_details'] if attributes[:'credential_details']

      self.is_including_contents = attributes[:'isIncludingContents'] unless attributes[:'isIncludingContents'].nil?

      raise 'You cannot provide both :isIncludingContents and :is_including_contents' if attributes.key?(:'isIncludingContents') && attributes.key?(:'is_including_contents')

      self.is_including_contents = attributes[:'is_including_contents'] unless attributes[:'is_including_contents'].nil?

      self.is_dropping_data_files = attributes[:'isDroppingDataFiles'] unless attributes[:'isDroppingDataFiles'].nil?

      raise 'You cannot provide both :isDroppingDataFiles and :is_dropping_data_files' if attributes.key?(:'isDroppingDataFiles') && attributes.key?(:'is_dropping_data_files')

      self.is_dropping_data_files = attributes[:'is_dropping_data_files'] unless attributes[:'is_dropping_data_files'].nil?

      self.is_cascade_constraints = attributes[:'isCascadeConstraints'] unless attributes[:'isCascadeConstraints'].nil?

      raise 'You cannot provide both :isCascadeConstraints and :is_cascade_constraints' if attributes.key?(:'isCascadeConstraints') && attributes.key?(:'is_cascade_constraints')

      self.is_cascade_constraints = attributes[:'is_cascade_constraints'] unless attributes[:'is_cascade_constraints'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        credential_details == other.credential_details &&
        is_including_contents == other.is_including_contents &&
        is_dropping_data_files == other.is_dropping_data_files &&
        is_cascade_constraints == other.is_cascade_constraints
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
      [credential_details, is_including_contents, is_dropping_data_files, is_cascade_constraints].hash
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
