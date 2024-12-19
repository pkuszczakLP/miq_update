# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define an alarm.
  # For information about alarms, see [Alarms Overview](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#AlarmsOverview).
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
  # talk to an administrator. If you're an administrator who needs to write policies to give users access, see
  # [Getting Started with Policies](https://docs.cloud.oracle.com/iaas/Content/Identity/Concepts/policygetstarted.htm).
  #
  # For information about endpoints and signing API requests, see
  # [About the API](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/usingapi.htm). For information about available SDKs and tools, see
  # [SDKS and Other Tools](https://docs.cloud.oracle.com/iaas/Content/API/Concepts/sdks.htm).
  #
  class Monitoring::Models::Alarm
    SEVERITY_ENUM = [
      SEVERITY_CRITICAL = 'CRITICAL'.freeze,
      SEVERITY_ERROR = 'ERROR'.freeze,
      SEVERITY_WARNING = 'WARNING'.freeze,
      SEVERITY_INFO = 'INFO'.freeze,
      SEVERITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    MESSAGE_FORMAT_ENUM = [
      MESSAGE_FORMAT_RAW = 'RAW'.freeze,
      MESSAGE_FORMAT_PRETTY_JSON = 'PRETTY_JSON'.freeze,
      MESSAGE_FORMAT_ONS_OPTIMIZED = 'ONS_OPTIMIZED'.freeze,
      MESSAGE_FORMAT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the alarm.
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** A user-friendly name for the alarm. It does not have to be unique, and it's changeable.
    #
    # This name is sent as the title for notifications related to this alarm.
    #
    # Example: `High CPU Utilization`
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the alarm.
    #
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment containing the metric
    # being evaluated by the alarm.
    #
    # @return [String]
    attr_accessor :metric_compartment_id

    # When true, the alarm evaluates metrics from all compartments and subcompartments. The parameter can
    # only be set to true when metricCompartmentId is the tenancy OCID (the tenancy is the root compartment).
    # A true value requires the user to have tenancy-level permissions. If this requirement is not met,
    # then the call is rejected. When false, the alarm evaluates metrics from only the compartment specified
    # in metricCompartmentId. Default is false.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :metric_compartment_id_in_subtree

    # **[Required]** The source service or application emitting the metric that is evaluated by the alarm.
    #
    # Example: `oci_computeagent`
    #
    # @return [String]
    attr_accessor :namespace

    # Resource group to match for metric data retrieved by the alarm. A resource group is a custom string that you can match when retrieving custom metrics. Only one resource group can be applied per metric.
    # A valid resourceGroup value starts with an alphabetical character and includes only alphanumeric characters, periods (.), underscores (_), hyphens (-), and dollar signs ($).
    #
    # Example: `frontend-fleet`
    #
    # @return [String]
    attr_accessor :resource_group

    # **[Required]** The Monitoring Query Language (MQL) expression to evaluate for the alarm. The Alarms feature of
    # the Monitoring service interprets results for each returned time series as Boolean values,
    # where zero represents false and a non-zero value represents true. A true value means that the trigger
    # rule condition has been met. The query must specify a metric, statistic, interval, and trigger
    # rule (threshold or absence). Supported values for interval depend on the specified time range. More
    # interval values are supported for smaller time ranges. You can optionally
    # specify dimensions and grouping functions. Supported grouping functions: `grouping()`, `groupBy()`.
    # For details about Monitoring Query Language (MQL), see [Monitoring Query Language (MQL) Reference](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Reference/mql.htm).
    # For available dimensions, review the metric definition for the supported service.
    # See [Supported Services](https://docs.cloud.oracle.com/iaas/Content/Monitoring/Concepts/monitoringoverview.htm#SupportedServices).
    #
    # Example of threshold alarm:
    #
    #   -----
    #
    #     CpuUtilization[1m]{availabilityDomain=\"cumS:PHX-AD-1\"}.groupBy(availabilityDomain).percentile(0.9) > 85
    #
    #   -----
    #
    # Example of absence alarm:
    #
    #   -----
    #
    #     CpuUtilization[1m]{availabilityDomain=\"cumS:PHX-AD-1\"}.absent()
    #
    #   -----
    #
    # @return [String]
    attr_accessor :query

    # The time between calculated aggregation windows for the alarm. Supported value: `1m`
    #
    # @return [String]
    attr_accessor :resolution

    # The period of time that the condition defined in the alarm must persist before the alarm state
    # changes from \"OK\" to \"FIRING\". For example, a value of 5 minutes means that the
    # alarm must persist in breaching the condition for five minutes before the alarm updates its
    # state to \"FIRING\".
    #
    # The duration is specified as a string in ISO 8601 format (`PT10M` for ten minutes or `PT1H`
    # for one hour). Minimum: PT1M. Maximum: PT1H. Default: PT1M.
    #
    # Under the default value of PT1M, the first evaluation that breaches the alarm updates the
    # state to \"FIRING\".
    #
    # The alarm updates its status to \"OK\" when the breaching condition has been clear for
    # the most recent minute.
    #
    # Example: `PT5M`
    #
    # @return [String]
    attr_accessor :pending_duration

    # **[Required]** The perceived type of response required when the alarm is in the \"FIRING\" state.
    #
    # Example: `CRITICAL`
    #
    # @return [String]
    attr_reader :severity

    # The human-readable content of the notification delivered. Oracle recommends providing guidance
    # to operators for resolving the alarm condition. Consider adding links to standard runbook
    # practices.
    #
    # Example: `High CPU usage alert. Follow runbook instructions for resolution.`
    #
    # @return [String]
    attr_accessor :body

    # The format to use for notification messages sent from this alarm. The formats are:
    # * `RAW` - Raw JSON blob. Default value.
    # * `PRETTY_JSON`: JSON with new lines and indents.
    # * `ONS_OPTIMIZED`: Simplified, user-friendly layout. Applies only to messages sent through the Notifications service to the following subscription types: Email.
    #
    # @return [String]
    attr_reader :message_format

    # **[Required]** A list of destinations to which the notifications for this alarm will be delivered.
    # Each destination is represented by an [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) related to the supported destination service.
    # For example, a destination using the Notifications service is represented by a topic OCID.
    # Supported destination services: Notifications Service. Limit: One destination per supported destination service.
    #
    # @return [Array<String>]
    attr_accessor :destinations

    # The frequency at which notifications are re-submitted, if the alarm keeps firing without
    # interruption. Format defined by ISO 8601. For example, `PT4H` indicates four hours.
    # Minimum: PT1M. Maximum: P30D.
    #
    # Default value: null (notifications are not re-submitted).
    #
    # Example: `PT2H`
    #
    # @return [String]
    attr_accessor :repeat_notification_duration

    # The configuration details for suppressing an alarm.
    #
    # @return [OCI::Monitoring::Models::Suppression]
    attr_accessor :suppression

    # **[Required]** Whether the alarm is enabled.
    #
    # Example: `true`
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # **[Required]** The current lifecycle state of the alarm.
    #
    # Example: `DELETED`
    #
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The date and time the alarm was created. Format defined by RFC3339.
    #
    # Example: `2019-02-01T01:02:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the alarm was last updated. Format defined by RFC3339.
    #
    # Example: `2019-02-03T01:02:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'metric_compartment_id': :'metricCompartmentId',
        'metric_compartment_id_in_subtree': :'metricCompartmentIdInSubtree',
        'namespace': :'namespace',
        'resource_group': :'resourceGroup',
        'query': :'query',
        'resolution': :'resolution',
        'pending_duration': :'pendingDuration',
        'severity': :'severity',
        'body': :'body',
        'message_format': :'messageFormat',
        'destinations': :'destinations',
        'repeat_notification_duration': :'repeatNotificationDuration',
        'suppression': :'suppression',
        'is_enabled': :'isEnabled',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'lifecycle_state': :'lifecycleState',
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
        'display_name': :'String',
        'compartment_id': :'String',
        'metric_compartment_id': :'String',
        'metric_compartment_id_in_subtree': :'BOOLEAN',
        'namespace': :'String',
        'resource_group': :'String',
        'query': :'String',
        'resolution': :'String',
        'pending_duration': :'String',
        'severity': :'String',
        'body': :'String',
        'message_format': :'String',
        'destinations': :'Array<String>',
        'repeat_notification_duration': :'String',
        'suppression': :'OCI::Monitoring::Models::Suppression',
        'is_enabled': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'lifecycle_state': :'String',
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
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :metric_compartment_id The value to assign to the {#metric_compartment_id} property
    # @option attributes [BOOLEAN] :metric_compartment_id_in_subtree The value to assign to the {#metric_compartment_id_in_subtree} property
    # @option attributes [String] :namespace The value to assign to the {#namespace} property
    # @option attributes [String] :resource_group The value to assign to the {#resource_group} property
    # @option attributes [String] :query The value to assign to the {#query} property
    # @option attributes [String] :resolution The value to assign to the {#resolution} property
    # @option attributes [String] :pending_duration The value to assign to the {#pending_duration} property
    # @option attributes [String] :severity The value to assign to the {#severity} property
    # @option attributes [String] :body The value to assign to the {#body} property
    # @option attributes [String] :message_format The value to assign to the {#message_format} property
    # @option attributes [Array<String>] :destinations The value to assign to the {#destinations} property
    # @option attributes [String] :repeat_notification_duration The value to assign to the {#repeat_notification_duration} property
    # @option attributes [OCI::Monitoring::Models::Suppression] :suppression The value to assign to the {#suppression} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.metric_compartment_id = attributes[:'metricCompartmentId'] if attributes[:'metricCompartmentId']

      raise 'You cannot provide both :metricCompartmentId and :metric_compartment_id' if attributes.key?(:'metricCompartmentId') && attributes.key?(:'metric_compartment_id')

      self.metric_compartment_id = attributes[:'metric_compartment_id'] if attributes[:'metric_compartment_id']

      self.metric_compartment_id_in_subtree = attributes[:'metricCompartmentIdInSubtree'] unless attributes[:'metricCompartmentIdInSubtree'].nil?

      raise 'You cannot provide both :metricCompartmentIdInSubtree and :metric_compartment_id_in_subtree' if attributes.key?(:'metricCompartmentIdInSubtree') && attributes.key?(:'metric_compartment_id_in_subtree')

      self.metric_compartment_id_in_subtree = attributes[:'metric_compartment_id_in_subtree'] unless attributes[:'metric_compartment_id_in_subtree'].nil?

      self.namespace = attributes[:'namespace'] if attributes[:'namespace']

      self.resource_group = attributes[:'resourceGroup'] if attributes[:'resourceGroup']

      raise 'You cannot provide both :resourceGroup and :resource_group' if attributes.key?(:'resourceGroup') && attributes.key?(:'resource_group')

      self.resource_group = attributes[:'resource_group'] if attributes[:'resource_group']

      self.query = attributes[:'query'] if attributes[:'query']

      self.resolution = attributes[:'resolution'] if attributes[:'resolution']

      self.pending_duration = attributes[:'pendingDuration'] if attributes[:'pendingDuration']

      raise 'You cannot provide both :pendingDuration and :pending_duration' if attributes.key?(:'pendingDuration') && attributes.key?(:'pending_duration')

      self.pending_duration = attributes[:'pending_duration'] if attributes[:'pending_duration']

      self.severity = attributes[:'severity'] if attributes[:'severity']

      self.body = attributes[:'body'] if attributes[:'body']

      self.message_format = attributes[:'messageFormat'] if attributes[:'messageFormat']
      self.message_format = "RAW" if message_format.nil? && !attributes.key?(:'messageFormat') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :messageFormat and :message_format' if attributes.key?(:'messageFormat') && attributes.key?(:'message_format')

      self.message_format = attributes[:'message_format'] if attributes[:'message_format']
      self.message_format = "RAW" if message_format.nil? && !attributes.key?(:'messageFormat') && !attributes.key?(:'message_format') # rubocop:disable Style/StringLiterals

      self.destinations = attributes[:'destinations'] if attributes[:'destinations']

      self.repeat_notification_duration = attributes[:'repeatNotificationDuration'] if attributes[:'repeatNotificationDuration']

      raise 'You cannot provide both :repeatNotificationDuration and :repeat_notification_duration' if attributes.key?(:'repeatNotificationDuration') && attributes.key?(:'repeat_notification_duration')

      self.repeat_notification_duration = attributes[:'repeat_notification_duration'] if attributes[:'repeat_notification_duration']

      self.suppression = attributes[:'suppression'] if attributes[:'suppression']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
    # @param [Object] message_format Object to be assigned
    def message_format=(message_format)
      # rubocop:disable Style/ConditionalAssignment
      if message_format && !MESSAGE_FORMAT_ENUM.include?(message_format)
        OCI.logger.debug("Unknown value for 'message_format' [" + message_format + "]. Mapping to 'MESSAGE_FORMAT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @message_format = MESSAGE_FORMAT_UNKNOWN_ENUM_VALUE
      else
        @message_format = message_format
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
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        metric_compartment_id == other.metric_compartment_id &&
        metric_compartment_id_in_subtree == other.metric_compartment_id_in_subtree &&
        namespace == other.namespace &&
        resource_group == other.resource_group &&
        query == other.query &&
        resolution == other.resolution &&
        pending_duration == other.pending_duration &&
        severity == other.severity &&
        body == other.body &&
        message_format == other.message_format &&
        destinations == other.destinations &&
        repeat_notification_duration == other.repeat_notification_duration &&
        suppression == other.suppression &&
        is_enabled == other.is_enabled &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        lifecycle_state == other.lifecycle_state &&
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
      [id, display_name, compartment_id, metric_compartment_id, metric_compartment_id_in_subtree, namespace, resource_group, query, resolution, pending_duration, severity, body, message_format, destinations, repeat_notification_duration, suppression, is_enabled, freeform_tags, defined_tags, lifecycle_state, time_created, time_updated].hash
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
