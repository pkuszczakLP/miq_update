# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of access request.
  class OperatorAccessControl::Models::AccessRequestSummary
    RESOURCE_TYPE_ENUM = [
      RESOURCE_TYPE_EXACC = 'EXACC'.freeze,
      RESOURCE_TYPE_EXADATAINFRASTRUCTURE = 'EXADATAINFRASTRUCTURE'.freeze,
      RESOURCE_TYPE_AUTONOMOUSVMCLUSTER = 'AUTONOMOUSVMCLUSTER'.freeze,
      RESOURCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

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

    SEVERITY_ENUM = [
      SEVERITY_S1 = 'S1'.freeze,
      SEVERITY_S2 = 'S2'.freeze,
      SEVERITY_S3 = 'S3'.freeze,
      SEVERITY_S4 = 'S4'.freeze,
      SEVERITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the access request.
    # @return [String]
    attr_accessor :id

    # This is a system-generated identifier.
    # @return [String]
    attr_accessor :request_id

    # **[Required]** Comment associated with the access request.
    # @return [String]
    attr_accessor :access_reason_summary

    # The OCID of the compartment that contains the access request.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The OCID of the target resource associated with the access request. The operator raises an access request to get approval to
    # access the target resource.
    #
    # @return [String]
    attr_accessor :resource_id

    # The name of the target resource.
    # @return [String]
    attr_accessor :resource_name

    # resourceType for which the AccessRequest is applicable
    # @return [String]
    attr_reader :resource_type

    # The current state of the AccessRequest.
    # @return [String]
    attr_reader :lifecycle_state

    # Time when the access request was created by the operator user in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_of_creation

    # Time when the access request was last modified in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_of_modification

    # The time when access request is scheduled to be approved in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_of_user_creation

    # Duration in hours for which access is sought on the target resource.
    # @return [Integer]
    attr_accessor :duration

    # Duration in hours for which extension access is sought on the target resource.
    # @return [Integer]
    attr_accessor :extend_duration

    # Priority assigned to the access request by the operator
    # @return [String]
    attr_reader :severity

    # Whether the access request was automatically approved.
    # @return [BOOLEAN]
    attr_accessor :is_auto_approved

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'request_id': :'requestId',
        'access_reason_summary': :'accessReasonSummary',
        'compartment_id': :'compartmentId',
        'resource_id': :'resourceId',
        'resource_name': :'resourceName',
        'resource_type': :'resourceType',
        'lifecycle_state': :'lifecycleState',
        'time_of_creation': :'timeOfCreation',
        'time_of_modification': :'timeOfModification',
        'time_of_user_creation': :'timeOfUserCreation',
        'duration': :'duration',
        'extend_duration': :'extendDuration',
        'severity': :'severity',
        'is_auto_approved': :'isAutoApproved',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'request_id': :'String',
        'access_reason_summary': :'String',
        'compartment_id': :'String',
        'resource_id': :'String',
        'resource_name': :'String',
        'resource_type': :'String',
        'lifecycle_state': :'String',
        'time_of_creation': :'DateTime',
        'time_of_modification': :'DateTime',
        'time_of_user_creation': :'DateTime',
        'duration': :'Integer',
        'extend_duration': :'Integer',
        'severity': :'String',
        'is_auto_approved': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :request_id The value to assign to the {#request_id} property
    # @option attributes [String] :access_reason_summary The value to assign to the {#access_reason_summary} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :resource_name The value to assign to the {#resource_name} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_of_creation The value to assign to the {#time_of_creation} property
    # @option attributes [DateTime] :time_of_modification The value to assign to the {#time_of_modification} property
    # @option attributes [DateTime] :time_of_user_creation The value to assign to the {#time_of_user_creation} property
    # @option attributes [Integer] :duration The value to assign to the {#duration} property
    # @option attributes [Integer] :extend_duration The value to assign to the {#extend_duration} property
    # @option attributes [String] :severity The value to assign to the {#severity} property
    # @option attributes [BOOLEAN] :is_auto_approved The value to assign to the {#is_auto_approved} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.request_id = attributes[:'requestId'] if attributes[:'requestId']

      raise 'You cannot provide both :requestId and :request_id' if attributes.key?(:'requestId') && attributes.key?(:'request_id')

      self.request_id = attributes[:'request_id'] if attributes[:'request_id']

      self.access_reason_summary = attributes[:'accessReasonSummary'] if attributes[:'accessReasonSummary']

      raise 'You cannot provide both :accessReasonSummary and :access_reason_summary' if attributes.key?(:'accessReasonSummary') && attributes.key?(:'access_reason_summary')

      self.access_reason_summary = attributes[:'access_reason_summary'] if attributes[:'access_reason_summary']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.resource_name = attributes[:'resourceName'] if attributes[:'resourceName']

      raise 'You cannot provide both :resourceName and :resource_name' if attributes.key?(:'resourceName') && attributes.key?(:'resource_name')

      self.resource_name = attributes[:'resource_name'] if attributes[:'resource_name']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_of_creation = attributes[:'timeOfCreation'] if attributes[:'timeOfCreation']

      raise 'You cannot provide both :timeOfCreation and :time_of_creation' if attributes.key?(:'timeOfCreation') && attributes.key?(:'time_of_creation')

      self.time_of_creation = attributes[:'time_of_creation'] if attributes[:'time_of_creation']

      self.time_of_modification = attributes[:'timeOfModification'] if attributes[:'timeOfModification']

      raise 'You cannot provide both :timeOfModification and :time_of_modification' if attributes.key?(:'timeOfModification') && attributes.key?(:'time_of_modification')

      self.time_of_modification = attributes[:'time_of_modification'] if attributes[:'time_of_modification']

      self.time_of_user_creation = attributes[:'timeOfUserCreation'] if attributes[:'timeOfUserCreation']

      raise 'You cannot provide both :timeOfUserCreation and :time_of_user_creation' if attributes.key?(:'timeOfUserCreation') && attributes.key?(:'time_of_user_creation')

      self.time_of_user_creation = attributes[:'time_of_user_creation'] if attributes[:'time_of_user_creation']

      self.duration = attributes[:'duration'] if attributes[:'duration']

      self.extend_duration = attributes[:'extendDuration'] if attributes[:'extendDuration']

      raise 'You cannot provide both :extendDuration and :extend_duration' if attributes.key?(:'extendDuration') && attributes.key?(:'extend_duration')

      self.extend_duration = attributes[:'extend_duration'] if attributes[:'extend_duration']

      self.severity = attributes[:'severity'] if attributes[:'severity']

      self.is_auto_approved = attributes[:'isAutoApproved'] unless attributes[:'isAutoApproved'].nil?

      raise 'You cannot provide both :isAutoApproved and :is_auto_approved' if attributes.key?(:'isAutoApproved') && attributes.key?(:'is_auto_approved')

      self.is_auto_approved = attributes[:'is_auto_approved'] unless attributes[:'is_auto_approved'].nil?

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_type Object to be assigned
    def resource_type=(resource_type)
      # rubocop:disable Style/ConditionalAssignment
      if resource_type && !RESOURCE_TYPE_ENUM.include?(resource_type)
        OCI.logger.debug("Unknown value for 'resource_type' [" + resource_type + "]. Mapping to 'RESOURCE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_type = RESOURCE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @resource_type = resource_type
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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] severity Object to be assigned
    def severity=(severity)
      # rubocop:disable Style/ConditionalAssignment
      if severity && !SEVERITY_ENUM.include?(severity)
        OCI.logger.debug("Unknown value for 'severity' [" + severity + "]. Mapping to 'SEVERITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @severity = SEVERITY_UNKNOWN_ENUM_VALUE
      else
        @severity = severity
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
        request_id == other.request_id &&
        access_reason_summary == other.access_reason_summary &&
        compartment_id == other.compartment_id &&
        resource_id == other.resource_id &&
        resource_name == other.resource_name &&
        resource_type == other.resource_type &&
        lifecycle_state == other.lifecycle_state &&
        time_of_creation == other.time_of_creation &&
        time_of_modification == other.time_of_modification &&
        time_of_user_creation == other.time_of_user_creation &&
        duration == other.duration &&
        extend_duration == other.extend_duration &&
        severity == other.severity &&
        is_auto_approved == other.is_auto_approved &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [id, request_id, access_reason_summary, compartment_id, resource_id, resource_name, resource_type, lifecycle_state, time_of_creation, time_of_modification, time_of_user_creation, duration, extend_duration, severity, is_auto_approved, freeform_tags, defined_tags].hash
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
