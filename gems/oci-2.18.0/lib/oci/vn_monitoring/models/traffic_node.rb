# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Defines the configuration of the OCI entity that represents a traffic node in `PathAnalysisResult`.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class VnMonitoring::Models::TrafficNode
    TYPE_ENUM = [
      TYPE_VISIBLE = 'VISIBLE'.freeze,
      TYPE_ACCESS_DENIED = 'ACCESS_DENIED'.freeze,
      TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Type of the `TrafficNode`.
    # @return [String]
    attr_reader :type

    # @return [OCI::VnMonitoring::Models::EgressTrafficSpec]
    attr_accessor :egress_traffic

    # @return [OCI::VnMonitoring::Models::RoutingAction]
    attr_accessor :next_hop_routing_action

    # @return [OCI::VnMonitoring::Models::SecurityAction]
    attr_accessor :egress_security_action

    # @return [OCI::VnMonitoring::Models::SecurityAction]
    attr_accessor :ingress_security_action

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'egress_traffic': :'egressTraffic',
        'next_hop_routing_action': :'nextHopRoutingAction',
        'egress_security_action': :'egressSecurityAction',
        'ingress_security_action': :'ingressSecurityAction'
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
        'ingress_security_action': :'OCI::VnMonitoring::Models::SecurityAction'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'type'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::VnMonitoring::Models::VisibleTrafficNode' if type == 'VISIBLE'
      return 'OCI::VnMonitoring::Models::AccessDeniedTrafficNode' if type == 'ACCESS_DENIED'

      # TODO: Log a warning when the subtype is not found.
      'OCI::VnMonitoring::Models::TrafficNode'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :type The value to assign to the {#type} property
    # @option attributes [OCI::VnMonitoring::Models::EgressTrafficSpec] :egress_traffic The value to assign to the {#egress_traffic} property
    # @option attributes [OCI::VnMonitoring::Models::RoutingAction] :next_hop_routing_action The value to assign to the {#next_hop_routing_action} property
    # @option attributes [OCI::VnMonitoring::Models::SecurityAction] :egress_security_action The value to assign to the {#egress_security_action} property
    # @option attributes [OCI::VnMonitoring::Models::SecurityAction] :ingress_security_action The value to assign to the {#ingress_security_action} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.type = attributes[:'type'] if attributes[:'type']

      self.egress_traffic = attributes[:'egressTraffic'] if attributes[:'egressTraffic']

      raise 'You cannot provide both :egressTraffic and :egress_traffic' if attributes.key?(:'egressTraffic') && attributes.key?(:'egress_traffic')

      self.egress_traffic = attributes[:'egress_traffic'] if attributes[:'egress_traffic']

      self.next_hop_routing_action = attributes[:'nextHopRoutingAction'] if attributes[:'nextHopRoutingAction']

      raise 'You cannot provide both :nextHopRoutingAction and :next_hop_routing_action' if attributes.key?(:'nextHopRoutingAction') && attributes.key?(:'next_hop_routing_action')

      self.next_hop_routing_action = attributes[:'next_hop_routing_action'] if attributes[:'next_hop_routing_action']

      self.egress_security_action = attributes[:'egressSecurityAction'] if attributes[:'egressSecurityAction']

      raise 'You cannot provide both :egressSecurityAction and :egress_security_action' if attributes.key?(:'egressSecurityAction') && attributes.key?(:'egress_security_action')

      self.egress_security_action = attributes[:'egress_security_action'] if attributes[:'egress_security_action']

      self.ingress_security_action = attributes[:'ingressSecurityAction'] if attributes[:'ingressSecurityAction']

      raise 'You cannot provide both :ingressSecurityAction and :ingress_security_action' if attributes.key?(:'ingressSecurityAction') && attributes.key?(:'ingress_security_action')

      self.ingress_security_action = attributes[:'ingress_security_action'] if attributes[:'ingress_security_action']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      # rubocop:disable Style/ConditionalAssignment
      if type && !TYPE_ENUM.include?(type)
        OCI.logger.debug("Unknown value for 'type' [" + type + "]. Mapping to 'TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @type = TYPE_UNKNOWN_ENUM_VALUE
      else
        @type = type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
        ingress_security_action == other.ingress_security_action
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
      [type, egress_traffic, next_hop_routing_action, egress_security_action, ingress_security_action].hash
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
