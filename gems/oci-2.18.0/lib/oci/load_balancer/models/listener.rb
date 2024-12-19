# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The listener's configuration.
  # For more information on backend set configuration, see
  # [Managing Load Balancer Listeners](https://docs.cloud.oracle.com/Content/Balance/Tasks/managinglisteners.htm).
  #
  class LoadBalancer::Models::Listener
    # **[Required]** A friendly name for the listener. It must be unique and it cannot be changed.
    #
    # Example: `example_listener`
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The name of the associated backend set.
    #
    # Example: `example_backend_set`
    #
    # @return [String]
    attr_accessor :default_backend_set_name

    # **[Required]** The communication port for the listener.
    #
    # Example: `80`
    #
    # @return [Integer]
    attr_accessor :port

    # **[Required]** The protocol on which the listener accepts connection requests.
    # To get a list of valid protocols, use the {#list_protocols list_protocols}
    # operation.
    #
    # Example: `HTTP`
    #
    # @return [String]
    attr_accessor :protocol

    # An array of hostname resource names.
    # @return [Array<String>]
    attr_accessor :hostname_names

    # Deprecated. Please use `routingPolicies` instead.
    #
    # The name of the set of path-based routing rules, {PathRouteSet},
    # applied to this listener's traffic.
    #
    # Example: `example_path_route_set`
    #
    # @return [String]
    attr_accessor :path_route_set_name

    # @return [OCI::LoadBalancer::Models::SSLConfiguration]
    attr_accessor :ssl_configuration

    # @return [OCI::LoadBalancer::Models::ConnectionConfiguration]
    attr_accessor :connection_configuration

    # The names of the {RuleSet} to apply to the listener.
    #
    # Example: [\"example_rule_set\"]
    #
    # @return [Array<String>]
    attr_accessor :rule_set_names

    # The name of the routing policy applied to this listener's traffic.
    #
    # Example: `example_routing_policy_name`
    #
    # @return [String]
    attr_accessor :routing_policy_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'default_backend_set_name': :'defaultBackendSetName',
        'port': :'port',
        'protocol': :'protocol',
        'hostname_names': :'hostnameNames',
        'path_route_set_name': :'pathRouteSetName',
        'ssl_configuration': :'sslConfiguration',
        'connection_configuration': :'connectionConfiguration',
        'rule_set_names': :'ruleSetNames',
        'routing_policy_name': :'routingPolicyName'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'default_backend_set_name': :'String',
        'port': :'Integer',
        'protocol': :'String',
        'hostname_names': :'Array<String>',
        'path_route_set_name': :'String',
        'ssl_configuration': :'OCI::LoadBalancer::Models::SSLConfiguration',
        'connection_configuration': :'OCI::LoadBalancer::Models::ConnectionConfiguration',
        'rule_set_names': :'Array<String>',
        'routing_policy_name': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :default_backend_set_name The value to assign to the {#default_backend_set_name} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [Array<String>] :hostname_names The value to assign to the {#hostname_names} property
    # @option attributes [String] :path_route_set_name The value to assign to the {#path_route_set_name} property
    # @option attributes [OCI::LoadBalancer::Models::SSLConfiguration] :ssl_configuration The value to assign to the {#ssl_configuration} property
    # @option attributes [OCI::LoadBalancer::Models::ConnectionConfiguration] :connection_configuration The value to assign to the {#connection_configuration} property
    # @option attributes [Array<String>] :rule_set_names The value to assign to the {#rule_set_names} property
    # @option attributes [String] :routing_policy_name The value to assign to the {#routing_policy_name} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.default_backend_set_name = attributes[:'defaultBackendSetName'] if attributes[:'defaultBackendSetName']

      raise 'You cannot provide both :defaultBackendSetName and :default_backend_set_name' if attributes.key?(:'defaultBackendSetName') && attributes.key?(:'default_backend_set_name')

      self.default_backend_set_name = attributes[:'default_backend_set_name'] if attributes[:'default_backend_set_name']

      self.port = attributes[:'port'] if attributes[:'port']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.hostname_names = attributes[:'hostnameNames'] if attributes[:'hostnameNames']

      raise 'You cannot provide both :hostnameNames and :hostname_names' if attributes.key?(:'hostnameNames') && attributes.key?(:'hostname_names')

      self.hostname_names = attributes[:'hostname_names'] if attributes[:'hostname_names']

      self.path_route_set_name = attributes[:'pathRouteSetName'] if attributes[:'pathRouteSetName']

      raise 'You cannot provide both :pathRouteSetName and :path_route_set_name' if attributes.key?(:'pathRouteSetName') && attributes.key?(:'path_route_set_name')

      self.path_route_set_name = attributes[:'path_route_set_name'] if attributes[:'path_route_set_name']

      self.ssl_configuration = attributes[:'sslConfiguration'] if attributes[:'sslConfiguration']

      raise 'You cannot provide both :sslConfiguration and :ssl_configuration' if attributes.key?(:'sslConfiguration') && attributes.key?(:'ssl_configuration')

      self.ssl_configuration = attributes[:'ssl_configuration'] if attributes[:'ssl_configuration']

      self.connection_configuration = attributes[:'connectionConfiguration'] if attributes[:'connectionConfiguration']

      raise 'You cannot provide both :connectionConfiguration and :connection_configuration' if attributes.key?(:'connectionConfiguration') && attributes.key?(:'connection_configuration')

      self.connection_configuration = attributes[:'connection_configuration'] if attributes[:'connection_configuration']

      self.rule_set_names = attributes[:'ruleSetNames'] if attributes[:'ruleSetNames']

      raise 'You cannot provide both :ruleSetNames and :rule_set_names' if attributes.key?(:'ruleSetNames') && attributes.key?(:'rule_set_names')

      self.rule_set_names = attributes[:'rule_set_names'] if attributes[:'rule_set_names']

      self.routing_policy_name = attributes[:'routingPolicyName'] if attributes[:'routingPolicyName']

      raise 'You cannot provide both :routingPolicyName and :routing_policy_name' if attributes.key?(:'routingPolicyName') && attributes.key?(:'routing_policy_name')

      self.routing_policy_name = attributes[:'routing_policy_name'] if attributes[:'routing_policy_name']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        default_backend_set_name == other.default_backend_set_name &&
        port == other.port &&
        protocol == other.protocol &&
        hostname_names == other.hostname_names &&
        path_route_set_name == other.path_route_set_name &&
        ssl_configuration == other.ssl_configuration &&
        connection_configuration == other.connection_configuration &&
        rule_set_names == other.rule_set_names &&
        routing_policy_name == other.routing_policy_name
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
      [name, default_backend_set_name, port, protocol, hostname_names, path_route_set_name, ssl_configuration, connection_configuration, rule_set_names, routing_policy_name].hash
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
