# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A maintenance update for a cloud VM cluster. Applies to Exadata Cloud Service instances only.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access,
  # see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Database::Models::UpdateSummary
    LAST_ACTION_ENUM = [
      LAST_ACTION_ROLLING_APPLY = 'ROLLING_APPLY'.freeze,
      LAST_ACTION_NON_ROLLING_APPLY = 'NON_ROLLING_APPLY'.freeze,
      LAST_ACTION_PRECHECK = 'PRECHECK'.freeze,
      LAST_ACTION_ROLLBACK = 'ROLLBACK'.freeze,
      LAST_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    AVAILABLE_ACTIONS_ENUM = [
      AVAILABLE_ACTIONS_ROLLING_APPLY = 'ROLLING_APPLY'.freeze,
      AVAILABLE_ACTIONS_NON_ROLLING_APPLY = 'NON_ROLLING_APPLY'.freeze,
      AVAILABLE_ACTIONS_PRECHECK = 'PRECHECK'.freeze,
      AVAILABLE_ACTIONS_ROLLBACK = 'ROLLBACK'.freeze,
      AVAILABLE_ACTIONS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    UPDATE_TYPE_ENUM = [
      UPDATE_TYPE_GI_UPGRADE = 'GI_UPGRADE'.freeze,
      UPDATE_TYPE_GI_PATCH = 'GI_PATCH'.freeze,
      UPDATE_TYPE_OS_UPDATE = 'OS_UPDATE'.freeze,
      UPDATE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_AVAILABLE = 'AVAILABLE'.freeze,
      LIFECYCLE_STATE_SUCCESS = 'SUCCESS'.freeze,
      LIFECYCLE_STATE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the maintenance update.
    # @return [String]
    attr_accessor :id

    # **[Required]** Details of the maintenance update package.
    # @return [String]
    attr_accessor :description

    # The update action.
    # @return [String]
    attr_reader :last_action

    # The possible actions performed by the update operation on the infrastructure components.
    # @return [Array<String>]
    attr_reader :available_actions

    # **[Required]** The type of cloud VM cluster maintenance update.
    # @return [String]
    attr_reader :update_type

    # Descriptive text providing additional details about the lifecycle state.
    #
    # @return [String]
    attr_accessor :lifecycle_details

    # The current state of the maintenance update. Dependent on value of `lastAction`.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The date and time the maintenance update was released.
    # @return [DateTime]
    attr_accessor :time_released

    # **[Required]** The version of the maintenance update package.
    # @return [String]
    attr_accessor :version

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'description': :'description',
        'last_action': :'lastAction',
        'available_actions': :'availableActions',
        'update_type': :'updateType',
        'lifecycle_details': :'lifecycleDetails',
        'lifecycle_state': :'lifecycleState',
        'time_released': :'timeReleased',
        'version': :'version'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'description': :'String',
        'last_action': :'String',
        'available_actions': :'Array<String>',
        'update_type': :'String',
        'lifecycle_details': :'String',
        'lifecycle_state': :'String',
        'time_released': :'DateTime',
        'version': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :last_action The value to assign to the {#last_action} property
    # @option attributes [Array<String>] :available_actions The value to assign to the {#available_actions} property
    # @option attributes [String] :update_type The value to assign to the {#update_type} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_released The value to assign to the {#time_released} property
    # @option attributes [String] :version The value to assign to the {#version} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.last_action = attributes[:'lastAction'] if attributes[:'lastAction']

      raise 'You cannot provide both :lastAction and :last_action' if attributes.key?(:'lastAction') && attributes.key?(:'last_action')

      self.last_action = attributes[:'last_action'] if attributes[:'last_action']

      self.available_actions = attributes[:'availableActions'] if attributes[:'availableActions']

      raise 'You cannot provide both :availableActions and :available_actions' if attributes.key?(:'availableActions') && attributes.key?(:'available_actions')

      self.available_actions = attributes[:'available_actions'] if attributes[:'available_actions']

      self.update_type = attributes[:'updateType'] if attributes[:'updateType']

      raise 'You cannot provide both :updateType and :update_type' if attributes.key?(:'updateType') && attributes.key?(:'update_type')

      self.update_type = attributes[:'update_type'] if attributes[:'update_type']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_released = attributes[:'timeReleased'] if attributes[:'timeReleased']

      raise 'You cannot provide both :timeReleased and :time_released' if attributes.key?(:'timeReleased') && attributes.key?(:'time_released')

      self.time_released = attributes[:'time_released'] if attributes[:'time_released']

      self.version = attributes[:'version'] if attributes[:'version']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] last_action Object to be assigned
    def last_action=(last_action)
      # rubocop:disable Style/ConditionalAssignment
      if last_action && !LAST_ACTION_ENUM.include?(last_action)
        OCI.logger.debug("Unknown value for 'last_action' [" + last_action + "]. Mapping to 'LAST_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @last_action = LAST_ACTION_UNKNOWN_ENUM_VALUE
      else
        @last_action = last_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] available_actions Object to be assigned
    def available_actions=(available_actions)
      # rubocop:disable Style/ConditionalAssignment
      if available_actions.nil?
        @available_actions = nil
      else
        @available_actions =
          available_actions.collect do |item|
            if AVAILABLE_ACTIONS_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'available_actions' [#{item}]. Mapping to 'AVAILABLE_ACTIONS_UNKNOWN_ENUM_VALUE'") if OCI.logger
              AVAILABLE_ACTIONS_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] update_type Object to be assigned
    def update_type=(update_type)
      # rubocop:disable Style/ConditionalAssignment
      if update_type && !UPDATE_TYPE_ENUM.include?(update_type)
        OCI.logger.debug("Unknown value for 'update_type' [" + update_type + "]. Mapping to 'UPDATE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @update_type = UPDATE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @update_type = update_type
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
        id == other.id &&
        description == other.description &&
        last_action == other.last_action &&
        available_actions == other.available_actions &&
        update_type == other.update_type &&
        lifecycle_details == other.lifecycle_details &&
        lifecycle_state == other.lifecycle_state &&
        time_released == other.time_released &&
        version == other.version
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
      [id, description, last_action, available_actions, update_type, lifecycle_details, lifecycle_state, time_released, version].hash
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
