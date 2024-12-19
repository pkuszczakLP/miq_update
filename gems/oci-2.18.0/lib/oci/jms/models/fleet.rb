# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A Fleet is the primary collection with which users interact when using Java Management Service.
  #
  class Jms::Models::Fleet
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Fleet.
    # @return [String]
    attr_accessor :id

    # **[Required]** The name of the Fleet.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The Fleet's description.
    # @return [String]
    attr_accessor :description

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment of the Fleet.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The approximate count of all unique Java Runtimes in the Fleet in the past seven days.
    # This metric is provided on a best-effort manner, and is not taken into account when computing the resource ETag.
    #
    # @return [Integer]
    attr_accessor :approximate_jre_count

    # **[Required]** The approximate count of all unique Java installations in the Fleet in the past seven days.
    # This metric is provided on a best-effort manner, and is not taken into account when computing the resource ETag.
    #
    # @return [Integer]
    attr_accessor :approximate_installation_count

    # **[Required]** The approximate count of all unique applications in the Fleet in the past seven days.
    # This metric is provided on a best-effort manner, and is not taken into account when computing the resource ETag.
    #
    # @return [Integer]
    attr_accessor :approximate_application_count

    # **[Required]** The approximate count of all unique managed instances in the Fleet in the past seven days.
    # This metric is provided on a best-effort manner, and is not taken into account when computing the resource ETag.
    #
    # @return [Integer]
    attr_accessor :approximate_managed_instance_count

    # @return [OCI::Jms::Models::CustomLog]
    attr_accessor :inventory_log

    # @return [OCI::Jms::Models::CustomLog]
    attr_accessor :operation_log

    # **[Required]** The creation date and time of the Fleet (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The lifecycle state of the Fleet.
    # @return [String]
    attr_reader :lifecycle_state

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`. (See [Understanding Free-form Tags](https://docs.cloud.oracle.com/Content/Tagging/Tasks/managingtagsandtagnamespaces.htm)).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`. (See [Managing Tags and Tag Namespaces](https://docs.cloud.oracle.com/Content/Tagging/Concepts/understandingfreeformtags.htm).)
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # System tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # System tags can be viewed by users, but can only be created by the system.
    #
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'approximate_jre_count': :'approximateJreCount',
        'approximate_installation_count': :'approximateInstallationCount',
        'approximate_application_count': :'approximateApplicationCount',
        'approximate_managed_instance_count': :'approximateManagedInstanceCount',
        'inventory_log': :'inventoryLog',
        'operation_log': :'operationLog',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'approximate_jre_count': :'Integer',
        'approximate_installation_count': :'Integer',
        'approximate_application_count': :'Integer',
        'approximate_managed_instance_count': :'Integer',
        'inventory_log': :'OCI::Jms::Models::CustomLog',
        'operation_log': :'OCI::Jms::Models::CustomLog',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :approximate_jre_count The value to assign to the {#approximate_jre_count} property
    # @option attributes [Integer] :approximate_installation_count The value to assign to the {#approximate_installation_count} property
    # @option attributes [Integer] :approximate_application_count The value to assign to the {#approximate_application_count} property
    # @option attributes [Integer] :approximate_managed_instance_count The value to assign to the {#approximate_managed_instance_count} property
    # @option attributes [OCI::Jms::Models::CustomLog] :inventory_log The value to assign to the {#inventory_log} property
    # @option attributes [OCI::Jms::Models::CustomLog] :operation_log The value to assign to the {#operation_log} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.approximate_jre_count = attributes[:'approximateJreCount'] if attributes[:'approximateJreCount']

      raise 'You cannot provide both :approximateJreCount and :approximate_jre_count' if attributes.key?(:'approximateJreCount') && attributes.key?(:'approximate_jre_count')

      self.approximate_jre_count = attributes[:'approximate_jre_count'] if attributes[:'approximate_jre_count']

      self.approximate_installation_count = attributes[:'approximateInstallationCount'] if attributes[:'approximateInstallationCount']

      raise 'You cannot provide both :approximateInstallationCount and :approximate_installation_count' if attributes.key?(:'approximateInstallationCount') && attributes.key?(:'approximate_installation_count')

      self.approximate_installation_count = attributes[:'approximate_installation_count'] if attributes[:'approximate_installation_count']

      self.approximate_application_count = attributes[:'approximateApplicationCount'] if attributes[:'approximateApplicationCount']

      raise 'You cannot provide both :approximateApplicationCount and :approximate_application_count' if attributes.key?(:'approximateApplicationCount') && attributes.key?(:'approximate_application_count')

      self.approximate_application_count = attributes[:'approximate_application_count'] if attributes[:'approximate_application_count']

      self.approximate_managed_instance_count = attributes[:'approximateManagedInstanceCount'] if attributes[:'approximateManagedInstanceCount']

      raise 'You cannot provide both :approximateManagedInstanceCount and :approximate_managed_instance_count' if attributes.key?(:'approximateManagedInstanceCount') && attributes.key?(:'approximate_managed_instance_count')

      self.approximate_managed_instance_count = attributes[:'approximate_managed_instance_count'] if attributes[:'approximate_managed_instance_count']

      self.inventory_log = attributes[:'inventoryLog'] if attributes[:'inventoryLog']

      raise 'You cannot provide both :inventoryLog and :inventory_log' if attributes.key?(:'inventoryLog') && attributes.key?(:'inventory_log')

      self.inventory_log = attributes[:'inventory_log'] if attributes[:'inventory_log']

      self.operation_log = attributes[:'operationLog'] if attributes[:'operationLog']

      raise 'You cannot provide both :operationLog and :operation_log' if attributes.key?(:'operationLog') && attributes.key?(:'operation_log')

      self.operation_log = attributes[:'operation_log'] if attributes[:'operation_log']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
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
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        approximate_jre_count == other.approximate_jre_count &&
        approximate_installation_count == other.approximate_installation_count &&
        approximate_application_count == other.approximate_application_count &&
        approximate_managed_instance_count == other.approximate_managed_instance_count &&
        inventory_log == other.inventory_log &&
        operation_log == other.operation_log &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags &&
        system_tags == other.system_tags
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
      [id, display_name, description, compartment_id, approximate_jre_count, approximate_installation_count, approximate_application_count, approximate_managed_instance_count, inventory_log, operation_log, time_created, lifecycle_state, defined_tags, freeform_tags, system_tags].hash
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
