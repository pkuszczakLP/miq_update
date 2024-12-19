=begin
#Cisco Intersight

#Cisco Intersight is a management platform delivered as a service with embedded analytics for your Cisco and 3rd party IT infrastructure. This platform offers an intelligent level of management that enables IT organizations to analyze, simplify, and automate their environments in more advanced ways than the prior generations of tools. Cisco Intersight provides an integrated and intuitive management experience for resources in the traditional data center as well as at the edge. With flexible deployment options to address complex security needs, getting started with Intersight is quick and easy. Cisco Intersight has deep integration with Cisco UCS and HyperFlex systems allowing for remote deployment, configuration, and ongoing maintenance. The model-based deployment works for a single system in a remote location or hundreds of systems in a data center and enables rapid, standardized configuration and deployment. It also streamlines maintaining those systems whether you are working with small or very large configurations. The Intersight OpenAPI document defines the complete set of properties that are returned in the HTTP response. From that perspective, a client can expect that no additional properties are returned, unless these properties are explicitly defined in the OpenAPI document. However, when a client uses an older version of the Intersight OpenAPI document, the server may send additional properties because the software is more recent than the client. In that case, the client may receive properties that it does not know about. Some generated SDKs perform a strict validation of the HTTP response body against the OpenAPI document. This document was created on 2021-10-20T11:22:53Z.

The version of the OpenAPI document: 1.0.9-4870
Contact: intersight@cisco.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'date'
require 'time'

module IntersightClient
  # Rollback workflow contains details about the workflow instance, tasks to be rollback along with the status and workflow instances.
  class WorkflowRollbackWorkflow < MoBaseMo
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    # The action of the rollback workflow such as Create and Start. * `None` - If no action is set, then the default value is set to none for the action field. * `Create` - Create rollback workflow data for the execution of the rollback workflow. * `Start` - Start a new execution of the rollback workflow.
    attr_accessor :action

    # When set to true, if a task in the workflow fails, the rollback workflow continues to the subsequent task. When set to false, the rollback workflow execution halts if a task fails.
    attr_accessor :continue_on_task_failure

    attr_accessor :rollback_tasks

    attr_accessor :selected_tasks

    # Status of the rollback workflow instance (Created, Running, Completed, Failed). * `None` - If no status is set, then the default value is set none for the status field. * `Created` - Status of the rollback workflow when it identifies the eligible tasks for rollback. * `Running` - Status of the rollback workflow when it is in-progress. * `Completed` - Status of the rollback workflow after execution is successful. * `Failed` - Status of the rollback workflow after execution results in failure.
    attr_accessor :status

    attr_accessor :primary_workflow

    # An array of relationships to workflowWorkflowInfo resources.
    attr_accessor :rollback_workflows

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'class_id' => :'ClassId',
        :'object_type' => :'ObjectType',
        :'action' => :'Action',
        :'continue_on_task_failure' => :'ContinueOnTaskFailure',
        :'rollback_tasks' => :'RollbackTasks',
        :'selected_tasks' => :'SelectedTasks',
        :'status' => :'Status',
        :'primary_workflow' => :'PrimaryWorkflow',
        :'rollback_workflows' => :'RollbackWorkflows'
      }
    end

    # Returns all the JSON keys this model knows about, including the ones defined in its parent(s)
    def self.acceptable_attributes
      attribute_map.values.concat(superclass.acceptable_attributes)
    end

    # Returns the key-value map of all the JSON attributes this model knows about, including the ones defined in its parent(s)
    def self.acceptable_attribute_map
      attribute_map.merge(superclass.acceptable_attribute_map)
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'class_id' => :'String',
        :'object_type' => :'String',
        :'action' => :'String',
        :'continue_on_task_failure' => :'Boolean',
        :'rollback_tasks' => :'Array<WorkflowRollbackWorkflowTask>',
        :'selected_tasks' => :'Array<WorkflowRollbackWorkflowTask>',
        :'status' => :'String',
        :'primary_workflow' => :'WorkflowWorkflowInfoRelationship',
        :'rollback_workflows' => :'Array<WorkflowWorkflowInfoRelationship>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'rollback_tasks',
        :'selected_tasks',
        :'rollback_workflows'
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'MoBaseMo',
      :'WorkflowRollbackWorkflowAllOf'
      ]
    end

    # discriminator's property name in OpenAPI v3
    def self.openapi_discriminator_name
      :'ClassId'
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::WorkflowRollbackWorkflow` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `#{self.class.name}`. Please check the name to make sure it's valid. List of attributes: " + self.class.acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      # call parent's initialize
      super(attributes)

      if attributes.key?(:'class_id')
        self.class_id = attributes[:'class_id']
      else
        self.class_id = 'workflow.RollbackWorkflow'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'workflow.RollbackWorkflow'
      end

      if attributes.key?(:'action')
        self.action = attributes[:'action']
      else
        self.action = 'None'
      end

      if attributes.key?(:'continue_on_task_failure')
        self.continue_on_task_failure = attributes[:'continue_on_task_failure']
      else
        self.continue_on_task_failure = true
      end

      if attributes.key?(:'rollback_tasks')
        if (value = attributes[:'rollback_tasks']).is_a?(Array)
          self.rollback_tasks = value
        end
      end

      if attributes.key?(:'selected_tasks')
        if (value = attributes[:'selected_tasks']).is_a?(Array)
          self.selected_tasks = value
        end
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      else
        self.status = 'None'
      end

      if attributes.key?(:'primary_workflow')
        self.primary_workflow = attributes[:'primary_workflow']
      end

      if attributes.key?(:'rollback_workflows')
        if (value = attributes[:'rollback_workflows']).is_a?(Array)
          self.rollback_workflows = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = super
      if @class_id.nil?
        invalid_properties.push('invalid value for "class_id", class_id cannot be nil.')
      end

      if @object_type.nil?
        invalid_properties.push('invalid value for "object_type", object_type cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["workflow.RollbackWorkflow"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["workflow.RollbackWorkflow"])
      return false unless object_type_validator.valid?(@object_type)
      action_validator = EnumAttributeValidator.new('String', ["None", "Create", "Start"])
      return false unless action_validator.valid?(@action)
      status_validator = EnumAttributeValidator.new('String', ["None", "Created", "Running", "Completed", "Failed"])
      return false unless status_validator.valid?(@status)
      true && super
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["workflow.RollbackWorkflow"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["workflow.RollbackWorkflow"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      validator = EnumAttributeValidator.new('String', ["None", "Create", "Start"])
      unless validator.valid?(action)
        fail ArgumentError, "invalid value for \"action\", must be one of #{validator.allowable_values}."
      end
      @action = action
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ["None", "Created", "Running", "Completed", "Failed"])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          action == o.action &&
          continue_on_task_failure == o.continue_on_task_failure &&
          rollback_tasks == o.rollback_tasks &&
          selected_tasks == o.selected_tasks &&
          status == o.status &&
          primary_workflow == o.primary_workflow &&
          rollback_workflows == o.rollback_workflows && super(o)
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, action, continue_on_task_failure, rollback_tasks, selected_tasks, status, primary_workflow, rollback_workflows].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      super(attributes)
      WorkflowRollbackWorkflow.openapi_types.each_pair do |key, type|
        if attributes[WorkflowRollbackWorkflow.attribute_map[key]].nil? && WorkflowRollbackWorkflow.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[WorkflowRollbackWorkflow.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[WorkflowRollbackWorkflow.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[WorkflowRollbackWorkflow.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[WorkflowRollbackWorkflow.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = IntersightClient.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = super
      WorkflowRollbackWorkflow.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = WorkflowRollbackWorkflow.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

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
