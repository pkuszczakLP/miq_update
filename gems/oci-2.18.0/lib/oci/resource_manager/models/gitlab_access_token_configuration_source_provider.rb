# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'configuration_source_provider'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a configuration source provider of the type `GITLAB_ACCESS_TOKEN`.
  # This type corresponds to a configuration source provider in GitLab that is authenticated with a personal access token.
  #
  class ResourceManager::Models::GitlabAccessTokenConfigurationSourceProvider < ResourceManager::Models::ConfigurationSourceProvider
    # The Git service endpoint.
    # Example: `https://gitlab.com`
    #
    # @return [String]
    attr_accessor :api_endpoint

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'config_source_provider_type': :'configSourceProviderType',
        'private_server_config_details': :'privateServerConfigDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'api_endpoint': :'apiEndpoint'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'config_source_provider_type': :'String',
        'private_server_config_details': :'OCI::ResourceManager::Models::PrivateServerConfigDetails',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'api_endpoint': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#id #id} proprety
    # @option attributes [String] :compartment_id The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#compartment_id #compartment_id} proprety
    # @option attributes [String] :display_name The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#display_name #display_name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#description #description} proprety
    # @option attributes [DateTime] :time_created The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#time_created #time_created} proprety
    # @option attributes [String] :lifecycle_state The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#lifecycle_state #lifecycle_state} proprety
    # @option attributes [OCI::ResourceManager::Models::PrivateServerConfigDetails] :private_server_config_details The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#private_server_config_details #private_server_config_details} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::ResourceManager::Models::ConfigurationSourceProvider#defined_tags #defined_tags} proprety
    # @option attributes [String] :api_endpoint The value to assign to the {#api_endpoint} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['configSourceProviderType'] = 'GITLAB_ACCESS_TOKEN'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.api_endpoint = attributes[:'apiEndpoint'] if attributes[:'apiEndpoint']

      raise 'You cannot provide both :apiEndpoint and :api_endpoint' if attributes.key?(:'apiEndpoint') && attributes.key?(:'api_endpoint')

      self.api_endpoint = attributes[:'api_endpoint'] if attributes[:'api_endpoint']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        compartment_id == other.compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        config_source_provider_type == other.config_source_provider_type &&
        private_server_config_details == other.private_server_config_details &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        api_endpoint == other.api_endpoint
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
      [id, compartment_id, display_name, description, time_created, lifecycle_state, config_source_provider_type, private_server_config_details, freeform_tags, defined_tags, api_endpoint].hash
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
