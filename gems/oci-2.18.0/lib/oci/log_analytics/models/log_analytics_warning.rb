# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsWarning
  class LogAnalytics::Models::LogAnalyticsWarning
    # The unique identifier of the agent associated with the warning
    # @return [String]
    attr_accessor :agent_id

    # The host containing the agent associated with the warning
    # @return [String]
    attr_accessor :host_name

    # The display name of the rule which triggered the warning
    # @return [String]
    attr_accessor :rule_display_name

    # The name of the source associated with the warning
    # @return [String]
    attr_accessor :source_name

    # The entity compartment ID.
    # @return [String]
    attr_accessor :compartment_id

    # The display name of the source associated with the warning
    # @return [String]
    attr_accessor :source_display_name

    # The name of the entity associated with the warning
    # @return [String]
    attr_accessor :entity_name

    # The time at which the warning was most recently collected
    # @return [DateTime]
    attr_accessor :time_collected

    # The unique identifier of the warning
    # @return [String]
    attr_accessor :warning_id

    # The date at which the warning was initially triggered
    # @return [DateTime]
    attr_accessor :time_of_initial_warning

    # A flag indicating if the warning is currently active
    # @return [BOOLEAN]
    attr_accessor :is_active

    # A flag indicating if the warning is currently suppressed
    # @return [BOOLEAN]
    attr_accessor :is_suppressed

    # The most recent date on which the warning was triggered
    # @return [DateTime]
    attr_accessor :time_of_latest_warning

    # The warning level - either pattern, rule, or source.
    # @return [String]
    attr_accessor :warning_level

    # A description of the warning intended for the consumer of the warning.  It will
    # usually detail the cause of the warning, may suggest a remedy, and can contain any
    # other relevant information the consumer might find useful
    #
    # @return [String]
    attr_accessor :warning_message

    # The unique identifier of the warning pattern
    # @return [String]
    attr_accessor :pattern_id

    # The text of the pattern used by the warning
    # @return [String]
    attr_accessor :pattern_text

    # The unique identifier of the rule associated with the warning
    # @return [String]
    attr_accessor :rule_id

    # The unique identifier of the source associated with the warning
    # @return [String]
    attr_accessor :source_id

    # The user who suppressed the warning, or empty if the warning is not suppressed
    # @return [String]
    attr_accessor :suppressed_by

    # The unique identifier of the entity associated with the warning
    # @return [String]
    attr_accessor :entity_id

    # The type of the entity associated with the warning
    # @return [String]
    attr_accessor :entity_type

    # The display name of the entity type associated with the warning
    # @return [String]
    attr_accessor :entity_type_display_name

    # The display name of the warning type
    # @return [String]
    attr_accessor :type_display_name

    # The internal name of the warning
    # @return [String]
    attr_accessor :type_name

    # The warning severity
    # @return [Integer]
    attr_accessor :severity

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'agent_id': :'agentId',
        'host_name': :'hostName',
        'rule_display_name': :'ruleDisplayName',
        'source_name': :'sourceName',
        'compartment_id': :'compartmentId',
        'source_display_name': :'sourceDisplayName',
        'entity_name': :'entityName',
        'time_collected': :'timeCollected',
        'warning_id': :'warningId',
        'time_of_initial_warning': :'timeOfInitialWarning',
        'is_active': :'isActive',
        'is_suppressed': :'isSuppressed',
        'time_of_latest_warning': :'timeOfLatestWarning',
        'warning_level': :'warningLevel',
        'warning_message': :'warningMessage',
        'pattern_id': :'patternId',
        'pattern_text': :'patternText',
        'rule_id': :'ruleId',
        'source_id': :'sourceId',
        'suppressed_by': :'suppressedBy',
        'entity_id': :'entityId',
        'entity_type': :'entityType',
        'entity_type_display_name': :'entityTypeDisplayName',
        'type_display_name': :'typeDisplayName',
        'type_name': :'typeName',
        'severity': :'severity'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'agent_id': :'String',
        'host_name': :'String',
        'rule_display_name': :'String',
        'source_name': :'String',
        'compartment_id': :'String',
        'source_display_name': :'String',
        'entity_name': :'String',
        'time_collected': :'DateTime',
        'warning_id': :'String',
        'time_of_initial_warning': :'DateTime',
        'is_active': :'BOOLEAN',
        'is_suppressed': :'BOOLEAN',
        'time_of_latest_warning': :'DateTime',
        'warning_level': :'String',
        'warning_message': :'String',
        'pattern_id': :'String',
        'pattern_text': :'String',
        'rule_id': :'String',
        'source_id': :'String',
        'suppressed_by': :'String',
        'entity_id': :'String',
        'entity_type': :'String',
        'entity_type_display_name': :'String',
        'type_display_name': :'String',
        'type_name': :'String',
        'severity': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :agent_id The value to assign to the {#agent_id} property
    # @option attributes [String] :host_name The value to assign to the {#host_name} property
    # @option attributes [String] :rule_display_name The value to assign to the {#rule_display_name} property
    # @option attributes [String] :source_name The value to assign to the {#source_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :source_display_name The value to assign to the {#source_display_name} property
    # @option attributes [String] :entity_name The value to assign to the {#entity_name} property
    # @option attributes [DateTime] :time_collected The value to assign to the {#time_collected} property
    # @option attributes [String] :warning_id The value to assign to the {#warning_id} property
    # @option attributes [DateTime] :time_of_initial_warning The value to assign to the {#time_of_initial_warning} property
    # @option attributes [BOOLEAN] :is_active The value to assign to the {#is_active} property
    # @option attributes [BOOLEAN] :is_suppressed The value to assign to the {#is_suppressed} property
    # @option attributes [DateTime] :time_of_latest_warning The value to assign to the {#time_of_latest_warning} property
    # @option attributes [String] :warning_level The value to assign to the {#warning_level} property
    # @option attributes [String] :warning_message The value to assign to the {#warning_message} property
    # @option attributes [String] :pattern_id The value to assign to the {#pattern_id} property
    # @option attributes [String] :pattern_text The value to assign to the {#pattern_text} property
    # @option attributes [String] :rule_id The value to assign to the {#rule_id} property
    # @option attributes [String] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :suppressed_by The value to assign to the {#suppressed_by} property
    # @option attributes [String] :entity_id The value to assign to the {#entity_id} property
    # @option attributes [String] :entity_type The value to assign to the {#entity_type} property
    # @option attributes [String] :entity_type_display_name The value to assign to the {#entity_type_display_name} property
    # @option attributes [String] :type_display_name The value to assign to the {#type_display_name} property
    # @option attributes [String] :type_name The value to assign to the {#type_name} property
    # @option attributes [Integer] :severity The value to assign to the {#severity} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.agent_id = attributes[:'agentId'] if attributes[:'agentId']

      raise 'You cannot provide both :agentId and :agent_id' if attributes.key?(:'agentId') && attributes.key?(:'agent_id')

      self.agent_id = attributes[:'agent_id'] if attributes[:'agent_id']

      self.host_name = attributes[:'hostName'] if attributes[:'hostName']

      raise 'You cannot provide both :hostName and :host_name' if attributes.key?(:'hostName') && attributes.key?(:'host_name')

      self.host_name = attributes[:'host_name'] if attributes[:'host_name']

      self.rule_display_name = attributes[:'ruleDisplayName'] if attributes[:'ruleDisplayName']

      raise 'You cannot provide both :ruleDisplayName and :rule_display_name' if attributes.key?(:'ruleDisplayName') && attributes.key?(:'rule_display_name')

      self.rule_display_name = attributes[:'rule_display_name'] if attributes[:'rule_display_name']

      self.source_name = attributes[:'sourceName'] if attributes[:'sourceName']

      raise 'You cannot provide both :sourceName and :source_name' if attributes.key?(:'sourceName') && attributes.key?(:'source_name')

      self.source_name = attributes[:'source_name'] if attributes[:'source_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.source_display_name = attributes[:'sourceDisplayName'] if attributes[:'sourceDisplayName']

      raise 'You cannot provide both :sourceDisplayName and :source_display_name' if attributes.key?(:'sourceDisplayName') && attributes.key?(:'source_display_name')

      self.source_display_name = attributes[:'source_display_name'] if attributes[:'source_display_name']

      self.entity_name = attributes[:'entityName'] if attributes[:'entityName']

      raise 'You cannot provide both :entityName and :entity_name' if attributes.key?(:'entityName') && attributes.key?(:'entity_name')

      self.entity_name = attributes[:'entity_name'] if attributes[:'entity_name']

      self.time_collected = attributes[:'timeCollected'] if attributes[:'timeCollected']

      raise 'You cannot provide both :timeCollected and :time_collected' if attributes.key?(:'timeCollected') && attributes.key?(:'time_collected')

      self.time_collected = attributes[:'time_collected'] if attributes[:'time_collected']

      self.warning_id = attributes[:'warningId'] if attributes[:'warningId']

      raise 'You cannot provide both :warningId and :warning_id' if attributes.key?(:'warningId') && attributes.key?(:'warning_id')

      self.warning_id = attributes[:'warning_id'] if attributes[:'warning_id']

      self.time_of_initial_warning = attributes[:'timeOfInitialWarning'] if attributes[:'timeOfInitialWarning']

      raise 'You cannot provide both :timeOfInitialWarning and :time_of_initial_warning' if attributes.key?(:'timeOfInitialWarning') && attributes.key?(:'time_of_initial_warning')

      self.time_of_initial_warning = attributes[:'time_of_initial_warning'] if attributes[:'time_of_initial_warning']

      self.is_active = attributes[:'isActive'] unless attributes[:'isActive'].nil?

      raise 'You cannot provide both :isActive and :is_active' if attributes.key?(:'isActive') && attributes.key?(:'is_active')

      self.is_active = attributes[:'is_active'] unless attributes[:'is_active'].nil?

      self.is_suppressed = attributes[:'isSuppressed'] unless attributes[:'isSuppressed'].nil?

      raise 'You cannot provide both :isSuppressed and :is_suppressed' if attributes.key?(:'isSuppressed') && attributes.key?(:'is_suppressed')

      self.is_suppressed = attributes[:'is_suppressed'] unless attributes[:'is_suppressed'].nil?

      self.time_of_latest_warning = attributes[:'timeOfLatestWarning'] if attributes[:'timeOfLatestWarning']

      raise 'You cannot provide both :timeOfLatestWarning and :time_of_latest_warning' if attributes.key?(:'timeOfLatestWarning') && attributes.key?(:'time_of_latest_warning')

      self.time_of_latest_warning = attributes[:'time_of_latest_warning'] if attributes[:'time_of_latest_warning']

      self.warning_level = attributes[:'warningLevel'] if attributes[:'warningLevel']

      raise 'You cannot provide both :warningLevel and :warning_level' if attributes.key?(:'warningLevel') && attributes.key?(:'warning_level')

      self.warning_level = attributes[:'warning_level'] if attributes[:'warning_level']

      self.warning_message = attributes[:'warningMessage'] if attributes[:'warningMessage']

      raise 'You cannot provide both :warningMessage and :warning_message' if attributes.key?(:'warningMessage') && attributes.key?(:'warning_message')

      self.warning_message = attributes[:'warning_message'] if attributes[:'warning_message']

      self.pattern_id = attributes[:'patternId'] if attributes[:'patternId']

      raise 'You cannot provide both :patternId and :pattern_id' if attributes.key?(:'patternId') && attributes.key?(:'pattern_id')

      self.pattern_id = attributes[:'pattern_id'] if attributes[:'pattern_id']

      self.pattern_text = attributes[:'patternText'] if attributes[:'patternText']

      raise 'You cannot provide both :patternText and :pattern_text' if attributes.key?(:'patternText') && attributes.key?(:'pattern_text')

      self.pattern_text = attributes[:'pattern_text'] if attributes[:'pattern_text']

      self.rule_id = attributes[:'ruleId'] if attributes[:'ruleId']

      raise 'You cannot provide both :ruleId and :rule_id' if attributes.key?(:'ruleId') && attributes.key?(:'rule_id')

      self.rule_id = attributes[:'rule_id'] if attributes[:'rule_id']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.suppressed_by = attributes[:'suppressedBy'] if attributes[:'suppressedBy']

      raise 'You cannot provide both :suppressedBy and :suppressed_by' if attributes.key?(:'suppressedBy') && attributes.key?(:'suppressed_by')

      self.suppressed_by = attributes[:'suppressed_by'] if attributes[:'suppressed_by']

      self.entity_id = attributes[:'entityId'] if attributes[:'entityId']

      raise 'You cannot provide both :entityId and :entity_id' if attributes.key?(:'entityId') && attributes.key?(:'entity_id')

      self.entity_id = attributes[:'entity_id'] if attributes[:'entity_id']

      self.entity_type = attributes[:'entityType'] if attributes[:'entityType']

      raise 'You cannot provide both :entityType and :entity_type' if attributes.key?(:'entityType') && attributes.key?(:'entity_type')

      self.entity_type = attributes[:'entity_type'] if attributes[:'entity_type']

      self.entity_type_display_name = attributes[:'entityTypeDisplayName'] if attributes[:'entityTypeDisplayName']

      raise 'You cannot provide both :entityTypeDisplayName and :entity_type_display_name' if attributes.key?(:'entityTypeDisplayName') && attributes.key?(:'entity_type_display_name')

      self.entity_type_display_name = attributes[:'entity_type_display_name'] if attributes[:'entity_type_display_name']

      self.type_display_name = attributes[:'typeDisplayName'] if attributes[:'typeDisplayName']

      raise 'You cannot provide both :typeDisplayName and :type_display_name' if attributes.key?(:'typeDisplayName') && attributes.key?(:'type_display_name')

      self.type_display_name = attributes[:'type_display_name'] if attributes[:'type_display_name']

      self.type_name = attributes[:'typeName'] if attributes[:'typeName']

      raise 'You cannot provide both :typeName and :type_name' if attributes.key?(:'typeName') && attributes.key?(:'type_name')

      self.type_name = attributes[:'type_name'] if attributes[:'type_name']

      self.severity = attributes[:'severity'] if attributes[:'severity']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        agent_id == other.agent_id &&
        host_name == other.host_name &&
        rule_display_name == other.rule_display_name &&
        source_name == other.source_name &&
        compartment_id == other.compartment_id &&
        source_display_name == other.source_display_name &&
        entity_name == other.entity_name &&
        time_collected == other.time_collected &&
        warning_id == other.warning_id &&
        time_of_initial_warning == other.time_of_initial_warning &&
        is_active == other.is_active &&
        is_suppressed == other.is_suppressed &&
        time_of_latest_warning == other.time_of_latest_warning &&
        warning_level == other.warning_level &&
        warning_message == other.warning_message &&
        pattern_id == other.pattern_id &&
        pattern_text == other.pattern_text &&
        rule_id == other.rule_id &&
        source_id == other.source_id &&
        suppressed_by == other.suppressed_by &&
        entity_id == other.entity_id &&
        entity_type == other.entity_type &&
        entity_type_display_name == other.entity_type_display_name &&
        type_display_name == other.type_display_name &&
        type_name == other.type_name &&
        severity == other.severity
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
      [agent_id, host_name, rule_display_name, source_name, compartment_id, source_display_name, entity_name, time_collected, warning_id, time_of_initial_warning, is_active, is_suppressed, time_of_latest_warning, warning_level, warning_message, pattern_id, pattern_text, rule_id, source_id, suppressed_by, entity_id, entity_type, entity_type_display_name, type_display_name, type_name, severity].hash
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
