# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Defines the traffic configuration that leaves the traffic node.
  class VnMonitoring::Models::EgressTrafficSpec
    # **[Required]** The IP protocol to use for the traffic path analysis.
    # @return [Integer]
    attr_accessor :protocol

    # **[Required]** The IPv4 address of the source node.
    # @return [String]
    attr_accessor :source_address

    # **[Required]** The IPv4 address of the destination node.
    # @return [String]
    attr_accessor :destination_address

    # @return [OCI::VnMonitoring::Models::TrafficProtocolParameters]
    attr_accessor :traffic_protocol_parameters

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'protocol': :'protocol',
        'source_address': :'sourceAddress',
        'destination_address': :'destinationAddress',
        'traffic_protocol_parameters': :'trafficProtocolParameters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'protocol': :'Integer',
        'source_address': :'String',
        'destination_address': :'String',
        'traffic_protocol_parameters': :'OCI::VnMonitoring::Models::TrafficProtocolParameters'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :source_address The value to assign to the {#source_address} property
    # @option attributes [String] :destination_address The value to assign to the {#destination_address} property
    # @option attributes [OCI::VnMonitoring::Models::TrafficProtocolParameters] :traffic_protocol_parameters The value to assign to the {#traffic_protocol_parameters} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.source_address = attributes[:'sourceAddress'] if attributes[:'sourceAddress']

      raise 'You cannot provide both :sourceAddress and :source_address' if attributes.key?(:'sourceAddress') && attributes.key?(:'source_address')

      self.source_address = attributes[:'source_address'] if attributes[:'source_address']

      self.destination_address = attributes[:'destinationAddress'] if attributes[:'destinationAddress']

      raise 'You cannot provide both :destinationAddress and :destination_address' if attributes.key?(:'destinationAddress') && attributes.key?(:'destination_address')

      self.destination_address = attributes[:'destination_address'] if attributes[:'destination_address']

      self.traffic_protocol_parameters = attributes[:'trafficProtocolParameters'] if attributes[:'trafficProtocolParameters']

      raise 'You cannot provide both :trafficProtocolParameters and :traffic_protocol_parameters' if attributes.key?(:'trafficProtocolParameters') && attributes.key?(:'traffic_protocol_parameters')

      self.traffic_protocol_parameters = attributes[:'traffic_protocol_parameters'] if attributes[:'traffic_protocol_parameters']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        protocol == other.protocol &&
        source_address == other.source_address &&
        destination_address == other.destination_address &&
        traffic_protocol_parameters == other.traffic_protocol_parameters
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
      [protocol, source_address, destination_address, traffic_protocol_parameters].hash
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
