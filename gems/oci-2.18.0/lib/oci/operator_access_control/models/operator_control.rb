# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Operator Access Control enables you to grant, audit, or revoke the access Oracle has to your Exadata Cloud@Customer infrastructure, and obtain audit reports of all actions taken by a human operator, in a near real-time manner.
  #
  class OperatorAccessControl::Models::OperatorControl
    RESOURCE_TYPE_ENUM = [
      RESOURCE_TYPE_EXACC = 'EXACC'.freeze,
      RESOURCE_TYPE_EXADATAINFRASTRUCTURE = 'EXADATAINFRASTRUCTURE'.freeze,
      RESOURCE_TYPE_AUTONOMOUSVMCLUSTER = 'AUTONOMOUSVMCLUSTER'.freeze,
      RESOURCE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATED = 'CREATED'.freeze,
      LIFECYCLE_STATE_ASSIGNED = 'ASSIGNED'.freeze,
      LIFECYCLE_STATE_UNASSIGNED = 'UNASSIGNED'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the operator control.
    # @return [String]
    attr_accessor :id

    # **[Required]** Name of the operator control. The name must be unique.
    # @return [String]
    attr_accessor :operator_control_name

    # Description of operator control.
    # @return [String]
    attr_accessor :description

    # List of users who can approve an access request associated with a target resource under the governance of this operator control.
    # @return [Array<String>]
    attr_accessor :approvers_list

    # List of user groups who can approve an access request associated with a target resource under the governance of this operator control.
    # @return [Array<String>]
    attr_accessor :approver_groups_list

    # List of pre-approved operator actions. Access requests associated with a resource governed by this operator control will be
    # automatically approved if the access request only contain operator actions in the pre-approved list.
    #
    # @return [Array<String>]
    attr_accessor :pre_approved_op_action_list

    # List of operator actions that need explicit approval. Any operator action not in the pre-approved list will require explicit
    # approval. Access requests associated with a resource governed by this operator control will be
    # require explicit approval if the access request contains any operator action in this list.
    #
    # @return [Array<String>]
    attr_accessor :approval_required_op_action_list

    # Whether all the operator actions have been pre-approved. If yes, all access requests associated with a resource governed by this operator control
    # will be auto-approved.
    #
    # @return [BOOLEAN]
    attr_accessor :is_fully_pre_approved

    # List of emailId.
    #
    # @return [Array<String>]
    attr_accessor :email_id_list

    # resourceType for which the OperatorControl is applicable
    # @return [String]
    attr_reader :resource_type

    # System message that would be displayed to the operator users on accessing the target resource under the governance of this operator control.
    # @return [String]
    attr_accessor :system_message

    # **[Required]** The OCID of the compartment that contains the operator control.
    # @return [String]
    attr_accessor :compartment_id

    # The current lifecycle state of the operator control.
    # @return [String]
    attr_reader :lifecycle_state

    # Time when the operator control was created expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format. Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_of_creation

    # Time when the operator control was last modified expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format. Example: '2020-05-22T21:10:29.600Z'
    #
    # @return [DateTime]
    attr_accessor :time_of_modification

    # Time when deleted expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339)timestamp format. Example: '2020-05-22T21:10:29.600Z'.
    # Note a deleted operator control still stays in the system, so that you can still audit operator actions associated with access requests
    # raised on target resources governed by the deleted operator control.
    #
    # @return [DateTime]
    attr_accessor :time_of_deletion

    # Description associated with the latest modification of the operator control.
    # @return [String]
    attr_accessor :last_modified_info

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
        'operator_control_name': :'operatorControlName',
        'description': :'description',
        'approvers_list': :'approversList',
        'approver_groups_list': :'approverGroupsList',
        'pre_approved_op_action_list': :'preApprovedOpActionList',
        'approval_required_op_action_list': :'approvalRequiredOpActionList',
        'is_fully_pre_approved': :'isFullyPreApproved',
        'email_id_list': :'emailIdList',
        'resource_type': :'resourceType',
        'system_message': :'systemMessage',
        'compartment_id': :'compartmentId',
        'lifecycle_state': :'lifecycleState',
        'time_of_creation': :'timeOfCreation',
        'time_of_modification': :'timeOfModification',
        'time_of_deletion': :'timeOfDeletion',
        'last_modified_info': :'lastModifiedInfo',
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
        'operator_control_name': :'String',
        'description': :'String',
        'approvers_list': :'Array<String>',
        'approver_groups_list': :'Array<String>',
        'pre_approved_op_action_list': :'Array<String>',
        'approval_required_op_action_list': :'Array<String>',
        'is_fully_pre_approved': :'BOOLEAN',
        'email_id_list': :'Array<String>',
        'resource_type': :'String',
        'system_message': :'String',
        'compartment_id': :'String',
        'lifecycle_state': :'String',
        'time_of_creation': :'DateTime',
        'time_of_modification': :'DateTime',
        'time_of_deletion': :'DateTime',
        'last_modified_info': :'String',
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
    # @option attributes [String] :operator_control_name The value to assign to the {#operator_control_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [Array<String>] :approvers_list The value to assign to the {#approvers_list} property
    # @option attributes [Array<String>] :approver_groups_list The value to assign to the {#approver_groups_list} property
    # @option attributes [Array<String>] :pre_approved_op_action_list The value to assign to the {#pre_approved_op_action_list} property
    # @option attributes [Array<String>] :approval_required_op_action_list The value to assign to the {#approval_required_op_action_list} property
    # @option attributes [BOOLEAN] :is_fully_pre_approved The value to assign to the {#is_fully_pre_approved} property
    # @option attributes [Array<String>] :email_id_list The value to assign to the {#email_id_list} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :system_message The value to assign to the {#system_message} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_of_creation The value to assign to the {#time_of_creation} property
    # @option attributes [DateTime] :time_of_modification The value to assign to the {#time_of_modification} property
    # @option attributes [DateTime] :time_of_deletion The value to assign to the {#time_of_deletion} property
    # @option attributes [String] :last_modified_info The value to assign to the {#last_modified_info} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.operator_control_name = attributes[:'operatorControlName'] if attributes[:'operatorControlName']

      raise 'You cannot provide both :operatorControlName and :operator_control_name' if attributes.key?(:'operatorControlName') && attributes.key?(:'operator_control_name')

      self.operator_control_name = attributes[:'operator_control_name'] if attributes[:'operator_control_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.approvers_list = attributes[:'approversList'] if attributes[:'approversList']

      raise 'You cannot provide both :approversList and :approvers_list' if attributes.key?(:'approversList') && attributes.key?(:'approvers_list')

      self.approvers_list = attributes[:'approvers_list'] if attributes[:'approvers_list']

      self.approver_groups_list = attributes[:'approverGroupsList'] if attributes[:'approverGroupsList']

      raise 'You cannot provide both :approverGroupsList and :approver_groups_list' if attributes.key?(:'approverGroupsList') && attributes.key?(:'approver_groups_list')

      self.approver_groups_list = attributes[:'approver_groups_list'] if attributes[:'approver_groups_list']

      self.pre_approved_op_action_list = attributes[:'preApprovedOpActionList'] if attributes[:'preApprovedOpActionList']

      raise 'You cannot provide both :preApprovedOpActionList and :pre_approved_op_action_list' if attributes.key?(:'preApprovedOpActionList') && attributes.key?(:'pre_approved_op_action_list')

      self.pre_approved_op_action_list = attributes[:'pre_approved_op_action_list'] if attributes[:'pre_approved_op_action_list']

      self.approval_required_op_action_list = attributes[:'approvalRequiredOpActionList'] if attributes[:'approvalRequiredOpActionList']

      raise 'You cannot provide both :approvalRequiredOpActionList and :approval_required_op_action_list' if attributes.key?(:'approvalRequiredOpActionList') && attributes.key?(:'approval_required_op_action_list')

      self.approval_required_op_action_list = attributes[:'approval_required_op_action_list'] if attributes[:'approval_required_op_action_list']

      self.is_fully_pre_approved = attributes[:'isFullyPreApproved'] unless attributes[:'isFullyPreApproved'].nil?

      raise 'You cannot provide both :isFullyPreApproved and :is_fully_pre_approved' if attributes.key?(:'isFullyPreApproved') && attributes.key?(:'is_fully_pre_approved')

      self.is_fully_pre_approved = attributes[:'is_fully_pre_approved'] unless attributes[:'is_fully_pre_approved'].nil?

      self.email_id_list = attributes[:'emailIdList'] if attributes[:'emailIdList']

      raise 'You cannot provide both :emailIdList and :email_id_list' if attributes.key?(:'emailIdList') && attributes.key?(:'email_id_list')

      self.email_id_list = attributes[:'email_id_list'] if attributes[:'email_id_list']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.system_message = attributes[:'systemMessage'] if attributes[:'systemMessage']

      raise 'You cannot provide both :systemMessage and :system_message' if attributes.key?(:'systemMessage') && attributes.key?(:'system_message')

      self.system_message = attributes[:'system_message'] if attributes[:'system_message']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_of_creation = attributes[:'timeOfCreation'] if attributes[:'timeOfCreation']

      raise 'You cannot provide both :timeOfCreation and :time_of_creation' if attributes.key?(:'timeOfCreation') && attributes.key?(:'time_of_creation')

      self.time_of_creation = attributes[:'time_of_creation'] if attributes[:'time_of_creation']

      self.time_of_modification = attributes[:'timeOfModification'] if attributes[:'timeOfModification']

      raise 'You cannot provide both :timeOfModification and :time_of_modification' if attributes.key?(:'timeOfModification') && attributes.key?(:'time_of_modification')

      self.time_of_modification = attributes[:'time_of_modification'] if attributes[:'time_of_modification']

      self.time_of_deletion = attributes[:'timeOfDeletion'] if attributes[:'timeOfDeletion']

      raise 'You cannot provide both :timeOfDeletion and :time_of_deletion' if attributes.key?(:'timeOfDeletion') && attributes.key?(:'time_of_deletion')

      self.time_of_deletion = attributes[:'time_of_deletion'] if attributes[:'time_of_deletion']

      self.last_modified_info = attributes[:'lastModifiedInfo'] if attributes[:'lastModifiedInfo']

      raise 'You cannot provide both :lastModifiedInfo and :last_modified_info' if attributes.key?(:'lastModifiedInfo') && attributes.key?(:'last_modified_info')

      self.last_modified_info = attributes[:'last_modified_info'] if attributes[:'last_modified_info']

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        operator_control_name == other.operator_control_name &&
        description == other.description &&
        approvers_list == other.approvers_list &&
        approver_groups_list == other.approver_groups_list &&
        pre_approved_op_action_list == other.pre_approved_op_action_list &&
        approval_required_op_action_list == other.approval_required_op_action_list &&
        is_fully_pre_approved == other.is_fully_pre_approved &&
        email_id_list == other.email_id_list &&
        resource_type == other.resource_type &&
        system_message == other.system_message &&
        compartment_id == other.compartment_id &&
        lifecycle_state == other.lifecycle_state &&
        time_of_creation == other.time_of_creation &&
        time_of_modification == other.time_of_modification &&
        time_of_deletion == other.time_of_deletion &&
        last_modified_info == other.last_modified_info &&
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
      [id, operator_control_name, description, approvers_list, approver_groups_list, pre_approved_op_action_list, approval_required_op_action_list, is_fully_pre_approved, email_id_list, resource_type, system_message, compartment_id, lifecycle_state, time_of_creation, time_of_modification, time_of_deletion, last_modified_info, freeform_tags, defined_tags].hash
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
