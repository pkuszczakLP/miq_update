# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Subscription mapping information.
  class TenantManagerControlPlane::Models::SubscriptionMappingSummary
    # **[Required]** OCID of the mapping between subscription and compartment identified by the tenancy.
    # @return [String]
    attr_accessor :id

    # **[Required]** OCID of the subscription.
    # @return [String]
    attr_accessor :subscription_id

    # **[Required]** OCID of the compartment. Always a tenancy OCID.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Denotes if the subscription is explicity assigned to the root compartment or tenancy.
    # @return [BOOLEAN]
    attr_accessor :is_explicitly_assigned

    # **[Required]** Lifecycle state of the subscription mapping.
    # @return [String]
    attr_accessor :lifecycle_state

    # Date-time when subscription mapping was terminated.
    # @return [DateTime]
    attr_accessor :time_terminated

    # **[Required]** Date-time when subscription mapping was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** Date-time when subscription mapping was updated.
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'subscription_id': :'subscriptionId',
        'compartment_id': :'compartmentId',
        'is_explicitly_assigned': :'isExplicitlyAssigned',
        'lifecycle_state': :'lifecycleState',
        'time_terminated': :'timeTerminated',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'subscription_id': :'String',
        'compartment_id': :'String',
        'is_explicitly_assigned': :'BOOLEAN',
        'lifecycle_state': :'String',
        'time_terminated': :'DateTime',
        'time_created': :'DateTime',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :subscription_id The value to assign to the {#subscription_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [BOOLEAN] :is_explicitly_assigned The value to assign to the {#is_explicitly_assigned} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_terminated The value to assign to the {#time_terminated} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.subscription_id = attributes[:'subscriptionId'] if attributes[:'subscriptionId']

      raise 'You cannot provide both :subscriptionId and :subscription_id' if attributes.key?(:'subscriptionId') && attributes.key?(:'subscription_id')

      self.subscription_id = attributes[:'subscription_id'] if attributes[:'subscription_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_explicitly_assigned = attributes[:'isExplicitlyAssigned'] unless attributes[:'isExplicitlyAssigned'].nil?
      self.is_explicitly_assigned = false if is_explicitly_assigned.nil? && !attributes.key?(:'isExplicitlyAssigned') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isExplicitlyAssigned and :is_explicitly_assigned' if attributes.key?(:'isExplicitlyAssigned') && attributes.key?(:'is_explicitly_assigned')

      self.is_explicitly_assigned = attributes[:'is_explicitly_assigned'] unless attributes[:'is_explicitly_assigned'].nil?
      self.is_explicitly_assigned = false if is_explicitly_assigned.nil? && !attributes.key?(:'isExplicitlyAssigned') && !attributes.key?(:'is_explicitly_assigned') # rubocop:disable Style/StringLiterals

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_terminated = attributes[:'timeTerminated'] if attributes[:'timeTerminated']

      raise 'You cannot provide both :timeTerminated and :time_terminated' if attributes.key?(:'timeTerminated') && attributes.key?(:'time_terminated')

      self.time_terminated = attributes[:'time_terminated'] if attributes[:'time_terminated']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        subscription_id == other.subscription_id &&
        compartment_id == other.compartment_id &&
        is_explicitly_assigned == other.is_explicitly_assigned &&
        lifecycle_state == other.lifecycle_state &&
        time_terminated == other.time_terminated &&
        time_created == other.time_created &&
        time_updated == other.time_updated
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
      [id, subscription_id, compartment_id, is_explicitly_assigned, lifecycle_state, time_terminated, time_created, time_updated].hash
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
