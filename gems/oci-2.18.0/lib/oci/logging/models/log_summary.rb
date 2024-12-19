# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Log object configuration summary.
  class Logging::Models::LogSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LOG_TYPE_ENUM = [
      LOG_TYPE_CUSTOM = 'CUSTOM'.freeze,
      LOG_TYPE_SERVICE = 'SERVICE'.freeze,
      LOG_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the resource.
    # @return [String]
    attr_accessor :id

    # **[Required]** Log group OCID.
    # @return [String]
    attr_accessor :log_group_id

    # **[Required]** The user-friendly display name. This must be unique within the enclosing resource,
    # and it's changeable. Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # Whether or not this resource is currently enabled.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # **[Required]** The pipeline state.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The logType that the log object is for, whether custom or service.
    # @return [String]
    attr_reader :log_type

    # @return [OCI::Logging::Models::Configuration]
    attr_accessor :configuration

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Time the resource was created.
    # @return [DateTime]
    attr_accessor :time_created

    # Time the resource was last modified.
    # @return [DateTime]
    attr_accessor :time_last_modified

    # Log retention duration in 30-day increments (30, 60, 90 and so on).
    # @return [Integer]
    attr_accessor :retention_duration

    # The OCID of the compartment that the resource belongs to.
    # @return [String]
    attr_accessor :compartment_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'log_group_id': :'logGroupId',
        'display_name': :'displayName',
        'is_enabled': :'isEnabled',
        'lifecycle_state': :'lifecycleState',
        'log_type': :'logType',
        'configuration': :'configuration',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags',
        'time_created': :'timeCreated',
        'time_last_modified': :'timeLastModified',
        'retention_duration': :'retentionDuration',
        'compartment_id': :'compartmentId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'log_group_id': :'String',
        'display_name': :'String',
        'is_enabled': :'BOOLEAN',
        'lifecycle_state': :'String',
        'log_type': :'String',
        'configuration': :'OCI::Logging::Models::Configuration',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>',
        'time_created': :'DateTime',
        'time_last_modified': :'DateTime',
        'retention_duration': :'Integer',
        'compartment_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :log_group_id The value to assign to the {#log_group_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :log_type The value to assign to the {#log_type} property
    # @option attributes [OCI::Logging::Models::Configuration] :configuration The value to assign to the {#configuration} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_last_modified The value to assign to the {#time_last_modified} property
    # @option attributes [Integer] :retention_duration The value to assign to the {#retention_duration} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.log_group_id = attributes[:'logGroupId'] if attributes[:'logGroupId']

      raise 'You cannot provide both :logGroupId and :log_group_id' if attributes.key?(:'logGroupId') && attributes.key?(:'log_group_id')

      self.log_group_id = attributes[:'log_group_id'] if attributes[:'log_group_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?
      self.is_enabled = true if is_enabled.nil? && !attributes.key?(:'isEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?
      self.is_enabled = true if is_enabled.nil? && !attributes.key?(:'isEnabled') && !attributes.key?(:'is_enabled') # rubocop:disable Style/StringLiterals

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.log_type = attributes[:'logType'] if attributes[:'logType']
      self.log_type = "CUSTOM" if log_type.nil? && !attributes.key?(:'logType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :logType and :log_type' if attributes.key?(:'logType') && attributes.key?(:'log_type')

      self.log_type = attributes[:'log_type'] if attributes[:'log_type']
      self.log_type = "CUSTOM" if log_type.nil? && !attributes.key?(:'logType') && !attributes.key?(:'log_type') # rubocop:disable Style/StringLiterals

      self.configuration = attributes[:'configuration'] if attributes[:'configuration']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_last_modified = attributes[:'timeLastModified'] if attributes[:'timeLastModified']

      raise 'You cannot provide both :timeLastModified and :time_last_modified' if attributes.key?(:'timeLastModified') && attributes.key?(:'time_last_modified')

      self.time_last_modified = attributes[:'time_last_modified'] if attributes[:'time_last_modified']

      self.retention_duration = attributes[:'retentionDuration'] if attributes[:'retentionDuration']

      raise 'You cannot provide both :retentionDuration and :retention_duration' if attributes.key?(:'retentionDuration') && attributes.key?(:'retention_duration')

      self.retention_duration = attributes[:'retention_duration'] if attributes[:'retention_duration']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] log_type Object to be assigned
    def log_type=(log_type)
      # rubocop:disable Style/ConditionalAssignment
      if log_type && !LOG_TYPE_ENUM.include?(log_type)
        OCI.logger.debug("Unknown value for 'log_type' [" + log_type + "]. Mapping to 'LOG_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @log_type = LOG_TYPE_UNKNOWN_ENUM_VALUE
      else
        @log_type = log_type
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
        log_group_id == other.log_group_id &&
        display_name == other.display_name &&
        is_enabled == other.is_enabled &&
        lifecycle_state == other.lifecycle_state &&
        log_type == other.log_type &&
        configuration == other.configuration &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags &&
        time_created == other.time_created &&
        time_last_modified == other.time_last_modified &&
        retention_duration == other.retention_duration &&
        compartment_id == other.compartment_id
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
      [id, log_group_id, display_name, is_enabled, lifecycle_state, log_type, configuration, defined_tags, freeform_tags, time_created, time_last_modified, retention_duration, compartment_id].hash
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
