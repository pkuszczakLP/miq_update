# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Autoscaling policies define the criteria that trigger autoscaling actions and the actions to take.
  #
  # An autoscaling policy is part of an autoscaling configuration. For more information, see
  # [Autoscaling](https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/autoscalinginstancepools.htm).
  #
  # You can create the following types of autoscaling policies:
  #
  #   - **Schedule-based:** Autoscaling events take place at the specific times that you schedule.
  #   - **Threshold-based:** An autoscaling action is triggered when a performance metric meets or exceeds a threshold.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Autoscaling::Models::AutoScalingPolicy
    # The capacity requirements of the autoscaling policy.
    # @return [OCI::Autoscaling::Models::Capacity]
    attr_accessor :capacity

    # The ID of the autoscaling policy that is assigned after creation.
    # @return [String]
    attr_accessor :id

    # A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The type of autoscaling policy.
    # @return [String]
    attr_accessor :policy_type

    # **[Required]** The date and time the autoscaling configuration was created, in the format defined by RFC3339.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # Whether the autoscaling policy is enabled.
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'capacity': :'capacity',
        'id': :'id',
        'display_name': :'displayName',
        'policy_type': :'policyType',
        'time_created': :'timeCreated',
        'is_enabled': :'isEnabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'capacity': :'OCI::Autoscaling::Models::Capacity',
        'id': :'String',
        'display_name': :'String',
        'policy_type': :'String',
        'time_created': :'DateTime',
        'is_enabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'policyType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Autoscaling::Models::ScheduledPolicy' if type == 'scheduled'
      return 'OCI::Autoscaling::Models::ThresholdPolicy' if type == 'threshold'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Autoscaling::Models::AutoScalingPolicy'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::Autoscaling::Models::Capacity] :capacity The value to assign to the {#capacity} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :policy_type The value to assign to the {#policy_type} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.capacity = attributes[:'capacity'] if attributes[:'capacity']

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.policy_type = attributes[:'policyType'] if attributes[:'policyType']

      raise 'You cannot provide both :policyType and :policy_type' if attributes.key?(:'policyType') && attributes.key?(:'policy_type')

      self.policy_type = attributes[:'policy_type'] if attributes[:'policy_type']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        capacity == other.capacity &&
        id == other.id &&
        display_name == other.display_name &&
        policy_type == other.policy_type &&
        time_created == other.time_created &&
        is_enabled == other.is_enabled
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
      [capacity, id, display_name, policy_type, time_created, is_enabled].hash
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