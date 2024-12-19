# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # (For tenancies that support identity domains) Identity domain replication states.
  class Identity::Models::DomainReplication
    # **[Required]** The version number indicating the value of kievTxnId, starting from which the identity domain replication events need to be returned.
    # @return [Float]
    attr_accessor :opc_water_mark

    # **[Required]** A custom value defining the order of records with the same kievTxnId.
    # @return [Float]
    attr_accessor :txn_seq_number

    # **[Required]** The identity domain's replication state.
    # @return [Array<OCI::Identity::Models::DomainReplicationStates>]
    attr_accessor :domain_replication_states

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'opc_water_mark': :'opcWaterMark',
        'txn_seq_number': :'txnSeqNumber',
        'domain_replication_states': :'domainReplicationStates'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'opc_water_mark': :'Float',
        'txn_seq_number': :'Float',
        'domain_replication_states': :'Array<OCI::Identity::Models::DomainReplicationStates>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :opc_water_mark The value to assign to the {#opc_water_mark} property
    # @option attributes [Float] :txn_seq_number The value to assign to the {#txn_seq_number} property
    # @option attributes [Array<OCI::Identity::Models::DomainReplicationStates>] :domain_replication_states The value to assign to the {#domain_replication_states} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.opc_water_mark = attributes[:'opcWaterMark'] if attributes[:'opcWaterMark']

      raise 'You cannot provide both :opcWaterMark and :opc_water_mark' if attributes.key?(:'opcWaterMark') && attributes.key?(:'opc_water_mark')

      self.opc_water_mark = attributes[:'opc_water_mark'] if attributes[:'opc_water_mark']

      self.txn_seq_number = attributes[:'txnSeqNumber'] if attributes[:'txnSeqNumber']

      raise 'You cannot provide both :txnSeqNumber and :txn_seq_number' if attributes.key?(:'txnSeqNumber') && attributes.key?(:'txn_seq_number')

      self.txn_seq_number = attributes[:'txn_seq_number'] if attributes[:'txn_seq_number']

      self.domain_replication_states = attributes[:'domainReplicationStates'] if attributes[:'domainReplicationStates']

      raise 'You cannot provide both :domainReplicationStates and :domain_replication_states' if attributes.key?(:'domainReplicationStates') && attributes.key?(:'domain_replication_states')

      self.domain_replication_states = attributes[:'domain_replication_states'] if attributes[:'domain_replication_states']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        opc_water_mark == other.opc_water_mark &&
        txn_seq_number == other.txn_seq_number &&
        domain_replication_states == other.domain_replication_states
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
      [opc_water_mark, txn_seq_number, domain_replication_states].hash
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
