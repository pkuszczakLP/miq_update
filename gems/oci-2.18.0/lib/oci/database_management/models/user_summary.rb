# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The summary of a specific User.
  class DatabaseManagement::Models::UserSummary
    STATUS_ENUM = [
      STATUS_OPEN = 'OPEN'.freeze,
      STATUS_EXPIRED = 'EXPIRED'.freeze,
      STATUS_EXPIRED_GRACE = 'EXPIRED_GRACE'.freeze,
      STATUS_LOCKED = 'LOCKED'.freeze,
      STATUS_LOCKED_TIMED = 'LOCKED_TIMED'.freeze,
      STATUS_EXPIRED_AND_LOCKED = 'EXPIRED_AND_LOCKED'.freeze,
      STATUS_EXPIRED_GRACE_AND_LOCKED = 'EXPIRED_GRACE_AND_LOCKED'.freeze,
      STATUS_EXPIRED_AND_LOCKED_TIMED = 'EXPIRED_AND_LOCKED_TIMED'.freeze,
      STATUS_EXPIRED_GRACE_AND_LOCKED_TIMED = 'EXPIRED_GRACE_AND_LOCKED_TIMED'.freeze,
      STATUS_OPEN_AND_IN_ROLLOVER = 'OPEN_AND_IN_ROLLOVER'.freeze,
      STATUS_EXPIRED_AND_IN_ROLLOVER = 'EXPIRED_AND_IN_ROLLOVER'.freeze,
      STATUS_LOCKED_AND_IN_ROLLOVER = 'LOCKED_AND_IN_ROLLOVER'.freeze,
      STATUS_EXPIRED_AND_LOCKED_AND_IN_ROLLOVER = 'EXPIRED_AND_LOCKED_AND_IN_ROLLOVER'.freeze,
      STATUS_LOCKED_TIMED_AND_IN_ROLLOVER = 'LOCKED_TIMED_AND_IN_ROLLOVER'.freeze,
      STATUS_EXPIRED_AND_LOCKED_TIMED_AND_IN_ROL = 'EXPIRED_AND_LOCKED_TIMED_AND_IN_ROL'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The name of the User.
    # @return [String]
    attr_accessor :name

    # **[Required]** The status of the user account.
    # @return [String]
    attr_reader :status

    # The date and time of the expiration of the user account.
    # @return [DateTime]
    attr_accessor :time_expiring

    # **[Required]** The default tablespace for data.
    # @return [String]
    attr_accessor :default_tablespace

    # **[Required]** The name of the default tablespace for temporary tables or the name of a tablespace group.
    # @return [String]
    attr_accessor :temp_tablespace

    # **[Required]** The date and time the user was created.
    # @return [DateTime]
    attr_accessor :time_created

    # The date the account was locked, if the status of the account is LOCKED.
    # @return [DateTime]
    attr_accessor :time_locked

    # **[Required]** The profile name of the user.
    # @return [String]
    attr_accessor :profile

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'status': :'status',
        'time_expiring': :'timeExpiring',
        'default_tablespace': :'defaultTablespace',
        'temp_tablespace': :'tempTablespace',
        'time_created': :'timeCreated',
        'time_locked': :'timeLocked',
        'profile': :'profile'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'status': :'String',
        'time_expiring': :'DateTime',
        'default_tablespace': :'String',
        'temp_tablespace': :'String',
        'time_created': :'DateTime',
        'time_locked': :'DateTime',
        'profile': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [DateTime] :time_expiring The value to assign to the {#time_expiring} property
    # @option attributes [String] :default_tablespace The value to assign to the {#default_tablespace} property
    # @option attributes [String] :temp_tablespace The value to assign to the {#temp_tablespace} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_locked The value to assign to the {#time_locked} property
    # @option attributes [String] :profile The value to assign to the {#profile} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.status = attributes[:'status'] if attributes[:'status']

      self.time_expiring = attributes[:'timeExpiring'] if attributes[:'timeExpiring']

      raise 'You cannot provide both :timeExpiring and :time_expiring' if attributes.key?(:'timeExpiring') && attributes.key?(:'time_expiring')

      self.time_expiring = attributes[:'time_expiring'] if attributes[:'time_expiring']

      self.default_tablespace = attributes[:'defaultTablespace'] if attributes[:'defaultTablespace']

      raise 'You cannot provide both :defaultTablespace and :default_tablespace' if attributes.key?(:'defaultTablespace') && attributes.key?(:'default_tablespace')

      self.default_tablespace = attributes[:'default_tablespace'] if attributes[:'default_tablespace']

      self.temp_tablespace = attributes[:'tempTablespace'] if attributes[:'tempTablespace']

      raise 'You cannot provide both :tempTablespace and :temp_tablespace' if attributes.key?(:'tempTablespace') && attributes.key?(:'temp_tablespace')

      self.temp_tablespace = attributes[:'temp_tablespace'] if attributes[:'temp_tablespace']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_locked = attributes[:'timeLocked'] if attributes[:'timeLocked']

      raise 'You cannot provide both :timeLocked and :time_locked' if attributes.key?(:'timeLocked') && attributes.key?(:'time_locked')

      self.time_locked = attributes[:'time_locked'] if attributes[:'time_locked']

      self.profile = attributes[:'profile'] if attributes[:'profile']
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
        name == other.name &&
        status == other.status &&
        time_expiring == other.time_expiring &&
        default_tablespace == other.default_tablespace &&
        temp_tablespace == other.temp_tablespace &&
        time_created == other.time_created &&
        time_locked == other.time_locked &&
        profile == other.profile
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
      [name, status, time_expiring, default_tablespace, temp_tablespace, time_created, time_locked, profile].hash
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
