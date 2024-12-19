# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Detailed information about a service environment.
  #
  # **Note:** Service URL formats may vary from the provided example.
  #
  class ServiceManagerProxy::Models::ServiceEnvironment
    STATUS_ENUM = [
      STATUS_INITIALIZED = 'INITIALIZED'.freeze,
      STATUS_BEGIN_ACTIVATION = 'BEGIN_ACTIVATION'.freeze,
      STATUS_ACTIVE = 'ACTIVE'.freeze,
      STATUS_BEGIN_SOFT_TERMINATION = 'BEGIN_SOFT_TERMINATION'.freeze,
      STATUS_SOFT_TERMINATED = 'SOFT_TERMINATED'.freeze,
      STATUS_BEGIN_TERMINATION = 'BEGIN_TERMINATION'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_TERMINATED = 'TERMINATED'.freeze,
      STATUS_BEGIN_DISABLING = 'BEGIN_DISABLING'.freeze,
      STATUS_BEGIN_ENABLING = 'BEGIN_ENABLING'.freeze,
      STATUS_BEGIN_MIGRATION = 'BEGIN_MIGRATION'.freeze,
      STATUS_DISABLED = 'DISABLED'.freeze,
      STATUS_BEGIN_SUSPENSION = 'BEGIN_SUSPENSION'.freeze,
      STATUS_BEGIN_RESUMPTION = 'BEGIN_RESUMPTION'.freeze,
      STATUS_SUSPENDED = 'SUSPENDED'.freeze,
      STATUS_BEGIN_LOCK_RELOCATION = 'BEGIN_LOCK_RELOCATION'.freeze,
      STATUS_LOCKED_RELOCATION = 'LOCKED_RELOCATION'.freeze,
      STATUS_BEGIN_RELOCATION = 'BEGIN_RELOCATION'.freeze,
      STATUS_RELOCATED = 'RELOCATED'.freeze,
      STATUS_BEGIN_UNLOCK_RELOCATION = 'BEGIN_UNLOCK_RELOCATION'.freeze,
      STATUS_UNLOCKED_RELOCATION = 'UNLOCKED_RELOCATION'.freeze,
      STATUS_FAILED_LOCK_RELOCATION = 'FAILED_LOCK_RELOCATION'.freeze,
      STATUS_FAILED_ACTIVATION = 'FAILED_ACTIVATION'.freeze,
      STATUS_FAILED_MIGRATION = 'FAILED_MIGRATION'.freeze,
      STATUS_ACCESS_DISABLED = 'ACCESS_DISABLED'.freeze,
      STATUS_BEGIN_DISABLING_ACCESS = 'BEGIN_DISABLING_ACCESS'.freeze,
      STATUS_BEGIN_ENABLING_ACCESS = 'BEGIN_ENABLING_ACCESS'.freeze,
      STATUS_TRA_UNKNOWN = 'TRA_UNKNOWN'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unqiue identifier for the entitlement related to the environment.
    #
    # **Note:** Not an [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @return [String]
    attr_accessor :id

    # **[Required]** The unique subscription ID associated with the service environment ID.
    #
    # **Note:** Not an [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    #
    # @return [String]
    attr_accessor :subscription_id

    # **[Required]** Status of the entitlement registration for the service.
    # @return [String]
    attr_reader :status

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) for the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # This attribute is required.
    # @return [OCI::ServiceManagerProxy::Models::ServiceDefinition]
    attr_accessor :service_definition

    # The URL for the console.
    # @return [String]
    attr_accessor :console_url

    # Array of service environment end points.
    # @return [Array<OCI::ServiceManagerProxy::Models::ServiceEnvironmentEndPointOverview>]
    attr_accessor :service_environment_endpoints

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'subscription_id': :'subscriptionId',
        'status': :'status',
        'compartment_id': :'compartmentId',
        'service_definition': :'serviceDefinition',
        'console_url': :'consoleUrl',
        'service_environment_endpoints': :'serviceEnvironmentEndpoints'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'subscription_id': :'String',
        'status': :'String',
        'compartment_id': :'String',
        'service_definition': :'OCI::ServiceManagerProxy::Models::ServiceDefinition',
        'console_url': :'String',
        'service_environment_endpoints': :'Array<OCI::ServiceManagerProxy::Models::ServiceEnvironmentEndPointOverview>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :subscription_id The value to assign to the {#subscription_id} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [OCI::ServiceManagerProxy::Models::ServiceDefinition] :service_definition The value to assign to the {#service_definition} property
    # @option attributes [String] :console_url The value to assign to the {#console_url} property
    # @option attributes [Array<OCI::ServiceManagerProxy::Models::ServiceEnvironmentEndPointOverview>] :service_environment_endpoints The value to assign to the {#service_environment_endpoints} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.subscription_id = attributes[:'subscriptionId'] if attributes[:'subscriptionId']

      raise 'You cannot provide both :subscriptionId and :subscription_id' if attributes.key?(:'subscriptionId') && attributes.key?(:'subscription_id')

      self.subscription_id = attributes[:'subscription_id'] if attributes[:'subscription_id']

      self.status = attributes[:'status'] if attributes[:'status']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.service_definition = attributes[:'serviceDefinition'] if attributes[:'serviceDefinition']

      raise 'You cannot provide both :serviceDefinition and :service_definition' if attributes.key?(:'serviceDefinition') && attributes.key?(:'service_definition')

      self.service_definition = attributes[:'service_definition'] if attributes[:'service_definition']

      self.console_url = attributes[:'consoleUrl'] if attributes[:'consoleUrl']

      raise 'You cannot provide both :consoleUrl and :console_url' if attributes.key?(:'consoleUrl') && attributes.key?(:'console_url')

      self.console_url = attributes[:'console_url'] if attributes[:'console_url']

      self.service_environment_endpoints = attributes[:'serviceEnvironmentEndpoints'] if attributes[:'serviceEnvironmentEndpoints']

      raise 'You cannot provide both :serviceEnvironmentEndpoints and :service_environment_endpoints' if attributes.key?(:'serviceEnvironmentEndpoints') && attributes.key?(:'service_environment_endpoints')

      self.service_environment_endpoints = attributes[:'service_environment_endpoints'] if attributes[:'service_environment_endpoints']
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
        id == other.id &&
        subscription_id == other.subscription_id &&
        status == other.status &&
        compartment_id == other.compartment_id &&
        service_definition == other.service_definition &&
        console_url == other.console_url &&
        service_environment_endpoints == other.service_environment_endpoints
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
      [id, subscription_id, status, compartment_id, service_definition, console_url, service_environment_endpoints].hash
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
