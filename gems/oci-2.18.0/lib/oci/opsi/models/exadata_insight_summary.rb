# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of an Exadata insight resource.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Opsi::Models::ExadataInsightSummary
    ENTITY_SOURCE_ENUM = [
      ENTITY_SOURCE_EM_MANAGED_EXTERNAL_EXADATA = 'EM_MANAGED_EXTERNAL_EXADATA'.freeze,
      ENTITY_SOURCE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    EXADATA_TYPE_ENUM = [
      EXADATA_TYPE_DBMACHINE = 'DBMACHINE'.freeze,
      EXADATA_TYPE_EXACS = 'EXACS'.freeze,
      EXADATA_TYPE_EXACC = 'EXACC'.freeze,
      EXADATA_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    EXADATA_RACK_TYPE_ENUM = [
      EXADATA_RACK_TYPE_FULL = 'FULL'.freeze,
      EXADATA_RACK_TYPE_HALF = 'HALF'.freeze,
      EXADATA_RACK_TYPE_QUARTER = 'QUARTER'.freeze,
      EXADATA_RACK_TYPE_EIGHTH = 'EIGHTH'.freeze,
      EXADATA_RACK_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_DISABLED = 'DISABLED'.freeze,
      STATUS_ENABLED = 'ENABLED'.freeze,
      STATUS_TERMINATED = 'TERMINATED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Source of the Exadata system.
    # @return [String]
    attr_reader :entity_source

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the Exadata insight resource.
    # @return [String]
    attr_accessor :id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The Exadata system name. If the Exadata systems managed by Enterprise Manager, the name is unique amongst the Exadata systems managed by the same Enterprise Manager.
    # @return [String]
    attr_accessor :exadata_name

    # The user-friendly name for the Exadata system. The name does not have to be unique.
    # @return [String]
    attr_accessor :exadata_display_name

    # Operations Insights internal representation of the the Exadata system type.
    # @return [String]
    attr_reader :exadata_type

    # Operations Insights internal representation of the the Exadata system rack type.
    # @return [String]
    attr_reader :exadata_rack_type

    # **[Required]** Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # **[Required]** Indicates the status of an Exadata insight in Operations Insights
    # @return [String]
    attr_reader :status

    # **[Required]** The time the the Exadata insight was first enabled. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # The time the Exadata insight was updated. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the Exadata insight.
    # @return [String]
    attr_reader :lifecycle_state

    # A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state.
    # @return [String]
    attr_accessor :lifecycle_details

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
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'status': :'status',
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
        'entity_source': :'String',
        'id': :'String',
        'compartment_id': :'String',
        'exadata_name': :'String',
        'exadata_display_name': :'String',
        'exadata_type': :'String',
        'exadata_rack_type': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'status': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'entitySource'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Opsi::Models::EmManagedExternalExadataInsightSummary' if type == 'EM_MANAGED_EXTERNAL_EXADATA'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Opsi::Models::ExadataInsightSummary'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :entity_source The value to assign to the {#entity_source} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :exadata_name The value to assign to the {#exadata_name} property
    # @option attributes [String] :exadata_display_name The value to assign to the {#exadata_display_name} property
    # @option attributes [String] :exadata_type The value to assign to the {#exadata_type} property
    # @option attributes [String] :exadata_rack_type The value to assign to the {#exadata_rack_type} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.entity_source = attributes[:'entitySource'] if attributes[:'entitySource']

      raise 'You cannot provide both :entitySource and :entity_source' if attributes.key?(:'entitySource') && attributes.key?(:'entity_source')

      self.entity_source = attributes[:'entity_source'] if attributes[:'entity_source']

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.exadata_name = attributes[:'exadataName'] if attributes[:'exadataName']

      raise 'You cannot provide both :exadataName and :exadata_name' if attributes.key?(:'exadataName') && attributes.key?(:'exadata_name')

      self.exadata_name = attributes[:'exadata_name'] if attributes[:'exadata_name']

      self.exadata_display_name = attributes[:'exadataDisplayName'] if attributes[:'exadataDisplayName']

      raise 'You cannot provide both :exadataDisplayName and :exadata_display_name' if attributes.key?(:'exadataDisplayName') && attributes.key?(:'exadata_display_name')

      self.exadata_display_name = attributes[:'exadata_display_name'] if attributes[:'exadata_display_name']

      self.exadata_type = attributes[:'exadataType'] if attributes[:'exadataType']

      raise 'You cannot provide both :exadataType and :exadata_type' if attributes.key?(:'exadataType') && attributes.key?(:'exadata_type')

      self.exadata_type = attributes[:'exadata_type'] if attributes[:'exadata_type']

      self.exadata_rack_type = attributes[:'exadataRackType'] if attributes[:'exadataRackType']

      raise 'You cannot provide both :exadataRackType and :exadata_rack_type' if attributes.key?(:'exadataRackType') && attributes.key?(:'exadata_rack_type')

      self.exadata_rack_type = attributes[:'exadata_rack_type'] if attributes[:'exadata_rack_type']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.status = attributes[:'status'] if attributes[:'status']

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
    # @param [Object] entity_source Object to be assigned
    def entity_source=(entity_source)
      # rubocop:disable Style/ConditionalAssignment
      if entity_source && !ENTITY_SOURCE_ENUM.include?(entity_source)
        OCI.logger.debug("Unknown value for 'entity_source' [" + entity_source + "]. Mapping to 'ENTITY_SOURCE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @entity_source = ENTITY_SOURCE_UNKNOWN_ENUM_VALUE
      else
        @entity_source = entity_source
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] exadata_type Object to be assigned
    def exadata_type=(exadata_type)
      # rubocop:disable Style/ConditionalAssignment
      if exadata_type && !EXADATA_TYPE_ENUM.include?(exadata_type)
        OCI.logger.debug("Unknown value for 'exadata_type' [" + exadata_type + "]. Mapping to 'EXADATA_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @exadata_type = EXADATA_TYPE_UNKNOWN_ENUM_VALUE
      else
        @exadata_type = exadata_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] exadata_rack_type Object to be assigned
    def exadata_rack_type=(exadata_rack_type)
      # rubocop:disable Style/ConditionalAssignment
      if exadata_rack_type && !EXADATA_RACK_TYPE_ENUM.include?(exadata_rack_type)
        OCI.logger.debug("Unknown value for 'exadata_rack_type' [" + exadata_rack_type + "]. Mapping to 'EXADATA_RACK_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @exadata_rack_type = EXADATA_RACK_TYPE_UNKNOWN_ENUM_VALUE
      else
        @exadata_rack_type = exadata_rack_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
        entity_source == other.entity_source &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        exadata_name == other.exadata_name &&
        exadata_display_name == other.exadata_display_name &&
        exadata_type == other.exadata_type &&
        exadata_rack_type == other.exadata_rack_type &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        status == other.status &&
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
      [entity_source, id, compartment_id, exadata_name, exadata_display_name, exadata_type, exadata_rack_type, freeform_tags, defined_tags, system_tags, status, time_created, time_updated, lifecycle_state, lifecycle_details].hash
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
