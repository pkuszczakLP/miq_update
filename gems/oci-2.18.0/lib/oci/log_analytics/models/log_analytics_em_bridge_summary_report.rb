# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Log-Analytics EM Bridge counts summary.
  #
  class LogAnalytics::Models::LogAnalyticsEmBridgeSummaryReport
    # **[Required]** Compartment Identifier [OCID] (https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Total number of ACTIVE enterprise manager bridges.
    #
    # @return [Integer]
    attr_accessor :active_em_bridge_count

    # **[Required]** Number of enterprise manager bridges in CREATING state.
    #
    # @return [Integer]
    attr_accessor :creating_em_bridge_count

    # **[Required]** Number of enterprise manager bridges in NEEDS_ATTENTION state.
    #
    # @return [Integer]
    attr_accessor :needs_attention_em_bridge_count

    # **[Required]** Number of enterprise manager bridges in DELETED state.
    #
    # @return [Integer]
    attr_accessor :deleted_em_bridge_count

    # **[Required]** Total number of enterprise manager bridges.
    #
    # @return [Integer]
    attr_accessor :total_em_bridge_count

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'active_em_bridge_count': :'activeEmBridgeCount',
        'creating_em_bridge_count': :'creatingEmBridgeCount',
        'needs_attention_em_bridge_count': :'needsAttentionEmBridgeCount',
        'deleted_em_bridge_count': :'deletedEmBridgeCount',
        'total_em_bridge_count': :'totalEmBridgeCount'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'active_em_bridge_count': :'Integer',
        'creating_em_bridge_count': :'Integer',
        'needs_attention_em_bridge_count': :'Integer',
        'deleted_em_bridge_count': :'Integer',
        'total_em_bridge_count': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :active_em_bridge_count The value to assign to the {#active_em_bridge_count} property
    # @option attributes [Integer] :creating_em_bridge_count The value to assign to the {#creating_em_bridge_count} property
    # @option attributes [Integer] :needs_attention_em_bridge_count The value to assign to the {#needs_attention_em_bridge_count} property
    # @option attributes [Integer] :deleted_em_bridge_count The value to assign to the {#deleted_em_bridge_count} property
    # @option attributes [Integer] :total_em_bridge_count The value to assign to the {#total_em_bridge_count} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.active_em_bridge_count = attributes[:'activeEmBridgeCount'] if attributes[:'activeEmBridgeCount']

      raise 'You cannot provide both :activeEmBridgeCount and :active_em_bridge_count' if attributes.key?(:'activeEmBridgeCount') && attributes.key?(:'active_em_bridge_count')

      self.active_em_bridge_count = attributes[:'active_em_bridge_count'] if attributes[:'active_em_bridge_count']

      self.creating_em_bridge_count = attributes[:'creatingEmBridgeCount'] if attributes[:'creatingEmBridgeCount']

      raise 'You cannot provide both :creatingEmBridgeCount and :creating_em_bridge_count' if attributes.key?(:'creatingEmBridgeCount') && attributes.key?(:'creating_em_bridge_count')

      self.creating_em_bridge_count = attributes[:'creating_em_bridge_count'] if attributes[:'creating_em_bridge_count']

      self.needs_attention_em_bridge_count = attributes[:'needsAttentionEmBridgeCount'] if attributes[:'needsAttentionEmBridgeCount']

      raise 'You cannot provide both :needsAttentionEmBridgeCount and :needs_attention_em_bridge_count' if attributes.key?(:'needsAttentionEmBridgeCount') && attributes.key?(:'needs_attention_em_bridge_count')

      self.needs_attention_em_bridge_count = attributes[:'needs_attention_em_bridge_count'] if attributes[:'needs_attention_em_bridge_count']

      self.deleted_em_bridge_count = attributes[:'deletedEmBridgeCount'] if attributes[:'deletedEmBridgeCount']

      raise 'You cannot provide both :deletedEmBridgeCount and :deleted_em_bridge_count' if attributes.key?(:'deletedEmBridgeCount') && attributes.key?(:'deleted_em_bridge_count')

      self.deleted_em_bridge_count = attributes[:'deleted_em_bridge_count'] if attributes[:'deleted_em_bridge_count']

      self.total_em_bridge_count = attributes[:'totalEmBridgeCount'] if attributes[:'totalEmBridgeCount']

      raise 'You cannot provide both :totalEmBridgeCount and :total_em_bridge_count' if attributes.key?(:'totalEmBridgeCount') && attributes.key?(:'total_em_bridge_count')

      self.total_em_bridge_count = attributes[:'total_em_bridge_count'] if attributes[:'total_em_bridge_count']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        active_em_bridge_count == other.active_em_bridge_count &&
        creating_em_bridge_count == other.creating_em_bridge_count &&
        needs_attention_em_bridge_count == other.needs_attention_em_bridge_count &&
        deleted_em_bridge_count == other.deleted_em_bridge_count &&
        total_em_bridge_count == other.total_em_bridge_count
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
      [compartment_id, active_em_bridge_count, creating_em_bridge_count, needs_attention_em_bridge_count, deleted_em_bridge_count, total_em_bridge_count].hash
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
