# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'traffic_node'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Defines the configuration of a traffic node that is visible to the user.
  class VnMonitoring::Models::VisibleTrafficNode < VnMonitoring::Models::TrafficNode
    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the OCI entity that
    # represents the traffic node (Instance, GW, LB, etc.).
    #
    # @return [String]
    attr_accessor :entity_id

    # Describes how the traffic was transformed. For example, if an address is translated by a NAT GW,
    # the string will describe the translation: 'SNAT: 10.0.0.1->204.0.0.1'
    #
    # @return [String]
    attr_accessor :transformation_description

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'egress_traffic': :'egressTraffic',
        'next_hop_routing_action': :'nextHopRoutingAction',
        'egress_security_action': :'egressSecurityAction',
        'ingress_security_action': :'ingressSecurityAction',
        'entity_id': :'entityId',
        'transformation_description': :'transformationDescription'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'egress_traffic': :'OCI::VnMonitoring::Models::EgressTrafficSpec',
        'next_hop_routing_action': :'OCI::VnMonitoring::Models::RoutingAction',
        'egress_security_action': :'OCI::VnMonitoring::Models::SecurityAction',
        'ingress_security_action': :'OCI::VnMonitoring::Models::SecurityAction',
        'entity_id': :'String',
        'transformation_description': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [OCI::VnMonitoring::Models::EgressTrafficSpec] :egress_traffic The value to assign to the {OCI::VnMonitoring::Models::TrafficNode#egress_traffic #egress_traffic} proprety
    # @option attributes [OCI::VnMonitoring::Models::RoutingAction] :next_hop_routing_action The value to assign to the {OCI::VnMonitoring::Models::TrafficNode#next_hop_routing_action #next_hop_routing_action} proprety
    # @option attributes [OCI::VnMonitoring::Models::SecurityAction] :egress_security_action The value to assign to the {OCI::VnMonitoring::Models::TrafficNode#egress_security_action #egress_security_action} proprety
    # @option attributes [OCI::VnMonitoring::Models::SecurityAction] :ingress_security_action The value to assign to the {OCI::VnMonitoring::Models::TrafficNode#ingress_security_action #ingress_security_action} proprety
    # @option attributes [String] :entity_id The value to assign to the {#entity_id} property
    # @option attributes [String] :transformation_description The value to assign to the {#transformation_description} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'VISIBLE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.entity_id = attributes[:'entityId'] if attributes[:'entityId']

      raise 'You cannot provide both :entityId and :entity_id' if attributes.key?(:'entityId') && attributes.key?(:'entity_id')

      self.entity_id = attributes[:'entity_id'] if attributes[:'entity_id']

      self.transformation_description = attributes[:'transformationDescription'] if attributes[:'transformationDescription']

      raise 'You cannot provide both :transformationDescription and :transformation_description' if attributes.key?(:'transformationDescription') && attributes.key?(:'transformation_description')

      self.transformation_description = attributes[:'transformation_description'] if attributes[:'transformation_description']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        type == other.type &&
        egress_traffic == other.egress_traffic &&
        next_hop_routing_action == other.next_hop_routing_action &&
        egress_security_action == other.egress_security_action &&
        ingress_security_action == other.ingress_security_action &&
        entity_id == other.entity_id &&
        transformation_description == other.transformation_description
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
      [type, egress_traffic, next_hop_routing_action, egress_security_action, ingress_security_action, entity_id, transformation_description].hash
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
