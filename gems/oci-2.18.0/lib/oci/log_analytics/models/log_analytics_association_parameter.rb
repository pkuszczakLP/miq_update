# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # LogAnalyticsAssociationParameter
  class LogAnalytics::Models::LogAnalyticsAssociationParameter
    STATUS_ENUM = [
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The agent unique identifier.
    # @return [String]
    attr_accessor :agent_id

    # The entity type.
    # @return [String]
    attr_accessor :entity_type

    # The entity unique identifier.
    # @return [String]
    attr_accessor :entity_id

    # The source name.
    # @return [String]
    attr_accessor :source_id

    # The source display name.
    # @return [String]
    attr_accessor :source_display_name

    # The source type.
    # @return [String]
    attr_accessor :source_type

    # The status.  Either FAILED or SUCCEEDED.
    # @return [String]
    attr_reader :status

    # A list of missing properties.
    # @return [Array<String>]
    attr_accessor :missing_properties

    # A list of requried properties.
    # @return [Array<String>]
    attr_accessor :required_properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'agent_id': :'agentId',
        'entity_type': :'entityType',
        'entity_id': :'entityId',
        'source_id': :'sourceId',
        'source_display_name': :'sourceDisplayName',
        'source_type': :'sourceType',
        'status': :'status',
        'missing_properties': :'missingProperties',
        'required_properties': :'requiredProperties'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'agent_id': :'String',
        'entity_type': :'String',
        'entity_id': :'String',
        'source_id': :'String',
        'source_display_name': :'String',
        'source_type': :'String',
        'status': :'String',
        'missing_properties': :'Array<String>',
        'required_properties': :'Array<String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :agent_id The value to assign to the {#agent_id} property
    # @option attributes [String] :entity_type The value to assign to the {#entity_type} property
    # @option attributes [String] :entity_id The value to assign to the {#entity_id} property
    # @option attributes [String] :source_id The value to assign to the {#source_id} property
    # @option attributes [String] :source_display_name The value to assign to the {#source_display_name} property
    # @option attributes [String] :source_type The value to assign to the {#source_type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [Array<String>] :missing_properties The value to assign to the {#missing_properties} property
    # @option attributes [Array<String>] :required_properties The value to assign to the {#required_properties} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.agent_id = attributes[:'agentId'] if attributes[:'agentId']

      raise 'You cannot provide both :agentId and :agent_id' if attributes.key?(:'agentId') && attributes.key?(:'agent_id')

      self.agent_id = attributes[:'agent_id'] if attributes[:'agent_id']

      self.entity_type = attributes[:'entityType'] if attributes[:'entityType']

      raise 'You cannot provide both :entityType and :entity_type' if attributes.key?(:'entityType') && attributes.key?(:'entity_type')

      self.entity_type = attributes[:'entity_type'] if attributes[:'entity_type']

      self.entity_id = attributes[:'entityId'] if attributes[:'entityId']

      raise 'You cannot provide both :entityId and :entity_id' if attributes.key?(:'entityId') && attributes.key?(:'entity_id')

      self.entity_id = attributes[:'entity_id'] if attributes[:'entity_id']

      self.source_id = attributes[:'sourceId'] if attributes[:'sourceId']

      raise 'You cannot provide both :sourceId and :source_id' if attributes.key?(:'sourceId') && attributes.key?(:'source_id')

      self.source_id = attributes[:'source_id'] if attributes[:'source_id']

      self.source_display_name = attributes[:'sourceDisplayName'] if attributes[:'sourceDisplayName']

      raise 'You cannot provide both :sourceDisplayName and :source_display_name' if attributes.key?(:'sourceDisplayName') && attributes.key?(:'source_display_name')

      self.source_display_name = attributes[:'source_display_name'] if attributes[:'source_display_name']

      self.source_type = attributes[:'sourceType'] if attributes[:'sourceType']

      raise 'You cannot provide both :sourceType and :source_type' if attributes.key?(:'sourceType') && attributes.key?(:'source_type')

      self.source_type = attributes[:'source_type'] if attributes[:'source_type']

      self.status = attributes[:'status'] if attributes[:'status']
      self.status = "SUCCEEDED" if status.nil? && !attributes.key?(:'status') # rubocop:disable Style/StringLiterals

      self.missing_properties = attributes[:'missingProperties'] if attributes[:'missingProperties']

      raise 'You cannot provide both :missingProperties and :missing_properties' if attributes.key?(:'missingProperties') && attributes.key?(:'missing_properties')

      self.missing_properties = attributes[:'missing_properties'] if attributes[:'missing_properties']

      self.required_properties = attributes[:'requiredProperties'] if attributes[:'requiredProperties']

      raise 'You cannot provide both :requiredProperties and :required_properties' if attributes.key?(:'requiredProperties') && attributes.key?(:'required_properties')

      self.required_properties = attributes[:'required_properties'] if attributes[:'required_properties']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        agent_id == other.agent_id &&
        entity_type == other.entity_type &&
        entity_id == other.entity_id &&
        source_id == other.source_id &&
        source_display_name == other.source_display_name &&
        source_type == other.source_type &&
        status == other.status &&
        missing_properties == other.missing_properties &&
        required_properties == other.required_properties
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
      [agent_id, entity_type, entity_id, source_id, source_display_name, source_type, status, missing_properties, required_properties].hash
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
