# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'exadata_insight'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # EM-managed Exadata insight resource.
  class Opsi::Models::EmManagedExternalExadataInsight < Opsi::Models::ExadataInsight
    # **[Required]** Enterprise Manager Unique Identifier
    # @return [String]
    attr_accessor :enterprise_manager_identifier

    # **[Required]** Enterprise Manager Entity Name
    # @return [String]
    attr_accessor :enterprise_manager_entity_name

    # **[Required]** Enterprise Manager Entity Type
    # @return [String]
    attr_accessor :enterprise_manager_entity_type

    # **[Required]** Enterprise Manager Entity Unique Identifier
    # @return [String]
    attr_accessor :enterprise_manager_entity_identifier

    # Enterprise Manager Entity Display Name
    # @return [String]
    attr_accessor :enterprise_manager_entity_display_name

    # **[Required]** OPSI Enterprise Manager Bridge OCID
    # @return [String]
    attr_accessor :enterprise_manager_bridge_id

    # Set to true to enable automatic enablement and disablement of related targets from Enterprise Manager. New resources (e.g. Database Insights) will be placed in the same compartment as the related Exadata Insight.
    # @return [BOOLEAN]
    attr_accessor :is_auto_sync_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'entitySource',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'exadata_name': :'exadataName',
        'exadata_display_name': :'exadataDisplayName',
        'exadata_type': :'exadataType',
        'exadata_rack_type': :'exadataRackType',
        'is_virtualized_exadata': :'isVirtualizedExadata',
        'status': :'status',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'enterprise_manager_identifier': :'enterpriseManagerIdentifier',
        'enterprise_manager_entity_name': :'enterpriseManagerEntityName',
        'enterprise_manager_entity_type': :'enterpriseManagerEntityType',
        'enterprise_manager_entity_identifier': :'enterpriseManagerEntityIdentifier',
        'enterprise_manager_entity_display_name': :'enterpriseManagerEntityDisplayName',
        'enterprise_manager_bridge_id': :'enterpriseManagerBridgeId',
        'is_auto_sync_enabled': :'isAutoSyncEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'entity_source': :'String',
        'id': :'String',
        'compartment_id': :'String',
        'exadata_name': :'String',
        'exadata_display_name': :'String',
        'exadata_type': :'String',
        'exadata_rack_type': :'String',
        'is_virtualized_exadata': :'BOOLEAN',
        'status': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'enterprise_manager_identifier': :'String',
        'enterprise_manager_entity_name': :'String',
        'enterprise_manager_entity_type': :'String',
        'enterprise_manager_entity_identifier': :'String',
        'enterprise_manager_entity_display_name': :'String',
        'enterprise_manager_bridge_id': :'String',
        'is_auto_sync_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::Opsi::Models::ExadataInsight#id #id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::Opsi::Models::ExadataInsight#compartment_id #compartment_id} proprety
    # @option attributes [String] :exadata_name The value to assign to the {OCI::Opsi::Models::ExadataInsight#exadata_name #exadata_name} proprety
    # @option attributes [String] :exadata_display_name The value to assign to the {OCI::Opsi::Models::ExadataInsight#exadata_display_name #exadata_display_name} proprety
    # @option attributes [String] :exadata_type The value to assign to the {OCI::Opsi::Models::ExadataInsight#exadata_type #exadata_type} proprety
    # @option attributes [String] :exadata_rack_type The value to assign to the {OCI::Opsi::Models::ExadataInsight#exadata_rack_type #exadata_rack_type} proprety
    # @option attributes [BOOLEAN] :is_virtualized_exadata The value to assign to the {OCI::Opsi::Models::ExadataInsight#is_virtualized_exadata #is_virtualized_exadata} proprety
    # @option attributes [String] :status The value to assign to the {OCI::Opsi::Models::ExadataInsight#status #status} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Opsi::Models::ExadataInsight#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Opsi::Models::ExadataInsight#defined_tags #defined_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {OCI::Opsi::Models::ExadataInsight#system_tags #system_tags} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::Opsi::Models::ExadataInsight#time_created #time_created} proprety
    # @option attributes [DateTime] :time_updated The value to assign to the {OCI::Opsi::Models::ExadataInsight#time_updated #time_updated} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::Opsi::Models::ExadataInsight#lifecycle_state #lifecycle_state} proprety
    # @option attributes [String] :lifecycle_details The value to assign to the {OCI::Opsi::Models::ExadataInsight#lifecycle_details #lifecycle_details} proprety
    # @option attributes [String] :enterprise_manager_identifier The value to assign to the {#enterprise_manager_identifier} property
    # @option attributes [String] :enterprise_manager_entity_name The value to assign to the {#enterprise_manager_entity_name} property
    # @option attributes [String] :enterprise_manager_entity_type The value to assign to the {#enterprise_manager_entity_type} property
    # @option attributes [String] :enterprise_manager_entity_identifier The value to assign to the {#enterprise_manager_entity_identifier} property
    # @option attributes [String] :enterprise_manager_entity_display_name The value to assign to the {#enterprise_manager_entity_display_name} property
    # @option attributes [String] :enterprise_manager_bridge_id The value to assign to the {#enterprise_manager_bridge_id} property
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

      self.enterprise_manager_entity_name = attributes[:'enterpriseManagerEntityName'] if attributes[:'enterpriseManagerEntityName']

      raise 'You cannot provide both :enterpriseManagerEntityName and :enterprise_manager_entity_name' if attributes.key?(:'enterpriseManagerEntityName') && attributes.key?(:'enterprise_manager_entity_name')

      self.enterprise_manager_entity_name = attributes[:'enterprise_manager_entity_name'] if attributes[:'enterprise_manager_entity_name']

      self.enterprise_manager_entity_type = attributes[:'enterpriseManagerEntityType'] if attributes[:'enterpriseManagerEntityType']

      raise 'You cannot provide both :enterpriseManagerEntityType and :enterprise_manager_entity_type' if attributes.key?(:'enterpriseManagerEntityType') && attributes.key?(:'enterprise_manager_entity_type')

      self.enterprise_manager_entity_type = attributes[:'enterprise_manager_entity_type'] if attributes[:'enterprise_manager_entity_type']

      self.enterprise_manager_entity_identifier = attributes[:'enterpriseManagerEntityIdentifier'] if attributes[:'enterpriseManagerEntityIdentifier']

      raise 'You cannot provide both :enterpriseManagerEntityIdentifier and :enterprise_manager_entity_identifier' if attributes.key?(:'enterpriseManagerEntityIdentifier') && attributes.key?(:'enterprise_manager_entity_identifier')

      self.enterprise_manager_entity_identifier = attributes[:'enterprise_manager_entity_identifier'] if attributes[:'enterprise_manager_entity_identifier']

      self.enterprise_manager_entity_display_name = attributes[:'enterpriseManagerEntityDisplayName'] if attributes[:'enterpriseManagerEntityDisplayName']

      raise 'You cannot provide both :enterpriseManagerEntityDisplayName and :enterprise_manager_entity_display_name' if attributes.key?(:'enterpriseManagerEntityDisplayName') && attributes.key?(:'enterprise_manager_entity_display_name')

      self.enterprise_manager_entity_display_name = attributes[:'enterprise_manager_entity_display_name'] if attributes[:'enterprise_manager_entity_display_name']

      self.enterprise_manager_bridge_id = attributes[:'enterpriseManagerBridgeId'] if attributes[:'enterpriseManagerBridgeId']

      raise 'You cannot provide both :enterpriseManagerBridgeId and :enterprise_manager_bridge_id' if attributes.key?(:'enterpriseManagerBridgeId') && attributes.key?(:'enterprise_manager_bridge_id')

      self.enterprise_manager_bridge_id = attributes[:'enterprise_manager_bridge_id'] if attributes[:'enterprise_manager_bridge_id']

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
        id == other.id &&
        compartment_id == other.compartment_id &&
        exadata_name == other.exadata_name &&
        exadata_display_name == other.exadata_display_name &&
        exadata_type == other.exadata_type &&
        exadata_rack_type == other.exadata_rack_type &&
        is_virtualized_exadata == other.is_virtualized_exadata &&
        status == other.status &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        enterprise_manager_identifier == other.enterprise_manager_identifier &&
        enterprise_manager_entity_name == other.enterprise_manager_entity_name &&
        enterprise_manager_entity_type == other.enterprise_manager_entity_type &&
        enterprise_manager_entity_identifier == other.enterprise_manager_entity_identifier &&
        enterprise_manager_entity_display_name == other.enterprise_manager_entity_display_name &&
        enterprise_manager_bridge_id == other.enterprise_manager_bridge_id &&
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
      [entity_source, id, compartment_id, exadata_name, exadata_display_name, exadata_type, exadata_rack_type, is_virtualized_exadata, status, freeform_tags, defined_tags, system_tags, time_created, time_updated, lifecycle_state, lifecycle_details, enterprise_manager_identifier, enterprise_manager_entity_name, enterprise_manager_entity_type, enterprise_manager_entity_identifier, enterprise_manager_entity_display_name, enterprise_manager_bridge_id, is_auto_sync_enabled].hash
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
