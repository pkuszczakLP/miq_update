# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A resource created or operated on by a work request.
  class Oda::Models::WorkRequestResource
    RESOURCE_ACTION_ENUM = [
      RESOURCE_ACTION_CREATE = 'CREATE'.freeze,
      RESOURCE_ACTION_DELETE = 'DELETE'.freeze,
      RESOURCE_ACTION_PURGE = 'PURGE'.freeze,
      RESOURCE_ACTION_RECOVER = 'RECOVER'.freeze,
      RESOURCE_ACTION_STOP = 'STOP'.freeze,
      RESOURCE_ACTION_START = 'START'.freeze,
      RESOURCE_ACTION_CHANGE_COMPARTMENT = 'CHANGE_COMPARTMENT'.freeze,
      RESOURCE_ACTION_CHANGE_CUST_ENC_KEY = 'CHANGE_CUST_ENC_KEY'.freeze,
      RESOURCE_ACTION_DEACT_CUST_ENC_KEY = 'DEACT_CUST_ENC_KEY'.freeze,
      RESOURCE_ACTION_CREATE_ASSOCIATION = 'CREATE_ASSOCIATION'.freeze,
      RESOURCE_ACTION_DELETE_ASSOCIATION = 'DELETE_ASSOCIATION'.freeze,
      RESOURCE_ACTION_UPDATE_ENTITLEMENTS_FOR_CACCT = 'UPDATE_ENTITLEMENTS_FOR_CACCT'.freeze,
      RESOURCE_ACTION_CREATE_ODA_INSTANCE_ATTACHMENT = 'CREATE_ODA_INSTANCE_ATTACHMENT'.freeze,
      RESOURCE_ACTION_UPDATE_ODA_INSTANCE_ATTACHMENT = 'UPDATE_ODA_INSTANCE_ATTACHMENT'.freeze,
      RESOURCE_ACTION_DELETE_ODA_INSTANCE_ATTACHMENT = 'DELETE_ODA_INSTANCE_ATTACHMENT'.freeze,
      RESOURCE_ACTION_CREATE_IMPORTED_PACKAGE = 'CREATE_IMPORTED_PACKAGE'.freeze,
      RESOURCE_ACTION_UPDATE_IMPORTED_PACKAGE = 'UPDATE_IMPORTED_PACKAGE'.freeze,
      RESOURCE_ACTION_DELETE_IMPORTED_PACKAGE = 'DELETE_IMPORTED_PACKAGE'.freeze,
      RESOURCE_ACTION_EXPORT = 'EXPORT'.freeze,
      RESOURCE_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_FAILED = 'FAILED'.freeze,
      STATUS_CANCELING = 'CANCELING'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The action to take against the Digital Assistant instance.
    # @return [String]
    attr_reader :resource_action

    # **[Required]** The resource type that the work request affects.
    # @return [String]
    attr_accessor :resource_type

    # **[Required]** The identifier of the Digital Assistant instance that is the subject of the request.
    # @return [String]
    attr_accessor :resource_id

    # **[Required]** The current state of the work request. The `SUCCEEDED`, `FAILED`, AND `CANCELED` states
    # correspond to the action being performed.
    #
    # @return [String]
    attr_reader :status

    # Short message providing more detail for the current status. For example, if an operation fails
    # this may include information about the reason for the failure and a possible resolution.
    #
    # @return [String]
    attr_accessor :status_message

    # The URI path that the user can do a GET on to access the resource metadata.
    # @return [String]
    attr_accessor :resource_uri

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'resource_action': :'resourceAction',
        'resource_type': :'resourceType',
        'resource_id': :'resourceId',
        'status': :'status',
        'status_message': :'statusMessage',
        'resource_uri': :'resourceUri'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'resource_action': :'String',
        'resource_type': :'String',
        'resource_id': :'String',
        'status': :'String',
        'status_message': :'String',
        'resource_uri': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :resource_action The value to assign to the {#resource_action} property
    # @option attributes [String] :resource_type The value to assign to the {#resource_type} property
    # @option attributes [String] :resource_id The value to assign to the {#resource_id} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :status_message The value to assign to the {#status_message} property
    # @option attributes [String] :resource_uri The value to assign to the {#resource_uri} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.resource_action = attributes[:'resourceAction'] if attributes[:'resourceAction']

      raise 'You cannot provide both :resourceAction and :resource_action' if attributes.key?(:'resourceAction') && attributes.key?(:'resource_action')

      self.resource_action = attributes[:'resource_action'] if attributes[:'resource_action']

      self.resource_type = attributes[:'resourceType'] if attributes[:'resourceType']

      raise 'You cannot provide both :resourceType and :resource_type' if attributes.key?(:'resourceType') && attributes.key?(:'resource_type')

      self.resource_type = attributes[:'resource_type'] if attributes[:'resource_type']

      self.resource_id = attributes[:'resourceId'] if attributes[:'resourceId']

      raise 'You cannot provide both :resourceId and :resource_id' if attributes.key?(:'resourceId') && attributes.key?(:'resource_id')

      self.resource_id = attributes[:'resource_id'] if attributes[:'resource_id']

      self.status = attributes[:'status'] if attributes[:'status']

      self.status_message = attributes[:'statusMessage'] if attributes[:'statusMessage']

      raise 'You cannot provide both :statusMessage and :status_message' if attributes.key?(:'statusMessage') && attributes.key?(:'status_message')

      self.status_message = attributes[:'status_message'] if attributes[:'status_message']

      self.resource_uri = attributes[:'resourceUri'] if attributes[:'resourceUri']

      raise 'You cannot provide both :resourceUri and :resource_uri' if attributes.key?(:'resourceUri') && attributes.key?(:'resource_uri')

      self.resource_uri = attributes[:'resource_uri'] if attributes[:'resource_uri']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] resource_action Object to be assigned
    def resource_action=(resource_action)
      # rubocop:disable Style/ConditionalAssignment
      if resource_action && !RESOURCE_ACTION_ENUM.include?(resource_action)
        OCI.logger.debug("Unknown value for 'resource_action' [" + resource_action + "]. Mapping to 'RESOURCE_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @resource_action = RESOURCE_ACTION_UNKNOWN_ENUM_VALUE
      else
        @resource_action = resource_action
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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        resource_action == other.resource_action &&
        resource_type == other.resource_type &&
        resource_id == other.resource_id &&
        status == other.status &&
        status_message == other.status_message &&
        resource_uri == other.resource_uri
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
      [resource_action, resource_type, resource_id, status, status_message, resource_uri].hash
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
