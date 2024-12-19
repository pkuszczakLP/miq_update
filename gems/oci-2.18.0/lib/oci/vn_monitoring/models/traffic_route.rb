# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Defines the traffic route taken in the path in `PathAnalysisResult`.
  class VnMonitoring::Models::TrafficRoute
    REACHABILITY_STATUS_ENUM = [
      REACHABILITY_STATUS_REACHABLE = 'REACHABLE'.freeze,
      REACHABILITY_STATUS_UNREACHABLE = 'UNREACHABLE'.freeze,
      REACHABILITY_STATUS_INDETERMINATE = 'INDETERMINATE'.freeze,
      REACHABILITY_STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Reachability status for the given traffic route.
    # @return [String]
    attr_reader :reachability_status

    # **[Required]** The ordered sequence of nodes in the given the traffic route forming a path.
    # @return [Array<OCI::VnMonitoring::Models::TrafficNode>]
    attr_accessor :nodes

    # A description of the traffic route analysis. For example: \"Traffic might not reach a destination
    # due to the LB backend being unhealthy\".
    #
    # @return [String]
    attr_accessor :route_analysis_description

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'reachability_status': :'reachabilityStatus',
        'nodes': :'nodes',
        'route_analysis_description': :'routeAnalysisDescription'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'reachability_status': :'String',
        'nodes': :'Array<OCI::VnMonitoring::Models::TrafficNode>',
        'route_analysis_description': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :reachability_status The value to assign to the {#reachability_status} property
    # @option attributes [Array<OCI::VnMonitoring::Models::TrafficNode>] :nodes The value to assign to the {#nodes} property
    # @option attributes [String] :route_analysis_description The value to assign to the {#route_analysis_description} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.reachability_status = attributes[:'reachabilityStatus'] if attributes[:'reachabilityStatus']

      raise 'You cannot provide both :reachabilityStatus and :reachability_status' if attributes.key?(:'reachabilityStatus') && attributes.key?(:'reachability_status')

      self.reachability_status = attributes[:'reachability_status'] if attributes[:'reachability_status']

      self.nodes = attributes[:'nodes'] if attributes[:'nodes']

      self.route_analysis_description = attributes[:'routeAnalysisDescription'] if attributes[:'routeAnalysisDescription']

      raise 'You cannot provide both :routeAnalysisDescription and :route_analysis_description' if attributes.key?(:'routeAnalysisDescription') && attributes.key?(:'route_analysis_description')

      self.route_analysis_description = attributes[:'route_analysis_description'] if attributes[:'route_analysis_description']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] reachability_status Object to be assigned
    def reachability_status=(reachability_status)
      # rubocop:disable Style/ConditionalAssignment
      if reachability_status && !REACHABILITY_STATUS_ENUM.include?(reachability_status)
        OCI.logger.debug("Unknown value for 'reachability_status' [" + reachability_status + "]. Mapping to 'REACHABILITY_STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @reachability_status = REACHABILITY_STATUS_UNKNOWN_ENUM_VALUE
      else
        @reachability_status = reachability_status
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        reachability_status == other.reachability_status &&
        nodes == other.nodes &&
        route_analysis_description == other.route_analysis_description
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
      [reachability_status, nodes, route_analysis_description].hash
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
