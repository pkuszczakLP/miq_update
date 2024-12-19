# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # ThickAuthorizationResponse model.
  class IdentityDataPlane::Models::ThickAuthorizationResponse
    # **[Required]** The policy string related to the request
    # @return [String]
    attr_accessor :policy

    # **[Required]** The duration of how long this policy should be cached. Note that the type is of type java.time.Duration, not
    # string.
    #
    # @return [String]
    attr_accessor :policy_cache_duration

    # **[Required]** The policy string related to the request.
    # @return [Array<String>]
    attr_accessor :groups

    # **[Required]** The duration of how long the user's group membership should be cached. Note that the type is of type
    # java.time.Duration, not string.
    #
    # @return [String]
    attr_accessor :group_membership_cache_duration

    # If set to true, the SDK should clear the caches.
    # @return [BOOLEAN]
    attr_accessor :flush_all_caches

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'policy': :'policy',
        'policy_cache_duration': :'policyCacheDuration',
        'groups': :'groups',
        'group_membership_cache_duration': :'groupMembershipCacheDuration',
        'flush_all_caches': :'flushAllCaches'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'policy': :'String',
        'policy_cache_duration': :'String',
        'groups': :'Array<String>',
        'group_membership_cache_duration': :'String',
        'flush_all_caches': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :policy The value to assign to the {#policy} property
    # @option attributes [String] :policy_cache_duration The value to assign to the {#policy_cache_duration} property
    # @option attributes [Array<String>] :groups The value to assign to the {#groups} property
    # @option attributes [String] :group_membership_cache_duration The value to assign to the {#group_membership_cache_duration} property
    # @option attributes [BOOLEAN] :flush_all_caches The value to assign to the {#flush_all_caches} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.policy = attributes[:'policy'] if attributes[:'policy']

      self.policy_cache_duration = attributes[:'policyCacheDuration'] if attributes[:'policyCacheDuration']

      raise 'You cannot provide both :policyCacheDuration and :policy_cache_duration' if attributes.key?(:'policyCacheDuration') && attributes.key?(:'policy_cache_duration')

      self.policy_cache_duration = attributes[:'policy_cache_duration'] if attributes[:'policy_cache_duration']

      self.groups = attributes[:'groups'] if attributes[:'groups']

      self.group_membership_cache_duration = attributes[:'groupMembershipCacheDuration'] if attributes[:'groupMembershipCacheDuration']

      raise 'You cannot provide both :groupMembershipCacheDuration and :group_membership_cache_duration' if attributes.key?(:'groupMembershipCacheDuration') && attributes.key?(:'group_membership_cache_duration')

      self.group_membership_cache_duration = attributes[:'group_membership_cache_duration'] if attributes[:'group_membership_cache_duration']

      self.flush_all_caches = attributes[:'flushAllCaches'] unless attributes[:'flushAllCaches'].nil?

      raise 'You cannot provide both :flushAllCaches and :flush_all_caches' if attributes.key?(:'flushAllCaches') && attributes.key?(:'flush_all_caches')

      self.flush_all_caches = attributes[:'flush_all_caches'] unless attributes[:'flush_all_caches'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        policy == other.policy &&
        policy_cache_duration == other.policy_cache_duration &&
        groups == other.groups &&
        group_membership_cache_duration == other.group_membership_cache_duration &&
        flush_all_caches == other.flush_all_caches
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
      [policy, policy_cache_duration, groups, group_membership_cache_duration, flush_all_caches].hash
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
