# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'db_system_source'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # DB System OCID to perform a point in time recovery to the current point in time.
  #
  # DB System OCID and recovery point to perform a point in time recovery to the
  # specified recovery point.
  #
  class Mysql::Models::DbSystemSourceFromPitr < Mysql::Models::DbSystemSource
    # **[Required]** The OCID of the DB System from which a backup shall be selected to be
    # restored when creating the new DB System. Use this together with
    # recovery point to perform a point in time recovery operation.
    #
    # @return [String]
    attr_accessor :db_system_id

    # The date and time, as per RFC 3339, of the change up to which the
    # new DB System shall be restored to, using a backup and logs from the
    # original DB System. In case no point in time is specified, then this
    # new DB System shall be restored up to the latest change recorded for
    # the original DB System.
    #
    # @return [DateTime]
    attr_accessor :recovery_point

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'source_type': :'sourceType',
        'db_system_id': :'dbSystemId',
        'recovery_point': :'recoveryPoint'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'source_type': :'String',
        'db_system_id': :'String',
        'recovery_point': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :db_system_id The value to assign to the {#db_system_id} property
    # @option attributes [DateTime] :recovery_point The value to assign to the {#recovery_point} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['sourceType'] = 'PITR'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.db_system_id = attributes[:'dbSystemId'] if attributes[:'dbSystemId']

      raise 'You cannot provide both :dbSystemId and :db_system_id' if attributes.key?(:'dbSystemId') && attributes.key?(:'db_system_id')

      self.db_system_id = attributes[:'db_system_id'] if attributes[:'db_system_id']

      self.recovery_point = attributes[:'recoveryPoint'] if attributes[:'recoveryPoint']

      raise 'You cannot provide both :recoveryPoint and :recovery_point' if attributes.key?(:'recoveryPoint') && attributes.key?(:'recovery_point')

      self.recovery_point = attributes[:'recovery_point'] if attributes[:'recovery_point']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        source_type == other.source_type &&
        db_system_id == other.db_system_id &&
        recovery_point == other.recovery_point
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
      [source_type, db_system_id, recovery_point].hash
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
