# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # OPSI warehouse resource.
  class Opsi::Models::OperationsInsightsWarehouse
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** OPSI Warehouse OCID
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** User-friedly name of Operations Insights Warehouse that does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** Number of OCPUs allocated to OPSI Warehouse ADW.
    #
    # @return [Float]
    attr_accessor :cpu_allocated

    # Number of OCPUs used by OPSI Warehouse ADW. Can be fractional.
    #
    # @return [Float]
    attr_accessor :cpu_used

    # Storage allocated to OPSI Warehouse ADW.
    #
    # @return [Float]
    attr_accessor :storage_allocated_in_gbs

    # Storage by OPSI Warehouse ADW in GB.
    #
    # @return [Float]
    attr_accessor :storage_used_in_gbs

    # OCID of the dynamic group created for the warehouse
    # @return [String]
    attr_accessor :dynamic_group_id

    # Tenancy Identifier of Operations Insights service
    # @return [String]
    attr_accessor :operations_insights_tenancy_id

    # The time at which the ADW wallet was last rotated for the Operations Insights Warehouse. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_last_wallet_rotated

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # **[Required]** The time at which the resource was first created. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # The time at which the resource was last updated. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** Possible lifecycle states
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'cpu_allocated': :'cpuAllocated',
        'cpu_used': :'cpuUsed',
        'storage_allocated_in_gbs': :'storageAllocatedInGBs',
        'storage_used_in_gbs': :'storageUsedInGBs',
        'dynamic_group_id': :'dynamicGroupId',
        'operations_insights_tenancy_id': :'operationsInsightsTenancyId',
        'time_last_wallet_rotated': :'timeLastWalletRotated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'cpu_allocated': :'Float',
        'cpu_used': :'Float',
        'storage_allocated_in_gbs': :'Float',
        'storage_used_in_gbs': :'Float',
        'dynamic_group_id': :'String',
        'operations_insights_tenancy_id': :'String',
        'time_last_wallet_rotated': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Float] :cpu_allocated The value to assign to the {#cpu_allocated} property
    # @option attributes [Float] :cpu_used The value to assign to the {#cpu_used} property
    # @option attributes [Float] :storage_allocated_in_gbs The value to assign to the {#storage_allocated_in_gbs} property
    # @option attributes [Float] :storage_used_in_gbs The value to assign to the {#storage_used_in_gbs} property
    # @option attributes [String] :dynamic_group_id The value to assign to the {#dynamic_group_id} property
    # @option attributes [String] :operations_insights_tenancy_id The value to assign to the {#operations_insights_tenancy_id} property
    # @option attributes [DateTime] :time_last_wallet_rotated The value to assign to the {#time_last_wallet_rotated} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.cpu_allocated = attributes[:'cpuAllocated'] if attributes[:'cpuAllocated']

      raise 'You cannot provide both :cpuAllocated and :cpu_allocated' if attributes.key?(:'cpuAllocated') && attributes.key?(:'cpu_allocated')

      self.cpu_allocated = attributes[:'cpu_allocated'] if attributes[:'cpu_allocated']

      self.cpu_used = attributes[:'cpuUsed'] if attributes[:'cpuUsed']

      raise 'You cannot provide both :cpuUsed and :cpu_used' if attributes.key?(:'cpuUsed') && attributes.key?(:'cpu_used')

      self.cpu_used = attributes[:'cpu_used'] if attributes[:'cpu_used']

      self.storage_allocated_in_gbs = attributes[:'storageAllocatedInGBs'] if attributes[:'storageAllocatedInGBs']

      raise 'You cannot provide both :storageAllocatedInGBs and :storage_allocated_in_gbs' if attributes.key?(:'storageAllocatedInGBs') && attributes.key?(:'storage_allocated_in_gbs')

      self.storage_allocated_in_gbs = attributes[:'storage_allocated_in_gbs'] if attributes[:'storage_allocated_in_gbs']

      self.storage_used_in_gbs = attributes[:'storageUsedInGBs'] if attributes[:'storageUsedInGBs']

      raise 'You cannot provide both :storageUsedInGBs and :storage_used_in_gbs' if attributes.key?(:'storageUsedInGBs') && attributes.key?(:'storage_used_in_gbs')

      self.storage_used_in_gbs = attributes[:'storage_used_in_gbs'] if attributes[:'storage_used_in_gbs']

      self.dynamic_group_id = attributes[:'dynamicGroupId'] if attributes[:'dynamicGroupId']

      raise 'You cannot provide both :dynamicGroupId and :dynamic_group_id' if attributes.key?(:'dynamicGroupId') && attributes.key?(:'dynamic_group_id')

      self.dynamic_group_id = attributes[:'dynamic_group_id'] if attributes[:'dynamic_group_id']

      self.operations_insights_tenancy_id = attributes[:'operationsInsightsTenancyId'] if attributes[:'operationsInsightsTenancyId']

      raise 'You cannot provide both :operationsInsightsTenancyId and :operations_insights_tenancy_id' if attributes.key?(:'operationsInsightsTenancyId') && attributes.key?(:'operations_insights_tenancy_id')

      self.operations_insights_tenancy_id = attributes[:'operations_insights_tenancy_id'] if attributes[:'operations_insights_tenancy_id']

      self.time_last_wallet_rotated = attributes[:'timeLastWalletRotated'] if attributes[:'timeLastWalletRotated']

      raise 'You cannot provide both :timeLastWalletRotated and :time_last_wallet_rotated' if attributes.key?(:'timeLastWalletRotated') && attributes.key?(:'time_last_wallet_rotated')

      self.time_last_wallet_rotated = attributes[:'time_last_wallet_rotated'] if attributes[:'time_last_wallet_rotated']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        cpu_allocated == other.cpu_allocated &&
        cpu_used == other.cpu_used &&
        storage_allocated_in_gbs == other.storage_allocated_in_gbs &&
        storage_used_in_gbs == other.storage_used_in_gbs &&
        dynamic_group_id == other.dynamic_group_id &&
        operations_insights_tenancy_id == other.operations_insights_tenancy_id &&
        time_last_wallet_rotated == other.time_last_wallet_rotated &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details
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
      [id, compartment_id, display_name, cpu_allocated, cpu_used, storage_allocated_in_gbs, storage_used_in_gbs, dynamic_group_id, operations_insights_tenancy_id, time_last_wallet_rotated, freeform_tags, defined_tags, system_tags, time_created, time_updated, lifecycle_state, lifecycle_details].hash
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
