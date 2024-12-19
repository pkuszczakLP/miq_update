# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The LCM work request for a JVM installation site.
  class Jms::Models::WorkItemSummary
    STATUS_ENUM = [
      STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      STATUS_CANCELING = 'CANCELING'.freeze,
      STATUS_CANCELED = 'CANCELED'.freeze,
      STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      STATUS_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      STATUS_RETRYING = 'RETRYING'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique ID of ths work item.
    # @return [String]
    attr_accessor :id

    # **[Required]** The OCID of the work request created this work item.
    # @return [String]
    attr_accessor :work_request_id

    # This attribute is required.
    # @return [OCI::Jms::Models::InstallationSite]
    attr_accessor :installation_site

    # **[Required]** The status of the work item.
    # @return [String]
    attr_reader :status

    # **[Required]** Number of times this work item is retried.
    # @return [Integer]
    attr_accessor :retry_count

    # The date and time the work item was last updated. (formatted according to [RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)).
    #
    # @return [DateTime]
    attr_accessor :time_last_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'work_request_id': :'workRequestId',
        'installation_site': :'installationSite',
        'status': :'status',
        'retry_count': :'retryCount',
        'time_last_updated': :'timeLastUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'work_request_id': :'String',
        'installation_site': :'OCI::Jms::Models::InstallationSite',
        'status': :'String',
        'retry_count': :'Integer',
        'time_last_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :work_request_id The value to assign to the {#work_request_id} property
    # @option attributes [OCI::Jms::Models::InstallationSite] :installation_site The value to assign to the {#installation_site} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [Integer] :retry_count The value to assign to the {#retry_count} property
    # @option attributes [DateTime] :time_last_updated The value to assign to the {#time_last_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.work_request_id = attributes[:'workRequestId'] if attributes[:'workRequestId']

      raise 'You cannot provide both :workRequestId and :work_request_id' if attributes.key?(:'workRequestId') && attributes.key?(:'work_request_id')

      self.work_request_id = attributes[:'work_request_id'] if attributes[:'work_request_id']

      self.installation_site = attributes[:'installationSite'] if attributes[:'installationSite']

      raise 'You cannot provide both :installationSite and :installation_site' if attributes.key?(:'installationSite') && attributes.key?(:'installation_site')

      self.installation_site = attributes[:'installation_site'] if attributes[:'installation_site']

      self.status = attributes[:'status'] if attributes[:'status']

      self.retry_count = attributes[:'retryCount'] if attributes[:'retryCount']

      raise 'You cannot provide both :retryCount and :retry_count' if attributes.key?(:'retryCount') && attributes.key?(:'retry_count')

      self.retry_count = attributes[:'retry_count'] if attributes[:'retry_count']

      self.time_last_updated = attributes[:'timeLastUpdated'] if attributes[:'timeLastUpdated']

      raise 'You cannot provide both :timeLastUpdated and :time_last_updated' if attributes.key?(:'timeLastUpdated') && attributes.key?(:'time_last_updated')

      self.time_last_updated = attributes[:'time_last_updated'] if attributes[:'time_last_updated']
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
        work_request_id == other.work_request_id &&
        installation_site == other.installation_site &&
        status == other.status &&
        retry_count == other.retry_count &&
        time_last_updated == other.time_last_updated
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
      [id, work_request_id, installation_site, status, retry_count, time_last_updated].hash
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