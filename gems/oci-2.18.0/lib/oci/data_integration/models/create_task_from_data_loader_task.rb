# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'create_task_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information about a data flow task.
  class DataIntegration::Models::CreateTaskFromDataLoaderTask < DataIntegration::Models::CreateTaskDetails
    # @return [OCI::DataIntegration::Models::DataFlow]
    attr_accessor :data_flow

    # @return [OCI::DataIntegration::Models::ConditionalCompositeFieldMap]
    attr_accessor :conditional_composite_field_map

    # Defines whether Data Loader task is used for single load or multiple
    # @return [BOOLEAN]
    attr_accessor :is_single_load

    # Defines the number of entities being loaded in parallel at a time for a Data Loader task
    # @return [Integer]
    attr_accessor :parallel_load_limit

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'key': :'key',
        'model_version': :'modelVersion',
        'parent_ref': :'parentRef',
        'name': :'name',
        'description': :'description',
        'object_status': :'objectStatus',
        'identifier': :'identifier',
        'input_ports': :'inputPorts',
        'output_ports': :'outputPorts',
        'parameters': :'parameters',
        'op_config_values': :'opConfigValues',
        'config_provider_delegate': :'configProviderDelegate',
        'registry_metadata': :'registryMetadata',
        'data_flow': :'dataFlow',
        'conditional_composite_field_map': :'conditionalCompositeFieldMap',
        'is_single_load': :'isSingleLoad',
        'parallel_load_limit': :'parallelLoadLimit'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'key': :'String',
        'model_version': :'String',
        'parent_ref': :'OCI::DataIntegration::Models::ParentReference',
        'name': :'String',
        'description': :'String',
        'object_status': :'Integer',
        'identifier': :'String',
        'input_ports': :'Array<OCI::DataIntegration::Models::InputPort>',
        'output_ports': :'Array<OCI::DataIntegration::Models::OutputPort>',
        'parameters': :'Array<OCI::DataIntegration::Models::Parameter>',
        'op_config_values': :'OCI::DataIntegration::Models::ConfigValues',
        'config_provider_delegate': :'OCI::DataIntegration::Models::CreateConfigProvider',
        'registry_metadata': :'OCI::DataIntegration::Models::RegistryMetadata',
        'data_flow': :'OCI::DataIntegration::Models::DataFlow',
        'conditional_composite_field_map': :'OCI::DataIntegration::Models::ConditionalCompositeFieldMap',
        'is_single_load': :'BOOLEAN',
        'parallel_load_limit': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :key The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#key #key} proprety
    # @option attributes [String] :model_version The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#model_version #model_version} proprety
    # @option attributes [OCI::DataIntegration::Models::ParentReference] :parent_ref The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#parent_ref #parent_ref} proprety
    # @option attributes [String] :name The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#name #name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#description #description} proprety
    # @option attributes [Integer] :object_status The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#object_status #object_status} proprety
    # @option attributes [String] :identifier The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#identifier #identifier} proprety
    # @option attributes [Array<OCI::DataIntegration::Models::InputPort>] :input_ports The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#input_ports #input_ports} proprety
    # @option attributes [Array<OCI::DataIntegration::Models::OutputPort>] :output_ports The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#output_ports #output_ports} proprety
    # @option attributes [Array<OCI::DataIntegration::Models::Parameter>] :parameters The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#parameters #parameters} proprety
    # @option attributes [OCI::DataIntegration::Models::ConfigValues] :op_config_values The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#op_config_values #op_config_values} proprety
    # @option attributes [OCI::DataIntegration::Models::CreateConfigProvider] :config_provider_delegate The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#config_provider_delegate #config_provider_delegate} proprety
    # @option attributes [OCI::DataIntegration::Models::RegistryMetadata] :registry_metadata The value to assign to the {OCI::DataIntegration::Models::CreateTaskDetails#registry_metadata #registry_metadata} proprety
    # @option attributes [OCI::DataIntegration::Models::DataFlow] :data_flow The value to assign to the {#data_flow} property
    # @option attributes [OCI::DataIntegration::Models::ConditionalCompositeFieldMap] :conditional_composite_field_map The value to assign to the {#conditional_composite_field_map} property
    # @option attributes [BOOLEAN] :is_single_load The value to assign to the {#is_single_load} property
    # @option attributes [Integer] :parallel_load_limit The value to assign to the {#parallel_load_limit} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'DATA_LOADER_TASK'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.data_flow = attributes[:'dataFlow'] if attributes[:'dataFlow']

      raise 'You cannot provide both :dataFlow and :data_flow' if attributes.key?(:'dataFlow') && attributes.key?(:'data_flow')

      self.data_flow = attributes[:'data_flow'] if attributes[:'data_flow']

      self.conditional_composite_field_map = attributes[:'conditionalCompositeFieldMap'] if attributes[:'conditionalCompositeFieldMap']

      raise 'You cannot provide both :conditionalCompositeFieldMap and :conditional_composite_field_map' if attributes.key?(:'conditionalCompositeFieldMap') && attributes.key?(:'conditional_composite_field_map')

      self.conditional_composite_field_map = attributes[:'conditional_composite_field_map'] if attributes[:'conditional_composite_field_map']

      self.is_single_load = attributes[:'isSingleLoad'] unless attributes[:'isSingleLoad'].nil?
      self.is_single_load = false if is_single_load.nil? && !attributes.key?(:'isSingleLoad') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isSingleLoad and :is_single_load' if attributes.key?(:'isSingleLoad') && attributes.key?(:'is_single_load')

      self.is_single_load = attributes[:'is_single_load'] unless attributes[:'is_single_load'].nil?
      self.is_single_load = false if is_single_load.nil? && !attributes.key?(:'isSingleLoad') && !attributes.key?(:'is_single_load') # rubocop:disable Style/StringLiterals

      self.parallel_load_limit = attributes[:'parallelLoadLimit'] if attributes[:'parallelLoadLimit']

      raise 'You cannot provide both :parallelLoadLimit and :parallel_load_limit' if attributes.key?(:'parallelLoadLimit') && attributes.key?(:'parallel_load_limit')

      self.parallel_load_limit = attributes[:'parallel_load_limit'] if attributes[:'parallel_load_limit']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        key == other.key &&
        model_version == other.model_version &&
        parent_ref == other.parent_ref &&
        name == other.name &&
        description == other.description &&
        object_status == other.object_status &&
        identifier == other.identifier &&
        input_ports == other.input_ports &&
        output_ports == other.output_ports &&
        parameters == other.parameters &&
        op_config_values == other.op_config_values &&
        config_provider_delegate == other.config_provider_delegate &&
        registry_metadata == other.registry_metadata &&
        data_flow == other.data_flow &&
        conditional_composite_field_map == other.conditional_composite_field_map &&
        is_single_load == other.is_single_load &&
        parallel_load_limit == other.parallel_load_limit
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
      [model_type, key, model_version, parent_ref, name, description, object_status, identifier, input_ports, output_ports, parameters, op_config_values, config_provider_delegate, registry_metadata, data_flow, conditional_composite_field_map, is_single_load, parallel_load_limit].hash
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