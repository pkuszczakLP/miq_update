# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Summary of a Data Safe Alert.
  class DataSafe::Models::AlertSummary
    STATUS_ENUM = [
      STATUS_OPEN = 'OPEN'.freeze,
      STATUS_CLOSED = 'CLOSED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    SEVERITY_ENUM = [
      SEVERITY_CRITICAL = 'CRITICAL'.freeze,
      SEVERITY_HIGH = 'HIGH'.freeze,
      SEVERITY_MEDIUM = 'MEDIUM'.freeze,
      SEVERITY_LOW = 'LOW'.freeze,
      SEVERITY_EVALUATE = 'EVALUATE'.freeze,
      SEVERITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OPERATION_STATUS_ENUM = [
      OPERATION_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      OPERATION_STATUS_FAILED = 'FAILED'.freeze,
      OPERATION_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    ALERT_TYPE_ENUM = [
      ALERT_TYPE_AUDITING = 'AUDITING'.freeze,
      ALERT_TYPE_SECURITY_ASSESSMENT = 'SECURITY_ASSESSMENT'.freeze,
      ALERT_TYPE_USER_ASSESSMENT = 'USER_ASSESSMENT'.freeze,
      ALERT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_SUCCEEDED = 'SUCCEEDED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the alert.
    # @return [String]
    attr_accessor :id

    # **[Required]** The status of the alert.
    # @return [String]
    attr_reader :status

    # **[Required]** The display name of the alert.
    # @return [String]
    attr_accessor :display_name

    # The details of the alert.
    # @return [String]
    attr_accessor :description

    # **[Required]** Severity level of the alert.
    # @return [String]
    attr_reader :severity

    # Creation date and time of the operation that triggered alert, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # @return [DateTime]
    attr_accessor :operation_time

    # The operation that triggered alert.
    # @return [String]
    attr_accessor :operation

    # The result of the operation (event) that triggered alert.
    # @return [String]
    attr_reader :operation_status

    # Array of OCIDs of the target database.
    # @return [Array<String>]
    attr_accessor :target_ids

    # Array of names of the target database.
    # @return [Array<String>]
    attr_accessor :target_names

    # The OCID of the policy that triggered alert.
    # @return [String]
    attr_accessor :policy_id

    # Type of the alert. Indicates the Data Safe feature triggering the alert.
    # @return [String]
    attr_reader :alert_type

    # **[Required]** The OCID of the compartment that contains the alert.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Creation date and time of the alert, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** Last date and time the alert was updated, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_updated

    # **[Required]** The current state of the alert.
    # @return [String]
    attr_reader :lifecycle_state

    # Map that contains maps of values.
    #  Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :feature_details

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm)
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'status': :'status',
        'display_name': :'displayName',
        'description': :'description',
        'severity': :'severity',
        'operation_time': :'operationTime',
        'operation': :'operation',
        'operation_status': :'operationStatus',
        'target_ids': :'targetIds',
        'target_names': :'targetNames',
        'policy_id': :'policyId',
        'alert_type': :'alertType',
        'compartment_id': :'compartmentId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'feature_details': :'featureDetails',
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
        'status': :'String',
        'display_name': :'String',
        'description': :'String',
        'severity': :'String',
        'operation_time': :'DateTime',
        'operation': :'String',
        'operation_status': :'String',
        'target_ids': :'Array<String>',
        'target_names': :'Array<String>',
        'policy_id': :'String',
        'alert_type': :'String',
        'compartment_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'feature_details': :'Hash<String, Hash<String, Object>>',
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
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :severity The value to assign to the {#severity} property
    # @option attributes [DateTime] :operation_time The value to assign to the {#operation_time} property
    # @option attributes [String] :operation The value to assign to the {#operation} property
    # @option attributes [String] :operation_status The value to assign to the {#operation_status} property
    # @option attributes [Array<String>] :target_ids The value to assign to the {#target_ids} property
    # @option attributes [Array<String>] :target_names The value to assign to the {#target_names} property
    # @option attributes [String] :policy_id The value to assign to the {#policy_id} property
    # @option attributes [String] :alert_type The value to assign to the {#alert_type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Hash<String, Hash<String, Object>>] :feature_details The value to assign to the {#feature_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.status = attributes[:'status'] if attributes[:'status']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.severity = attributes[:'severity'] if attributes[:'severity']

      self.operation_time = attributes[:'operationTime'] if attributes[:'operationTime']

      raise 'You cannot provide both :operationTime and :operation_time' if attributes.key?(:'operationTime') && attributes.key?(:'operation_time')

      self.operation_time = attributes[:'operation_time'] if attributes[:'operation_time']

      self.operation = attributes[:'operation'] if attributes[:'operation']

      self.operation_status = attributes[:'operationStatus'] if attributes[:'operationStatus']

      raise 'You cannot provide both :operationStatus and :operation_status' if attributes.key?(:'operationStatus') && attributes.key?(:'operation_status')

      self.operation_status = attributes[:'operation_status'] if attributes[:'operation_status']

      self.target_ids = attributes[:'targetIds'] if attributes[:'targetIds']

      raise 'You cannot provide both :targetIds and :target_ids' if attributes.key?(:'targetIds') && attributes.key?(:'target_ids')

      self.target_ids = attributes[:'target_ids'] if attributes[:'target_ids']

      self.target_names = attributes[:'targetNames'] if attributes[:'targetNames']

      raise 'You cannot provide both :targetNames and :target_names' if attributes.key?(:'targetNames') && attributes.key?(:'target_names')

      self.target_names = attributes[:'target_names'] if attributes[:'target_names']

      self.policy_id = attributes[:'policyId'] if attributes[:'policyId']

      raise 'You cannot provide both :policyId and :policy_id' if attributes.key?(:'policyId') && attributes.key?(:'policy_id')

      self.policy_id = attributes[:'policy_id'] if attributes[:'policy_id']

      self.alert_type = attributes[:'alertType'] if attributes[:'alertType']

      raise 'You cannot provide both :alertType and :alert_type' if attributes.key?(:'alertType') && attributes.key?(:'alert_type')

      self.alert_type = attributes[:'alert_type'] if attributes[:'alert_type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.feature_details = attributes[:'featureDetails'] if attributes[:'featureDetails']

      raise 'You cannot provide both :featureDetails and :feature_details' if attributes.key?(:'featureDetails') && attributes.key?(:'feature_details')

      self.feature_details = attributes[:'feature_details'] if attributes[:'feature_details']

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_status Object to be assigned
    def operation_status=(operation_status)
      # rubocop:disable Style/ConditionalAssignment
      if operation_status && !OPERATION_STATUS_ENUM.include?(operation_status)
        OCI.logger.debug("Unknown value for 'operation_status' [" + operation_status + "]. Mapping to 'OPERATION_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_status = OPERATION_STATUS_UNKNOWN_ENUM_VALUE
      else
        @operation_status = operation_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] alert_type Object to be assigned
    def alert_type=(alert_type)
      # rubocop:disable Style/ConditionalAssignment
      if alert_type && !ALERT_TYPE_ENUM.include?(alert_type)
        OCI.logger.debug("Unknown value for 'alert_type' [" + alert_type + "]. Mapping to 'ALERT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @alert_type = ALERT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @alert_type = alert_type
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
        status == other.status &&
        display_name == other.display_name &&
        description == other.description &&
        severity == other.severity &&
        operation_time == other.operation_time &&
        operation == other.operation &&
        operation_status == other.operation_status &&
        target_ids == other.target_ids &&
        target_names == other.target_names &&
        policy_id == other.policy_id &&
        alert_type == other.alert_type &&
        compartment_id == other.compartment_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        feature_details == other.feature_details &&
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
      [id, status, display_name, description, severity, operation_time, operation, operation_status, target_ids, target_names, policy_id, alert_type, compartment_id, time_created, time_updated, lifecycle_state, feature_details, freeform_tags, defined_tags].hash
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