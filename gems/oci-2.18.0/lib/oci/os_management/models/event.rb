# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of Event.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class OsManagement::Models::Event
    EVENT_TYPE_ENUM = [
      EVENT_TYPE_KERNEL_OOPS = 'KERNEL_OOPS'.freeze,
      EVENT_TYPE_KERNEL_CRASH = 'KERNEL_CRASH'.freeze,
      EVENT_TYPE_CRASH = 'CRASH'.freeze,
      EVENT_TYPE_EXPLOIT_ATTEMPT = 'EXPLOIT_ATTEMPT'.freeze,
      EVENT_TYPE_COMPLIANCE = 'COMPLIANCE'.freeze,
      EVENT_TYPE_TUNING_SUGGESTION = 'TUNING_SUGGESTION'.freeze,
      EVENT_TYPE_TUNING_APPLIED = 'TUNING_APPLIED'.freeze,
      EVENT_TYPE_SECURITY = 'SECURITY'.freeze,
      EVENT_TYPE_ERROR = 'ERROR'.freeze,
      EVENT_TYPE_WARNING = 'WARNING'.freeze,
      EVENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** OCID identifier of the event
    # @return [String]
    attr_accessor :id

    # OCI identifier of the instance where the event occurred
    # @return [String]
    attr_accessor :instance_id

    # OCI identifier of the compartement where the instance is
    # @return [String]
    attr_accessor :compartment_id

    # OCID identifier of the instance tenancy.
    # @return [String]
    attr_accessor :tenancy_id

    # human readable description of the event
    # @return [String]
    attr_accessor :summary

    # Time of the occurrence of the event
    # @return [DateTime]
    attr_accessor :timestamp

    # Unique ID used to group event with the same characteristics together.
    # The list of such groups of event can be retrieved via /recurringEvents/{EventFingerprint}
    #
    # @return [String]
    attr_accessor :event_fingerprint

    # Event occurrence count. Number of time the event has happen on the system.
    # @return [Integer]
    attr_accessor :count

    # **[Required]** Type of the Event.
    # @return [String]
    attr_reader :event_type

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'instance_id': :'instanceId',
        'compartment_id': :'compartmentId',
        'tenancy_id': :'tenancyId',
        'summary': :'summary',
        'timestamp': :'timestamp',
        'event_fingerprint': :'eventFingerprint',
        'count': :'count',
        'event_type': :'eventType',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'instance_id': :'String',
        'compartment_id': :'String',
        'tenancy_id': :'String',
        'summary': :'String',
        'timestamp': :'DateTime',
        'event_fingerprint': :'String',
        'count': :'Integer',
        'event_type': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'eventType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::OsManagement::Models::KernelOopsEvent' if type == 'KERNEL_OOPS'
      return 'OCI::OsManagement::Models::KernelCrashEvent' if type == 'KERNEL_CRASH'

      # TODO: Log a warning when the subtype is not found.
      'OCI::OsManagement::Models::Event'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :instance_id The value to assign to the {#instance_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :tenancy_id The value to assign to the {#tenancy_id} property
    # @option attributes [String] :summary The value to assign to the {#summary} property
    # @option attributes [DateTime] :timestamp The value to assign to the {#timestamp} property
    # @option attributes [String] :event_fingerprint The value to assign to the {#event_fingerprint} property
    # @option attributes [Integer] :count The value to assign to the {#count} property
    # @option attributes [String] :event_type The value to assign to the {#event_type} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.instance_id = attributes[:'instanceId'] if attributes[:'instanceId']

      raise 'You cannot provide both :instanceId and :instance_id' if attributes.key?(:'instanceId') && attributes.key?(:'instance_id')

      self.instance_id = attributes[:'instance_id'] if attributes[:'instance_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.tenancy_id = attributes[:'tenancyId'] if attributes[:'tenancyId']

      raise 'You cannot provide both :tenancyId and :tenancy_id' if attributes.key?(:'tenancyId') && attributes.key?(:'tenancy_id')

      self.tenancy_id = attributes[:'tenancy_id'] if attributes[:'tenancy_id']

      self.summary = attributes[:'summary'] if attributes[:'summary']

      self.timestamp = attributes[:'timestamp'] if attributes[:'timestamp']

      self.event_fingerprint = attributes[:'eventFingerprint'] if attributes[:'eventFingerprint']

      raise 'You cannot provide both :eventFingerprint and :event_fingerprint' if attributes.key?(:'eventFingerprint') && attributes.key?(:'event_fingerprint')

      self.event_fingerprint = attributes[:'event_fingerprint'] if attributes[:'event_fingerprint']

      self.count = attributes[:'count'] if attributes[:'count']

      self.event_type = attributes[:'eventType'] if attributes[:'eventType']

      raise 'You cannot provide both :eventType and :event_type' if attributes.key?(:'eventType') && attributes.key?(:'event_type')

      self.event_type = attributes[:'event_type'] if attributes[:'event_type']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] event_type Object to be assigned
    def event_type=(event_type)
      # rubocop:disable Style/ConditionalAssignment
      if event_type && !EVENT_TYPE_ENUM.include?(event_type)
        OCI.logger.debug("Unknown value for 'event_type' [" + event_type + "]. Mapping to 'EVENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @event_type = EVENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @event_type = event_type
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
        instance_id == other.instance_id &&
        compartment_id == other.compartment_id &&
        tenancy_id == other.tenancy_id &&
        summary == other.summary &&
        timestamp == other.timestamp &&
        event_fingerprint == other.event_fingerprint &&
        count == other.count &&
        event_type == other.event_type &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
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
      [id, instance_id, compartment_id, tenancy_id, summary, timestamp, event_fingerprint, count, event_type, freeform_tags, defined_tags, system_tags].hash
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