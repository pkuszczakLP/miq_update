# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'get_path_analysis_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Defines the configuration for getting an ad-hoc path analysis.
  class VnMonitoring::Models::AdhocGetPathAnalysisDetails < VnMonitoring::Models::GetPathAnalysisDetails
    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) for the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The IP protocol to used for the path analysis.
    # @return [Integer]
    attr_accessor :protocol

    # This attribute is required.
    # @return [OCI::VnMonitoring::Models::Endpoint]
    attr_accessor :source_endpoint

    # This attribute is required.
    # @return [OCI::VnMonitoring::Models::Endpoint]
    attr_accessor :destination_endpoint

    # @return [OCI::VnMonitoring::Models::ProtocolParameters]
    attr_accessor :protocol_parameters

    # @return [OCI::VnMonitoring::Models::QueryOptions]
    attr_accessor :query_options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'type',
        'compartment_id': :'compartmentId',
        'protocol': :'protocol',
        'source_endpoint': :'sourceEndpoint',
        'destination_endpoint': :'destinationEndpoint',
        'protocol_parameters': :'protocolParameters',
        'query_options': :'queryOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'type': :'String',
        'compartment_id': :'String',
        'protocol': :'Integer',
        'source_endpoint': :'OCI::VnMonitoring::Models::Endpoint',
        'destination_endpoint': :'OCI::VnMonitoring::Models::Endpoint',
        'protocol_parameters': :'OCI::VnMonitoring::Models::ProtocolParameters',
        'query_options': :'OCI::VnMonitoring::Models::QueryOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Integer] :protocol The value to assign to the {#protocol} property
    # @option attributes [OCI::VnMonitoring::Models::Endpoint] :source_endpoint The value to assign to the {#source_endpoint} property
    # @option attributes [OCI::VnMonitoring::Models::Endpoint] :destination_endpoint The value to assign to the {#destination_endpoint} property
    # @option attributes [OCI::VnMonitoring::Models::ProtocolParameters] :protocol_parameters The value to assign to the {#protocol_parameters} property
    # @option attributes [OCI::VnMonitoring::Models::QueryOptions] :query_options The value to assign to the {#query_options} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['type'] = 'ADHOC_QUERY'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.source_endpoint = attributes[:'sourceEndpoint'] if attributes[:'sourceEndpoint']

      raise 'You cannot provide both :sourceEndpoint and :source_endpoint' if attributes.key?(:'sourceEndpoint') && attributes.key?(:'source_endpoint')

      self.source_endpoint = attributes[:'source_endpoint'] if attributes[:'source_endpoint']

      self.destination_endpoint = attributes[:'destinationEndpoint'] if attributes[:'destinationEndpoint']

      raise 'You cannot provide both :destinationEndpoint and :destination_endpoint' if attributes.key?(:'destinationEndpoint') && attributes.key?(:'destination_endpoint')

      self.destination_endpoint = attributes[:'destination_endpoint'] if attributes[:'destination_endpoint']

      self.protocol_parameters = attributes[:'protocolParameters'] if attributes[:'protocolParameters']

      raise 'You cannot provide both :protocolParameters and :protocol_parameters' if attributes.key?(:'protocolParameters') && attributes.key?(:'protocol_parameters')

      self.protocol_parameters = attributes[:'protocol_parameters'] if attributes[:'protocol_parameters']

      self.query_options = attributes[:'queryOptions'] if attributes[:'queryOptions']

      raise 'You cannot provide both :queryOptions and :query_options' if attributes.key?(:'queryOptions') && attributes.key?(:'query_options')

      self.query_options = attributes[:'query_options'] if attributes[:'query_options']
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
        compartment_id == other.compartment_id &&
        protocol == other.protocol &&
        source_endpoint == other.source_endpoint &&
        destination_endpoint == other.destination_endpoint &&
        protocol_parameters == other.protocol_parameters &&
        query_options == other.query_options
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
      [type, compartment_id, protocol, source_endpoint, destination_endpoint, protocol_parameters, query_options].hash
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