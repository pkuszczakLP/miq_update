# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details about the execution progress of a stage in a deployment.
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Devops::Models::DeployStageExecutionProgress
    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_CANCELING = 'CANCELING'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_ROLLBACK_IN_PROGRESS = 'ROLLBACK_IN_PROGRESS'.freeze,
      STATUS_ROLLBACK_SUCCEEDED = 'ROLLBACK_SUCCEEDED'.freeze,
      STATUS_ROLLBACK_FAILED = 'ROLLBACK_FAILED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Stage display name. Avoid entering confidential information.
    # @return [String]
    attr_accessor :deploy_stage_display_name

    # Deployment stage type.
    # @return [String]
    attr_accessor :deploy_stage_type

    # The OCID of the stage.
    # @return [String]
    attr_accessor :deploy_stage_id

    # Time the stage started executing. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_started

    # Time the stage finished executing. Format defined by [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_finished

    # The current state of the stage.
    # @return [String]
    attr_reader :status

    # @return [OCI::Devops::Models::DeployStagePredecessorCollection]
    attr_accessor :deploy_stage_predecessors

    # Details about stage execution for all the target environments.
    # @return [Array<OCI::Devops::Models::DeployStageExecutionProgressDetails>]
    attr_accessor :deploy_stage_execution_progress_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'deploy_stage_display_name': :'deployStageDisplayName',
        'deploy_stage_type': :'deployStageType',
        'deploy_stage_id': :'deployStageId',
        'time_started': :'timeStarted',
        'time_finished': :'timeFinished',
        'status': :'status',
        'deploy_stage_predecessors': :'deployStagePredecessors',
        'deploy_stage_execution_progress_details': :'deployStageExecutionProgressDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'deploy_stage_display_name': :'String',
        'deploy_stage_type': :'String',
        'deploy_stage_id': :'String',
        'time_started': :'DateTime',
        'time_finished': :'DateTime',
        'status': :'String',
        'deploy_stage_predecessors': :'OCI::Devops::Models::DeployStagePredecessorCollection',
        'deploy_stage_execution_progress_details': :'Array<OCI::Devops::Models::DeployStageExecutionProgressDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'deployStageType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Devops::Models::ComputeInstanceGroupBlueGreenTrafficShiftDeployStageExecutionProgress' if type == 'COMPUTE_INSTANCE_GROUP_BLUE_GREEN_TRAFFIC_SHIFT'
      return 'OCI::Devops::Models::ComputeInstanceGroupCanaryDeployStageExecutionProgress' if type == 'COMPUTE_INSTANCE_GROUP_CANARY_DEPLOYMENT'
      return 'OCI::Devops::Models::OkeBlueGreenDeployStageExecutionProgress' if type == 'OKE_BLUE_GREEN_DEPLOYMENT'
      return 'OCI::Devops::Models::ComputeInstanceGroupDeployStageExecutionProgress' if type == 'COMPUTE_INSTANCE_GROUP_ROLLING_DEPLOYMENT'
      return 'OCI::Devops::Models::OkeCanaryDeployStageExecutionProgress' if type == 'OKE_CANARY_DEPLOYMENT'
      return 'OCI::Devops::Models::LoadBalancerTrafficShiftDeployStageExecutionProgress' if type == 'LOAD_BALANCER_TRAFFIC_SHIFT'
      return 'OCI::Devops::Models::WaitDeployStageExecutionProgress' if type == 'WAIT'
      return 'OCI::Devops::Models::ComputeInstanceGroupCanaryTrafficShiftDeployStageExecutionProgress' if type == 'COMPUTE_INSTANCE_GROUP_CANARY_TRAFFIC_SHIFT'
      return 'OCI::Devops::Models::OkeCanaryApprovalDeployStageExecutionProgress' if type == 'OKE_CANARY_APPROVAL'
      return 'OCI::Devops::Models::ManualApprovalDeployStageExecutionProgress' if type == 'MANUAL_APPROVAL'
      return 'OCI::Devops::Models::OkeDeployStageExecutionProgress' if type == 'OKE_DEPLOYMENT'
      return 'OCI::Devops::Models::FunctionDeployStageExecutionProgress' if type == 'DEPLOY_FUNCTION'
      return 'OCI::Devops::Models::OkeBlueGreenTrafficShiftDeployStageExecutionProgress' if type == 'OKE_BLUE_GREEN_TRAFFIC_SHIFT'
      return 'OCI::Devops::Models::OkeHelmChartDeploymentStageExecutionProgress' if type == 'OKE_HELM_CHART_DEPLOYMENT'
      return 'OCI::Devops::Models::InvokeFunctionDeployStageExecutionProgress' if type == 'INVOKE_FUNCTION'
      return 'OCI::Devops::Models::OkeCanaryTrafficShiftDeployStageExecutionProgress' if type == 'OKE_CANARY_TRAFFIC_SHIFT'
      return 'OCI::Devops::Models::ComputeInstanceGroupCanaryApprovalDeployStageExecutionProgress' if type == 'COMPUTE_INSTANCE_GROUP_CANARY_APPROVAL'
      return 'OCI::Devops::Models::ComputeInstanceGroupBlueGreenDeployStageExecutionProgress' if type == 'COMPUTE_INSTANCE_GROUP_BLUE_GREEN_DEPLOYMENT'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Devops::Models::DeployStageExecutionProgress'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :deploy_stage_display_name The value to assign to the {#deploy_stage_display_name} property
    # @option attributes [String] :deploy_stage_type The value to assign to the {#deploy_stage_type} property
    # @option attributes [String] :deploy_stage_id The value to assign to the {#deploy_stage_id} property
    # @option attributes [DateTime] :time_started The value to assign to the {#time_started} property
    # @option attributes [DateTime] :time_finished The value to assign to the {#time_finished} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [OCI::Devops::Models::DeployStagePredecessorCollection] :deploy_stage_predecessors The value to assign to the {#deploy_stage_predecessors} property
    # @option attributes [Array<OCI::Devops::Models::DeployStageExecutionProgressDetails>] :deploy_stage_execution_progress_details The value to assign to the {#deploy_stage_execution_progress_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.deploy_stage_display_name = attributes[:'deployStageDisplayName'] if attributes[:'deployStageDisplayName']

      raise 'You cannot provide both :deployStageDisplayName and :deploy_stage_display_name' if attributes.key?(:'deployStageDisplayName') && attributes.key?(:'deploy_stage_display_name')

      self.deploy_stage_display_name = attributes[:'deploy_stage_display_name'] if attributes[:'deploy_stage_display_name']

      self.deploy_stage_type = attributes[:'deployStageType'] if attributes[:'deployStageType']

      raise 'You cannot provide both :deployStageType and :deploy_stage_type' if attributes.key?(:'deployStageType') && attributes.key?(:'deploy_stage_type')

      self.deploy_stage_type = attributes[:'deploy_stage_type'] if attributes[:'deploy_stage_type']

      self.deploy_stage_id = attributes[:'deployStageId'] if attributes[:'deployStageId']

      raise 'You cannot provide both :deployStageId and :deploy_stage_id' if attributes.key?(:'deployStageId') && attributes.key?(:'deploy_stage_id')

      self.deploy_stage_id = attributes[:'deploy_stage_id'] if attributes[:'deploy_stage_id']

      self.time_started = attributes[:'timeStarted'] if attributes[:'timeStarted']

      raise 'You cannot provide both :timeStarted and :time_started' if attributes.key?(:'timeStarted') && attributes.key?(:'time_started')

      self.time_started = attributes[:'time_started'] if attributes[:'time_started']

      self.time_finished = attributes[:'timeFinished'] if attributes[:'timeFinished']

      raise 'You cannot provide both :timeFinished and :time_finished' if attributes.key?(:'timeFinished') && attributes.key?(:'time_finished')

      self.time_finished = attributes[:'time_finished'] if attributes[:'time_finished']

      self.status = attributes[:'status'] if attributes[:'status']

      self.deploy_stage_predecessors = attributes[:'deployStagePredecessors'] if attributes[:'deployStagePredecessors']

      raise 'You cannot provide both :deployStagePredecessors and :deploy_stage_predecessors' if attributes.key?(:'deployStagePredecessors') && attributes.key?(:'deploy_stage_predecessors')

      self.deploy_stage_predecessors = attributes[:'deploy_stage_predecessors'] if attributes[:'deploy_stage_predecessors']

      self.deploy_stage_execution_progress_details = attributes[:'deployStageExecutionProgressDetails'] if attributes[:'deployStageExecutionProgressDetails']

      raise 'You cannot provide both :deployStageExecutionProgressDetails and :deploy_stage_execution_progress_details' if attributes.key?(:'deployStageExecutionProgressDetails') && attributes.key?(:'deploy_stage_execution_progress_details')

      self.deploy_stage_execution_progress_details = attributes[:'deploy_stage_execution_progress_details'] if attributes[:'deploy_stage_execution_progress_details']
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
        deploy_stage_display_name == other.deploy_stage_display_name &&
        deploy_stage_type == other.deploy_stage_type &&
        deploy_stage_id == other.deploy_stage_id &&
        time_started == other.time_started &&
        time_finished == other.time_finished &&
        status == other.status &&
        deploy_stage_predecessors == other.deploy_stage_predecessors &&
        deploy_stage_execution_progress_details == other.deploy_stage_execution_progress_details
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
      [deploy_stage_display_name, deploy_stage_type, deploy_stage_id, time_started, time_finished, status, deploy_stage_predecessors, deploy_stage_execution_progress_details].hash
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
