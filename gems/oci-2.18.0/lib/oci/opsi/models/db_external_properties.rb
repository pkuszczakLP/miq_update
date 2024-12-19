# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'database_configuration_metric_group'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Configuration parameters defined for external databases.
  class Opsi::Models::DBExternalProperties < Opsi::Models::DatabaseConfigurationMetricGroup
    # Name of the database.
    # @return [String]
    attr_accessor :name

    # Archive log mode.
    # @return [String]
    attr_accessor :log_mode

    # Indicates if it is a CDB or not. This would be 'yes' or 'no'.
    # @return [String]
    attr_accessor :cdb

    # Open mode information.
    # @return [String]
    attr_accessor :open_mode

    # Current role of the database.
    # @return [String]
    attr_accessor :database_role

    # Data protection policy.
    # @return [String]
    attr_accessor :guard_status

    # Platform name of the database, OS with architecture.
    # @return [String]
    attr_accessor :platform_name

    # Type of control file.
    # @return [String]
    attr_accessor :control_file_type

    # Indicates whether switchover is allowed.
    # @return [String]
    attr_accessor :switchover_status

    # Creation time.
    # @return [DateTime]
    attr_accessor :created

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'metricName',
        'time_collected': :'timeCollected',
        'name': :'name',
        'log_mode': :'logMode',
        'cdb': :'cdb',
        'open_mode': :'openMode',
        'database_role': :'databaseRole',
        'guard_status': :'guardStatus',
        'platform_name': :'platformName',
        'control_file_type': :'controlFileType',
        'switchover_status': :'switchoverStatus',
        'created': :'created'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'metric_name': :'String',
        'time_collected': :'DateTime',
        'name': :'String',
        'log_mode': :'String',
        'cdb': :'String',
        'open_mode': :'String',
        'database_role': :'String',
        'guard_status': :'String',
        'platform_name': :'String',
        'control_file_type': :'String',
        'switchover_status': :'String',
        'created': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [DateTime] :time_collected The value to assign to the {OCI::Opsi::Models::DatabaseConfigurationMetricGroup#time_collected #time_collected} proprety
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :log_mode The value to assign to the {#log_mode} property
    # @option attributes [String] :cdb The value to assign to the {#cdb} property
    # @option attributes [String] :open_mode The value to assign to the {#open_mode} property
    # @option attributes [String] :database_role The value to assign to the {#database_role} property
    # @option attributes [String] :guard_status The value to assign to the {#guard_status} property
    # @option attributes [String] :platform_name The value to assign to the {#platform_name} property
    # @option attributes [String] :control_file_type The value to assign to the {#control_file_type} property
    # @option attributes [String] :switchover_status The value to assign to the {#switchover_status} property
    # @option attributes [DateTime] :created The value to assign to the {#created} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['metricName'] = 'DB_EXTERNAL_PROPERTIES'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.log_mode = attributes[:'logMode'] if attributes[:'logMode']

      raise 'You cannot provide both :logMode and :log_mode' if attributes.key?(:'logMode') && attributes.key?(:'log_mode')

      self.log_mode = attributes[:'log_mode'] if attributes[:'log_mode']

      self.cdb = attributes[:'cdb'] if attributes[:'cdb']

      self.open_mode = attributes[:'openMode'] if attributes[:'openMode']

      raise 'You cannot provide both :openMode and :open_mode' if attributes.key?(:'openMode') && attributes.key?(:'open_mode')

      self.open_mode = attributes[:'open_mode'] if attributes[:'open_mode']

      self.database_role = attributes[:'databaseRole'] if attributes[:'databaseRole']

      raise 'You cannot provide both :databaseRole and :database_role' if attributes.key?(:'databaseRole') && attributes.key?(:'database_role')

      self.database_role = attributes[:'database_role'] if attributes[:'database_role']

      self.guard_status = attributes[:'guardStatus'] if attributes[:'guardStatus']

      raise 'You cannot provide both :guardStatus and :guard_status' if attributes.key?(:'guardStatus') && attributes.key?(:'guard_status')

      self.guard_status = attributes[:'guard_status'] if attributes[:'guard_status']

      self.platform_name = attributes[:'platformName'] if attributes[:'platformName']

      raise 'You cannot provide both :platformName and :platform_name' if attributes.key?(:'platformName') && attributes.key?(:'platform_name')

      self.platform_name = attributes[:'platform_name'] if attributes[:'platform_name']

      self.control_file_type = attributes[:'controlFileType'] if attributes[:'controlFileType']

      raise 'You cannot provide both :controlFileType and :control_file_type' if attributes.key?(:'controlFileType') && attributes.key?(:'control_file_type')

      self.control_file_type = attributes[:'control_file_type'] if attributes[:'control_file_type']

      self.switchover_status = attributes[:'switchoverStatus'] if attributes[:'switchoverStatus']

      raise 'You cannot provide both :switchoverStatus and :switchover_status' if attributes.key?(:'switchoverStatus') && attributes.key?(:'switchover_status')

      self.switchover_status = attributes[:'switchover_status'] if attributes[:'switchover_status']

      self.created = attributes[:'created'] if attributes[:'created']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        metric_name == other.metric_name &&
        time_collected == other.time_collected &&
        name == other.name &&
        log_mode == other.log_mode &&
        cdb == other.cdb &&
        open_mode == other.open_mode &&
        database_role == other.database_role &&
        guard_status == other.guard_status &&
        platform_name == other.platform_name &&
        control_file_type == other.control_file_type &&
        switchover_status == other.switchover_status &&
        created == other.created
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
      [metric_name, time_collected, name, log_mode, cdb, open_mode, database_role, guard_status, platform_name, control_file_type, switchover_status, created].hash
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
