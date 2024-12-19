# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties used to publish an Oracle Cloud Infrastructure Data Flow object.
  class DataIntegration::Models::CreateExternalPublicationDetails
    # The unique OCID of the identifier that is returned after creating the Oracle Cloud Infrastructure Data Flow application.
    # @return [String]
    attr_accessor :application_id

    # **[Required]** The OCID of the compartment where the application is created in the Oracle Cloud Infrastructure Data Flow Service.
    # @return [String]
    attr_accessor :application_compartment_id

    # **[Required]** The name of the application.
    # @return [String]
    attr_accessor :display_name

    # The details of the data flow or the application.
    # @return [String]
    attr_accessor :description

    # @return [OCI::DataIntegration::Models::ResourceConfiguration]
    attr_accessor :resource_configuration

    # @return [OCI::DataIntegration::Models::ConfigurationDetails]
    attr_accessor :configuration_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'application_id': :'applicationId',
        'application_compartment_id': :'applicationCompartmentId',
        'display_name': :'displayName',
        'description': :'description',
        'resource_configuration': :'resourceConfiguration',
        'configuration_details': :'configurationDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'application_id': :'String',
        'application_compartment_id': :'String',
        'display_name': :'String',
        'description': :'String',
        'resource_configuration': :'OCI::DataIntegration::Models::ResourceConfiguration',
        'configuration_details': :'OCI::DataIntegration::Models::ConfigurationDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :application_id The value to assign to the {#application_id} property
    # @option attributes [String] :application_compartment_id The value to assign to the {#application_compartment_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [OCI::DataIntegration::Models::ResourceConfiguration] :resource_configuration The value to assign to the {#resource_configuration} property
    # @option attributes [OCI::DataIntegration::Models::ConfigurationDetails] :configuration_details The value to assign to the {#configuration_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.application_id = attributes[:'applicationId'] if attributes[:'applicationId']

      raise 'You cannot provide both :applicationId and :application_id' if attributes.key?(:'applicationId') && attributes.key?(:'application_id')

      self.application_id = attributes[:'application_id'] if attributes[:'application_id']

      self.application_compartment_id = attributes[:'applicationCompartmentId'] if attributes[:'applicationCompartmentId']

      raise 'You cannot provide both :applicationCompartmentId and :application_compartment_id' if attributes.key?(:'applicationCompartmentId') && attributes.key?(:'application_compartment_id')

      self.application_compartment_id = attributes[:'application_compartment_id'] if attributes[:'application_compartment_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.resource_configuration = attributes[:'resourceConfiguration'] if attributes[:'resourceConfiguration']

      raise 'You cannot provide both :resourceConfiguration and :resource_configuration' if attributes.key?(:'resourceConfiguration') && attributes.key?(:'resource_configuration')

      self.resource_configuration = attributes[:'resource_configuration'] if attributes[:'resource_configuration']

      self.configuration_details = attributes[:'configurationDetails'] if attributes[:'configurationDetails']

      raise 'You cannot provide both :configurationDetails and :configuration_details' if attributes.key?(:'configurationDetails') && attributes.key?(:'configuration_details')

      self.configuration_details = attributes[:'configuration_details'] if attributes[:'configuration_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        application_id == other.application_id &&
        application_compartment_id == other.application_compartment_id &&
        display_name == other.display_name &&
        description == other.description &&
        resource_configuration == other.resource_configuration &&
        configuration_details == other.configuration_details
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
      [application_id, application_compartment_id, display_name, description, resource_configuration, configuration_details].hash
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
