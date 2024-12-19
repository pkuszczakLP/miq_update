# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Migration Phase Summary of details.
  #
  class DatabaseMigration::Models::MigrationPhaseSummary
    NAME_ENUM = [
      NAME_ODMS_VALIDATE_TGT = 'ODMS_VALIDATE_TGT'.freeze,
      NAME_ODMS_VALIDATE_SRC = 'ODMS_VALIDATE_SRC'.freeze,
      NAME_ODMS_VALIDATE_PREMIGRATION_ADVISOR = 'ODMS_VALIDATE_PREMIGRATION_ADVISOR'.freeze,
      NAME_ODMS_VALIDATE_GG_HUB = 'ODMS_VALIDATE_GG_HUB'.freeze,
      NAME_ODMS_VALIDATE_DATAPUMP_SETTINGS = 'ODMS_VALIDATE_DATAPUMP_SETTINGS'.freeze,
      NAME_ODMS_VALIDATE_DATAPUMP_SETTINGS_SRC = 'ODMS_VALIDATE_DATAPUMP_SETTINGS_SRC'.freeze,
      NAME_ODMS_VALIDATE_DATAPUMP_SETTINGS_TGT = 'ODMS_VALIDATE_DATAPUMP_SETTINGS_TGT'.freeze,
      NAME_ODMS_VALIDATE_DATAPUMP_SRC = 'ODMS_VALIDATE_DATAPUMP_SRC'.freeze,
      NAME_ODMS_VALIDATE_DATAPUMP_ESTIMATE_SRC = 'ODMS_VALIDATE_DATAPUMP_ESTIMATE_SRC'.freeze,
      NAME_ODMS_VALIDATE = 'ODMS_VALIDATE'.freeze,
      NAME_ODMS_PREPARE = 'ODMS_PREPARE'.freeze,
      NAME_ODMS_INITIAL_LOAD_EXPORT = 'ODMS_INITIAL_LOAD_EXPORT'.freeze,
      NAME_ODMS_DATA_UPLOAD = 'ODMS_DATA_UPLOAD'.freeze,
      NAME_ODMS_INITIAL_LOAD_IMPORT = 'ODMS_INITIAL_LOAD_IMPORT'.freeze,
      NAME_ODMS_POST_INITIAL_LOAD = 'ODMS_POST_INITIAL_LOAD'.freeze,
      NAME_ODMS_PREPARE_REPLICATION_TARGET = 'ODMS_PREPARE_REPLICATION_TARGET'.freeze,
      NAME_ODMS_MONITOR_REPLICATION_LAG = 'ODMS_MONITOR_REPLICATION_LAG'.freeze,
      NAME_ODMS_SWITCHOVER = 'ODMS_SWITCHOVER'.freeze,
      NAME_ODMS_CLEANUP = 'ODMS_CLEANUP'.freeze,
      NAME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    RECOMMENDED_ACTION_ENUM = [
      RECOMMENDED_ACTION_WAIT = 'WAIT'.freeze,
      RECOMMENDED_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** ODMS Job phase name
    #
    # @return [String]
    attr_reader :name

    # Action recommended for this phase. If not included in the response, there is no recommended action for the phase.
    #
    # @return [String]
    attr_reader :recommended_action

    # **[Required]** Array of actions for the corresponding phase. Empty array would indicate there is no supported action for the phase.
    #
    # @return [Array<OCI::DatabaseMigration::Models::OdmsPhaseActions>]
    attr_accessor :supported_actions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'recommended_action': :'recommendedAction',
        'supported_actions': :'supportedActions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'recommended_action': :'String',
        'supported_actions': :'Array<OCI::DatabaseMigration::Models::OdmsPhaseActions>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :recommended_action The value to assign to the {#recommended_action} property
    # @option attributes [Array<OCI::DatabaseMigration::Models::OdmsPhaseActions>] :supported_actions The value to assign to the {#supported_actions} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.recommended_action = attributes[:'recommendedAction'] if attributes[:'recommendedAction']

      raise 'You cannot provide both :recommendedAction and :recommended_action' if attributes.key?(:'recommendedAction') && attributes.key?(:'recommended_action')

      self.recommended_action = attributes[:'recommended_action'] if attributes[:'recommended_action']

      self.supported_actions = attributes[:'supportedActions'] if attributes[:'supportedActions']

      raise 'You cannot provide both :supportedActions and :supported_actions' if attributes.key?(:'supportedActions') && attributes.key?(:'supported_actions')

      self.supported_actions = attributes[:'supported_actions'] if attributes[:'supported_actions']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] name Object to be assigned
    def name=(name)
      # rubocop:disable Style/ConditionalAssignment
      if name && !NAME_ENUM.include?(name)
        OCI.logger.debug("Unknown value for 'name' [" + name + "]. Mapping to 'NAME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @name = NAME_UNKNOWN_ENUM_VALUE
      else
        @name = name
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] recommended_action Object to be assigned
    def recommended_action=(recommended_action)
      # rubocop:disable Style/ConditionalAssignment
      if recommended_action && !RECOMMENDED_ACTION_ENUM.include?(recommended_action)
        OCI.logger.debug("Unknown value for 'recommended_action' [" + recommended_action + "]. Mapping to 'RECOMMENDED_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @recommended_action = RECOMMENDED_ACTION_UNKNOWN_ENUM_VALUE
      else
        @recommended_action = recommended_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        recommended_action == other.recommended_action &&
        supported_actions == other.supported_actions
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
      [name, recommended_action, supported_actions].hash
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
