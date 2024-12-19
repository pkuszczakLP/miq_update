# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of access request status.
  class OperatorAccessControl::Models::AccessRequestHistorySummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATED = 'CREATED'.freeze,
      LIFECYCLE_STATE_APPROVALWAITING = 'APPROVALWAITING'.freeze,
      LIFECYCLE_STATE_PREAPPROVED = 'PREAPPROVED'.freeze,
      LIFECYCLE_STATE_APPROVED = 'APPROVED'.freeze,
      LIFECYCLE_STATE_MOREINFO = 'MOREINFO'.freeze,
      LIFECYCLE_STATE_REJECTED = 'REJECTED'.freeze,
      LIFECYCLE_STATE_DEPLOYED = 'DEPLOYED'.freeze,
      LIFECYCLE_STATE_DEPLOYFAILED = 'DEPLOYFAILED'.freeze,
      LIFECYCLE_STATE_UNDEPLOYED = 'UNDEPLOYED'.freeze,
      LIFECYCLE_STATE_UNDEPLOYFAILED = 'UNDEPLOYFAILED'.freeze,
      LIFECYCLE_STATE_CLOSEFAILED = 'CLOSEFAILED'.freeze,
      LIFECYCLE_STATE_REVOKEFAILED = 'REVOKEFAILED'.freeze,
      LIFECYCLE_STATE_EXPIRYFAILED = 'EXPIRYFAILED'.freeze,
      LIFECYCLE_STATE_REVOKING = 'REVOKING'.freeze,
      LIFECYCLE_STATE_REVOKED = 'REVOKED'.freeze,
      LIFECYCLE_STATE_EXTENDING = 'EXTENDING'.freeze,
      LIFECYCLE_STATE_EXTENDED = 'EXTENDED'.freeze,
      LIFECYCLE_STATE_EXTENSIONREJECTED = 'EXTENSIONREJECTED'.freeze,
      LIFECYCLE_STATE_COMPLETING = 'COMPLETING'.freeze,
      LIFECYCLE_STATE_COMPLETED = 'COMPLETED'.freeze,
      LIFECYCLE_STATE_EXPIRED = 'EXPIRED'.freeze,
      LIFECYCLE_STATE_APPROVEDFORFUTURE = 'APPROVEDFORFUTURE'.freeze,
      LIFECYCLE_STATE_INREVIEW = 'INREVIEW'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The current state of the AccessRequest.
    # @return [String]
    attr_reader :lifecycle_state

    # Approver who modified the access request.
    # @return [String]
    attr_accessor :user_id

    # Reason or description about the cause of change.
    # @return [String]
    attr_accessor :description

    # Duration for approval of request or extension depending on the type of action.
    # @return [Integer]
    attr_accessor :duration

    # Whether the access request was automatically approved.
    # @return [BOOLEAN]
    attr_accessor :is_auto_approved

    # List of operator actions for which approvals were requested by the operator.
    # @return [Array<String>]
    attr_accessor :actions_list

    # Time when the respective action happened in [RFC 3339](https://tools.ietf.org/html/rfc3339)timestamp format. Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_of_action

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'lifecycle_state': :'lifecycleState',
        'user_id': :'userId',
        'description': :'description',
        'duration': :'duration',
        'is_auto_approved': :'isAutoApproved',
        'actions_list': :'actionsList',
        'time_of_action': :'timeOfAction'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'lifecycle_state': :'String',
        'user_id': :'String',
        'description': :'String',
        'duration': :'Integer',
        'is_auto_approved': :'BOOLEAN',
        'actions_list': :'Array<String>',
        'time_of_action': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :user_id The value to assign to the {#user_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Integer] :duration The value to assign to the {#duration} property
    # @option attributes [BOOLEAN] :is_auto_approved The value to assign to the {#is_auto_approved} property
    # @option attributes [Array<String>] :actions_list The value to assign to the {#actions_list} property
    # @option attributes [DateTime] :time_of_action The value to assign to the {#time_of_action} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.user_id = attributes[:'userId'] if attributes[:'userId']

      raise 'You cannot provide both :userId and :user_id' if attributes.key?(:'userId') && attributes.key?(:'user_id')

      self.user_id = attributes[:'user_id'] if attributes[:'user_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.duration = attributes[:'duration'] if attributes[:'duration']

      self.is_auto_approved = attributes[:'isAutoApproved'] unless attributes[:'isAutoApproved'].nil?

      raise 'You cannot provide both :isAutoApproved and :is_auto_approved' if attributes.key?(:'isAutoApproved') && attributes.key?(:'is_auto_approved')

      self.is_auto_approved = attributes[:'is_auto_approved'] unless attributes[:'is_auto_approved'].nil?

      self.actions_list = attributes[:'actionsList'] if attributes[:'actionsList']

      raise 'You cannot provide both :actionsList and :actions_list' if attributes.key?(:'actionsList') && attributes.key?(:'actions_list')

      self.actions_list = attributes[:'actions_list'] if attributes[:'actions_list']

      self.time_of_action = attributes[:'timeOfAction'] if attributes[:'timeOfAction']

      raise 'You cannot provide both :timeOfAction and :time_of_action' if attributes.key?(:'timeOfAction') && attributes.key?(:'time_of_action')

      self.time_of_action = attributes[:'time_of_action'] if attributes[:'time_of_action']
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
        lifecycle_state == other.lifecycle_state &&
        user_id == other.user_id &&
        description == other.description &&
        duration == other.duration &&
        is_auto_approved == other.is_auto_approved &&
        actions_list == other.actions_list &&
        time_of_action == other.time_of_action
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
      [lifecycle_state, user_id, description, duration, is_auto_approved, actions_list, time_of_action].hash
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
