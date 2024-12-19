# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A work request summary
  class OsManagement::Models::WorkRequestSummary
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_INSTALL = 'INSTALL'.freeze,
      OPERATION_TYPE_UPDATE = 'UPDATE'.freeze,
      OPERATION_TYPE_REMOVE = 'REMOVE'.freeze,
      OPERATION_TYPE_UPDATEALL = 'UPDATEALL'.freeze,
      OPERATION_TYPE_ENABLEMODULESTREAM = 'ENABLEMODULESTREAM'.freeze,
      OPERATION_TYPE_DISABLEMODULESTREAM = 'DISABLEMODULESTREAM'.freeze,
      OPERATION_TYPE_SWITCHMODULESTREAM = 'SWITCHMODULESTREAM'.freeze,
      OPERATION_TYPE_INSTALLMODULESTREAMPROFILE = 'INSTALLMODULESTREAMPROFILE'.freeze,
      OPERATION_TYPE_REMOVEMODULESTREAMPROFILE = 'REMOVEMODULESTREAMPROFILE'.freeze,
      OPERATION_TYPE_COMPOUND = 'COMPOUND'.freeze,
      OPERATION_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_CANCELLING = 'CANCELLING'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    OS_FAMILY_ENUM = [
      OS_FAMILY_LINUX = 'LINUX'.freeze,
      OS_FAMILY_WINDOWS = 'WINDOWS'.freeze,
      OS_FAMILY_ALL = 'ALL'.freeze,
      OS_FAMILY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** the type of operation this Work Request performs
    # @return [String]
    attr_reader :operation_type

    # **[Required]** status of current work request.
    # @return [String]
    attr_reader :status

    # **[Required]** The id of the work request.
    # @return [String]
    attr_accessor :id

    # **[Required]** The ocid of the compartment that contains the work request. Work requests should be scoped to
    # the same compartment as the resource the work request affects. If the work request affects multiple resources,
    # and those resources are not in the same compartment, it is up to the service team to pick the primary
    # resource whose compartment should be used
    #
    # @return [String]
    attr_accessor :compartment_id

    # Description of the type of work.
    # @return [String]
    attr_accessor :description

    # A progress or error message, if there is any.
    # @return [String]
    attr_accessor :message

    # Percentage of the request completed.
    # @return [Float]
    attr_accessor :percent_complete

    # **[Required]** The date and time the request was created, as described in
    # [RFC 3339](https://tools.ietf.org/rfc/rfc3339), section 14.29.
    #
    # @return [DateTime]
    attr_accessor :time_accepted

    # The Operating System type of the managed instance.
    # @return [String]
    attr_reader :os_family

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_type': :'operationType',
        'status': :'status',
        'id': :'id',
        'compartment_id': :'compartmentId',
        'description': :'description',
        'message': :'message',
        'percent_complete': :'percentComplete',
        'time_accepted': :'timeAccepted',
        'os_family': :'osFamily'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'operation_type': :'String',
        'status': :'String',
        'id': :'String',
        'compartment_id': :'String',
        'description': :'String',
        'message': :'String',
        'percent_complete': :'Float',
        'time_accepted': :'DateTime',
        'os_family': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :operation_type The value to assign to the {#operation_type} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :message The value to assign to the {#message} property
    # @option attributes [Float] :percent_complete The value to assign to the {#percent_complete} property
    # @option attributes [DateTime] :time_accepted The value to assign to the {#time_accepted} property
    # @option attributes [String] :os_family The value to assign to the {#os_family} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.operation_type = attributes[:'operationType'] if attributes[:'operationType']

      raise 'You cannot provide both :operationType and :operation_type' if attributes.key?(:'operationType') && attributes.key?(:'operation_type')

      self.operation_type = attributes[:'operation_type'] if attributes[:'operation_type']

      self.status = attributes[:'status'] if attributes[:'status']

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.description = attributes[:'description'] if attributes[:'description']

      self.message = attributes[:'message'] if attributes[:'message']

      self.percent_complete = attributes[:'percentComplete'] if attributes[:'percentComplete']

      raise 'You cannot provide both :percentComplete and :percent_complete' if attributes.key?(:'percentComplete') && attributes.key?(:'percent_complete')

      self.percent_complete = attributes[:'percent_complete'] if attributes[:'percent_complete']

      self.time_accepted = attributes[:'timeAccepted'] if attributes[:'timeAccepted']

      raise 'You cannot provide both :timeAccepted and :time_accepted' if attributes.key?(:'timeAccepted') && attributes.key?(:'time_accepted')

      self.time_accepted = attributes[:'time_accepted'] if attributes[:'time_accepted']

      self.os_family = attributes[:'osFamily'] if attributes[:'osFamily']

      raise 'You cannot provide both :osFamily and :os_family' if attributes.key?(:'osFamily') && attributes.key?(:'os_family')

      self.os_family = attributes[:'os_family'] if attributes[:'os_family']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] operation_type Object to be assigned
    def operation_type=(operation_type)
      # rubocop:disable Style/ConditionalAssignment
      if operation_type && !OPERATION_TYPE_ENUM.include?(operation_type)
        OCI.logger.debug("Unknown value for 'operation_type' [" + operation_type + "]. Mapping to 'OPERATION_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @operation_type = OPERATION_TYPE_UNKNOWN_ENUM_VALUE
      else
        @operation_type = operation_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
    # @param [Object] os_family Object to be assigned
    def os_family=(os_family)
      # rubocop:disable Style/ConditionalAssignment
      if os_family && !OS_FAMILY_ENUM.include?(os_family)
        OCI.logger.debug("Unknown value for 'os_family' [" + os_family + "]. Mapping to 'OS_FAMILY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @os_family = OS_FAMILY_UNKNOWN_ENUM_VALUE
      else
        @os_family = os_family
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        operation_type == other.operation_type &&
        status == other.status &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        description == other.description &&
        message == other.message &&
        percent_complete == other.percent_complete &&
        time_accepted == other.time_accepted &&
        os_family == other.os_family
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
      [operation_type, status, id, compartment_id, description, message, percent_complete, time_accepted, os_family].hash
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
