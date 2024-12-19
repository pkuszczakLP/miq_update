# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The configuration details for a load balancer backend set.
  # For more information on backend set configuration, see
  # [Managing Backend Sets](https://docs.cloud.oracle.com/Content/Balance/Tasks/managingbackendsets.htm).
  #
  # **Note:** The `sessionPersistenceConfiguration` (application cookie stickiness) and `lbCookieSessionPersistenceConfiguration`
  # (LB cookie stickiness) attributes are mutually exclusive. To avoid returning an error, configure only one of these two
  # attributes per backend set.
  #
  class LoadBalancer::Models::BackendSetDetails
    # **[Required]** The load balancer policy for the backend set. To get a list of available policies, use the
    # {#list_policies list_policies} operation.
    #
    # Example: `LEAST_CONNECTIONS`
    #
    # @return [String]
    attr_accessor :policy

    # @return [Array<OCI::LoadBalancer::Models::BackendDetails>]
    attr_accessor :backends

    # This attribute is required.
    # @return [OCI::LoadBalancer::Models::HealthCheckerDetails]
    attr_accessor :health_checker

    # @return [OCI::LoadBalancer::Models::SSLConfigurationDetails]
    attr_accessor :ssl_configuration

    # @return [OCI::LoadBalancer::Models::SessionPersistenceConfigurationDetails]
    attr_accessor :session_persistence_configuration

    # @return [OCI::LoadBalancer::Models::LBCookieSessionPersistenceConfigurationDetails]
    attr_accessor :lb_cookie_session_persistence_configuration

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'policy': :'policy',
        'backends': :'backends',
        'health_checker': :'healthChecker',
        'ssl_configuration': :'sslConfiguration',
        'session_persistence_configuration': :'sessionPersistenceConfiguration',
        'lb_cookie_session_persistence_configuration': :'lbCookieSessionPersistenceConfiguration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'policy': :'String',
        'backends': :'Array<OCI::LoadBalancer::Models::BackendDetails>',
        'health_checker': :'OCI::LoadBalancer::Models::HealthCheckerDetails',
        'ssl_configuration': :'OCI::LoadBalancer::Models::SSLConfigurationDetails',
        'session_persistence_configuration': :'OCI::LoadBalancer::Models::SessionPersistenceConfigurationDetails',
        'lb_cookie_session_persistence_configuration': :'OCI::LoadBalancer::Models::LBCookieSessionPersistenceConfigurationDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :policy The value to assign to the {#policy} property
    # @option attributes [Array<OCI::LoadBalancer::Models::BackendDetails>] :backends The value to assign to the {#backends} property
    # @option attributes [OCI::LoadBalancer::Models::HealthCheckerDetails] :health_checker The value to assign to the {#health_checker} property
    # @option attributes [OCI::LoadBalancer::Models::SSLConfigurationDetails] :ssl_configuration The value to assign to the {#ssl_configuration} property
    # @option attributes [OCI::LoadBalancer::Models::SessionPersistenceConfigurationDetails] :session_persistence_configuration The value to assign to the {#session_persistence_configuration} property
    # @option attributes [OCI::LoadBalancer::Models::LBCookieSessionPersistenceConfigurationDetails] :lb_cookie_session_persistence_configuration The value to assign to the {#lb_cookie_session_persistence_configuration} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.policy = attributes[:'policy'] if attributes[:'policy']

      self.backends = attributes[:'backends'] if attributes[:'backends']

      self.health_checker = attributes[:'healthChecker'] if attributes[:'healthChecker']

      raise 'You cannot provide both :healthChecker and :health_checker' if attributes.key?(:'healthChecker') && attributes.key?(:'health_checker')

      self.health_checker = attributes[:'health_checker'] if attributes[:'health_checker']

      self.ssl_configuration = attributes[:'sslConfiguration'] if attributes[:'sslConfiguration']

      raise 'You cannot provide both :sslConfiguration and :ssl_configuration' if attributes.key?(:'sslConfiguration') && attributes.key?(:'ssl_configuration')

      self.ssl_configuration = attributes[:'ssl_configuration'] if attributes[:'ssl_configuration']

      self.session_persistence_configuration = attributes[:'sessionPersistenceConfiguration'] if attributes[:'sessionPersistenceConfiguration']

      raise 'You cannot provide both :sessionPersistenceConfiguration and :session_persistence_configuration' if attributes.key?(:'sessionPersistenceConfiguration') && attributes.key?(:'session_persistence_configuration')

      self.session_persistence_configuration = attributes[:'session_persistence_configuration'] if attributes[:'session_persistence_configuration']

      self.lb_cookie_session_persistence_configuration = attributes[:'lbCookieSessionPersistenceConfiguration'] if attributes[:'lbCookieSessionPersistenceConfiguration']

      raise 'You cannot provide both :lbCookieSessionPersistenceConfiguration and :lb_cookie_session_persistence_configuration' if attributes.key?(:'lbCookieSessionPersistenceConfiguration') && attributes.key?(:'lb_cookie_session_persistence_configuration')

      self.lb_cookie_session_persistence_configuration = attributes[:'lb_cookie_session_persistence_configuration'] if attributes[:'lb_cookie_session_persistence_configuration']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        policy == other.policy &&
        backends == other.backends &&
        health_checker == other.health_checker &&
        ssl_configuration == other.ssl_configuration &&
        session_persistence_configuration == other.session_persistence_configuration &&
        lb_cookie_session_persistence_configuration == other.lb_cookie_session_persistence_configuration
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
      [policy, backends, health_checker, ssl_configuration, session_persistence_configuration, lb_cookie_session_persistence_configuration].hash
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