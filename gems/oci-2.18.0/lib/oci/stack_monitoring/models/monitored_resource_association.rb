# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Association between two monitored resources.
  class StackMonitoring::Models::MonitoredResourceAssociation
    # **[Required]** Association Type
    # @return [String]
    attr_accessor :association_type

    # **[Required]** Compartment Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Tenancy Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :tenant_id

    # **[Required]** Source Monitored Resource Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :source_resource_id

    # **[Required]** Destination Monitored Resource Identifier [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm)
    # @return [String]
    attr_accessor :destination_resource_id

    # @return [OCI::StackMonitoring::Models::AssociationResourceDetails]
    attr_accessor :source_resource_details

    # @return [OCI::StackMonitoring::Models::AssociationResourceDetails]
    attr_accessor :destination_resource_details

    # The time when the association was created. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_created

    # Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'association_type': :'associationType',
        'compartment_id': :'compartmentId',
        'tenant_id': :'tenantId',
        'source_resource_id': :'sourceResourceId',
        'destination_resource_id': :'destinationResourceId',
        'source_resource_details': :'sourceResourceDetails',
        'destination_resource_details': :'destinationResourceDetails',
        'time_created': :'timeCreated',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'association_type': :'String',
        'compartment_id': :'String',
        'tenant_id': :'String',
        'source_resource_id': :'String',
        'destination_resource_id': :'String',
        'source_resource_details': :'OCI::StackMonitoring::Models::AssociationResourceDetails',
        'destination_resource_details': :'OCI::StackMonitoring::Models::AssociationResourceDetails',
        'time_created': :'DateTime',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :association_type The value to assign to the {#association_type} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :tenant_id The value to assign to the {#tenant_id} property
    # @option attributes [String] :source_resource_id The value to assign to the {#source_resource_id} property
    # @option attributes [String] :destination_resource_id The value to assign to the {#destination_resource_id} property
    # @option attributes [OCI::StackMonitoring::Models::AssociationResourceDetails] :source_resource_details The value to assign to the {#source_resource_details} property
    # @option attributes [OCI::StackMonitoring::Models::AssociationResourceDetails] :destination_resource_details The value to assign to the {#destination_resource_details} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.association_type = attributes[:'associationType'] if attributes[:'associationType']

      raise 'You cannot provide both :associationType and :association_type' if attributes.key?(:'associationType') && attributes.key?(:'association_type')

      self.association_type = attributes[:'association_type'] if attributes[:'association_type']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.tenant_id = attributes[:'tenantId'] if attributes[:'tenantId']

      raise 'You cannot provide both :tenantId and :tenant_id' if attributes.key?(:'tenantId') && attributes.key?(:'tenant_id')

      self.tenant_id = attributes[:'tenant_id'] if attributes[:'tenant_id']

      self.source_resource_id = attributes[:'sourceResourceId'] if attributes[:'sourceResourceId']

      raise 'You cannot provide both :sourceResourceId and :source_resource_id' if attributes.key?(:'sourceResourceId') && attributes.key?(:'source_resource_id')

      self.source_resource_id = attributes[:'source_resource_id'] if attributes[:'source_resource_id']

      self.destination_resource_id = attributes[:'destinationResourceId'] if attributes[:'destinationResourceId']

      raise 'You cannot provide both :destinationResourceId and :destination_resource_id' if attributes.key?(:'destinationResourceId') && attributes.key?(:'destination_resource_id')

      self.destination_resource_id = attributes[:'destination_resource_id'] if attributes[:'destination_resource_id']

      self.source_resource_details = attributes[:'sourceResourceDetails'] if attributes[:'sourceResourceDetails']

      raise 'You cannot provide both :sourceResourceDetails and :source_resource_details' if attributes.key?(:'sourceResourceDetails') && attributes.key?(:'source_resource_details')

      self.source_resource_details = attributes[:'source_resource_details'] if attributes[:'source_resource_details']

      self.destination_resource_details = attributes[:'destinationResourceDetails'] if attributes[:'destinationResourceDetails']

      raise 'You cannot provide both :destinationResourceDetails and :destination_resource_details' if attributes.key?(:'destinationResourceDetails') && attributes.key?(:'destination_resource_details')

      self.destination_resource_details = attributes[:'destination_resource_details'] if attributes[:'destination_resource_details']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        association_type == other.association_type &&
        compartment_id == other.compartment_id &&
        tenant_id == other.tenant_id &&
        source_resource_id == other.source_resource_id &&
        destination_resource_id == other.destination_resource_id &&
        source_resource_details == other.source_resource_details &&
        destination_resource_details == other.destination_resource_details &&
        time_created == other.time_created &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [association_type, compartment_id, tenant_id, source_resource_id, destination_resource_id, source_resource_details, destination_resource_details, time_created, freeform_tags, defined_tags, system_tags].hash
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
