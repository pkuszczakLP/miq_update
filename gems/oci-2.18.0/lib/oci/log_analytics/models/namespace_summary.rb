# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The is the namespace summary of a tenancy in Logan Analytics application
  class LogAnalytics::Models::NamespaceSummary
    # **[Required]** This is the namespace name of a tenancy
    # @return [String]
    attr_accessor :namespace_name

    # **[Required]** The is the tenancy ID
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** This indicates if the tenancy is onboarded to Logging Analytics
    # @return [BOOLEAN]
    attr_accessor :is_onboarded

    # This indicates if the log set feature is enabled for the tenancy
    # @return [BOOLEAN]
    attr_accessor :is_log_set_enabled

    # This indicates if data has ever been ingested for the tenancy in Logging Analytics
    # @return [BOOLEAN]
    attr_accessor :is_data_ever_ingested

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace_name': :'namespaceName',
        'compartment_id': :'compartmentId',
        'is_onboarded': :'isOnboarded',
        'is_log_set_enabled': :'isLogSetEnabled',
        'is_data_ever_ingested': :'isDataEverIngested'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'namespace_name': :'String',
        'compartment_id': :'String',
        'is_onboarded': :'BOOLEAN',
        'is_log_set_enabled': :'BOOLEAN',
        'is_data_ever_ingested': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :namespace_name The value to assign to the {#namespace_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :is_onboarded The value to assign to the {#is_onboarded} property
    # @option attributes [BOOLEAN] :is_log_set_enabled The value to assign to the {#is_log_set_enabled} property
    # @option attributes [BOOLEAN] :is_data_ever_ingested The value to assign to the {#is_data_ever_ingested} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      self.namespace_name = attributes[:'namespaceName'] if attributes[:'namespaceName']

      raise 'You cannot provide both :namespaceName and :namespace_name' if attributes.key?(:'namespaceName') && attributes.key?(:'namespace_name')

      self.namespace_name = attributes[:'namespace_name'] if attributes[:'namespace_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_onboarded = attributes[:'isOnboarded'] unless attributes[:'isOnboarded'].nil?

      raise 'You cannot provide both :isOnboarded and :is_onboarded' if attributes.key?(:'isOnboarded') && attributes.key?(:'is_onboarded')

      self.is_onboarded = attributes[:'is_onboarded'] unless attributes[:'is_onboarded'].nil?

      self.is_log_set_enabled = attributes[:'isLogSetEnabled'] unless attributes[:'isLogSetEnabled'].nil?
      self.is_log_set_enabled = false if is_log_set_enabled.nil? && !attributes.key?(:'isLogSetEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isLogSetEnabled and :is_log_set_enabled' if attributes.key?(:'isLogSetEnabled') && attributes.key?(:'is_log_set_enabled')

      self.is_log_set_enabled = attributes[:'is_log_set_enabled'] unless attributes[:'is_log_set_enabled'].nil?
      self.is_log_set_enabled = false if is_log_set_enabled.nil? && !attributes.key?(:'isLogSetEnabled') && !attributes.key?(:'is_log_set_enabled') # rubocop:disable Style/StringLiterals

      self.is_data_ever_ingested = attributes[:'isDataEverIngested'] unless attributes[:'isDataEverIngested'].nil?
      self.is_data_ever_ingested = false if is_data_ever_ingested.nil? && !attributes.key?(:'isDataEverIngested') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isDataEverIngested and :is_data_ever_ingested' if attributes.key?(:'isDataEverIngested') && attributes.key?(:'is_data_ever_ingested')

      self.is_data_ever_ingested = attributes[:'is_data_ever_ingested'] unless attributes[:'is_data_ever_ingested'].nil?
      self.is_data_ever_ingested = false if is_data_ever_ingested.nil? && !attributes.key?(:'isDataEverIngested') && !attributes.key?(:'is_data_ever_ingested') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        namespace_name == other.namespace_name &&
        compartment_id == other.compartment_id &&
        is_onboarded == other.is_onboarded &&
        is_log_set_enabled == other.is_log_set_enabled &&
        is_data_ever_ingested == other.is_data_ever_ingested
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
      [namespace_name, compartment_id, is_onboarded, is_log_set_enabled, is_data_ever_ingested].hash
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
