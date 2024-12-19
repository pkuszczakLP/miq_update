# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_exadata_insight_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about the Exadata system to be analyzed. If memberEntityDetails is not specified, the the Enterprise Manager entity (e.g. databases and hosts) associated with an Exadata system will be placed in the same compartment as the Exadata system.
  class Opsi::Models::CreateEmManagedExternalExadataInsightDetails < Opsi::Models::CreateExadataInsightDetails
    # **[Required]** Enterprise Manager Unique Identifier
    # @return [String]
    attr_accessor :enterprise_manager_identifier

    # **[Required]** OPSI Enterprise Manager Bridge OCID
    # @return [String]
    attr_accessor :enterprise_manager_bridge_id

    # **[Required]** Enterprise Manager Entity Unique Identifier
    # @return [String]
    attr_accessor :enterprise_manager_entity_identifier

    # @return [Array<OCI::Opsi::Models::CreateEmManagedExternalExadataMemberEntityDetails>]
    attr_accessor :member_entity_details

    # Set to true to enable automatic enablement and disablement of related targets from Enterprise Manager. New resources (e.g. Database Insights) will be placed in the same compartment as the related Exadata Insight.
    # @return [BOOLEAN]
    attr_accessor :is_auto_sync_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'entitySource',
        'compartment_id': :'compartmentId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'enterprise_manager_identifier': :'enterpriseManagerIdentifier',
        'enterprise_manager_bridge_id': :'enterpriseManagerBridgeId',
        'enterprise_manager_entity_identifier': :'enterpriseManagerEntityIdentifier',
        'member_entity_details': :'memberEntityDetails',
        'is_auto_sync_enabled': :'isAutoSyncEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'String',
        'compartment_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'enterprise_manager_identifier': :'String',
        'enterprise_manager_bridge_id': :'String',
        'enterprise_manager_entity_identifier': :'String',
        'member_entity_details': :'Array<OCI::Opsi::Models::CreateEmManagedExternalExadataMemberEntityDetails>',
        'is_auto_sync_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Opsi::Models::CreateExadataInsightDetails#compartment_id #compartment_id} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Opsi::Models::CreateExadataInsightDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Opsi::Models::CreateExadataInsightDetails#defined_tags #defined_tags} proprety
    # @option attributes [String] :enterprise_manager_identifier The value to assign to the {#enterprise_manager_identifier} property
    # @option attributes [String] :enterprise_manager_bridge_id The value to assign to the {#enterprise_manager_bridge_id} property
    # @option attributes [String] :enterprise_manager_entity_identifier The value to assign to the {#enterprise_manager_entity_identifier} property
    # @option attributes [Array<OCI::Opsi::Models::CreateEmManagedExternalExadataMemberEntityDetails>] :member_entity_details The value to assign to the {#member_entity_details} property
    # @option attributes [BOOLEAN] :is_auto_sync_enabled The value to assign to the {#is_auto_sync_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['entitySource'] = 'EM_MANAGED_EXTERNAL_EXADATA'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.enterprise_manager_identifier = attributes[:'enterpriseManagerIdentifier'] if attributes[:'enterpriseManagerIdentifier']

      raise 'You cannot provide both :enterpriseManagerIdentifier and :enterprise_manager_identifier' if attributes.key?(:'enterpriseManagerIdentifier') && attributes.key?(:'enterprise_manager_identifier')

      self.enterprise_manager_identifier = attributes[:'enterprise_manager_identifier'] if attributes[:'enterprise_manager_identifier']

      self.enterprise_manager_bridge_id = attributes[:'enterpriseManagerBridgeId'] if attributes[:'enterpriseManagerBridgeId']

      raise 'You cannot provide both :enterpriseManagerBridgeId and :enterprise_manager_bridge_id' if attributes.key?(:'enterpriseManagerBridgeId') && attributes.key?(:'enterprise_manager_bridge_id')

      self.enterprise_manager_bridge_id = attributes[:'enterprise_manager_bridge_id'] if attributes[:'enterprise_manager_bridge_id']

      self.enterprise_manager_entity_identifier = attributes[:'enterpriseManagerEntityIdentifier'] if attributes[:'enterpriseManagerEntityIdentifier']

      raise 'You cannot provide both :enterpriseManagerEntityIdentifier and :enterprise_manager_entity_identifier' if attributes.key?(:'enterpriseManagerEntityIdentifier') && attributes.key?(:'enterprise_manager_entity_identifier')

      self.enterprise_manager_entity_identifier = attributes[:'enterprise_manager_entity_identifier'] if attributes[:'enterprise_manager_entity_identifier']

      self.member_entity_details = attributes[:'memberEntityDetails'] if attributes[:'memberEntityDetails']

      raise 'You cannot provide both :memberEntityDetails and :member_entity_details' if attributes.key?(:'memberEntityDetails') && attributes.key?(:'member_entity_details')

      self.member_entity_details = attributes[:'member_entity_details'] if attributes[:'member_entity_details']

      self.is_auto_sync_enabled = attributes[:'isAutoSyncEnabled'] unless attributes[:'isAutoSyncEnabled'].nil?

      raise 'You cannot provide both :isAutoSyncEnabled and :is_auto_sync_enabled' if attributes.key?(:'isAutoSyncEnabled') && attributes.key?(:'is_auto_sync_enabled')

      self.is_auto_sync_enabled = attributes[:'is_auto_sync_enabled'] unless attributes[:'is_auto_sync_enabled'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        entity_source == other.entity_source &&
        compartment_id == other.compartment_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        enterprise_manager_identifier == other.enterprise_manager_identifier &&
        enterprise_manager_bridge_id == other.enterprise_manager_bridge_id &&
        enterprise_manager_entity_identifier == other.enterprise_manager_entity_identifier &&
        member_entity_details == other.member_entity_details &&
        is_auto_sync_enabled == other.is_auto_sync_enabled
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
      [entity_source, compartment_id, freeform_tags, defined_tags, enterprise_manager_identifier, enterprise_manager_bridge_id, enterprise_manager_entity_identifier, member_entity_details, is_auto_sync_enabled].hash
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
