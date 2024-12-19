# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The size and placement configuration of nodes in the node pool.
  class ContainerEngine::Models::UpdateNodePoolNodeConfigDetails
    # The number of nodes in the node pool.
    #
    # @return [Integer]
    attr_accessor :size

    # The OCIDs of the Network Security Group(s) to associate nodes for this node pool with. For more information about NSGs, see {NetworkSecurityGroup}.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # The OCID of the Key Management Service key assigned to the boot volume.
    # @return [String]
    attr_accessor :kms_key_id

    # Whether to enable in-transit encryption for the data volume's paravirtualized attachment. This field applies to both block volumes and boot volumes. The default value is false.
    # @return [BOOLEAN]
    attr_accessor :is_pv_encryption_in_transit_enabled

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The placement configurations for the node pool. Provide one placement
    # configuration for each availability domain in which you intend to launch a node.
    #
    # To use the node pool with a regional subnet, provide a placement configuration for
    # each availability domain, and include the regional subnet in each placement
    # configuration.
    #
    # @return [Array<OCI::ContainerEngine::Models::NodePoolPlacementConfigDetails>]
    attr_accessor :placement_configs

    # The CNI related configuration of pods in the node pool.
    #
    # @return [OCI::ContainerEngine::Models::NodePoolPodNetworkOptionDetails]
    attr_accessor :node_pool_pod_network_option_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'size': :'size',
        'nsg_ids': :'nsgIds',
        'kms_key_id': :'kmsKeyId',
        'is_pv_encryption_in_transit_enabled': :'isPvEncryptionInTransitEnabled',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'placement_configs': :'placementConfigs',
        'node_pool_pod_network_option_details': :'nodePoolPodNetworkOptionDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'size': :'Integer',
        'nsg_ids': :'Array<String>',
        'kms_key_id': :'String',
        'is_pv_encryption_in_transit_enabled': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'placement_configs': :'Array<OCI::ContainerEngine::Models::NodePoolPlacementConfigDetails>',
        'node_pool_pod_network_option_details': :'OCI::ContainerEngine::Models::NodePoolPodNetworkOptionDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :size The value to assign to the {#size} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [BOOLEAN] :is_pv_encryption_in_transit_enabled The value to assign to the {#is_pv_encryption_in_transit_enabled} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Array<OCI::ContainerEngine::Models::NodePoolPlacementConfigDetails>] :placement_configs The value to assign to the {#placement_configs} property
    # @option attributes [OCI::ContainerEngine::Models::NodePoolPodNetworkOptionDetails] :node_pool_pod_network_option_details The value to assign to the {#node_pool_pod_network_option_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.size = attributes[:'size'] if attributes[:'size']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.is_pv_encryption_in_transit_enabled = attributes[:'isPvEncryptionInTransitEnabled'] unless attributes[:'isPvEncryptionInTransitEnabled'].nil?
      self.is_pv_encryption_in_transit_enabled = false if is_pv_encryption_in_transit_enabled.nil? && !attributes.key?(:'isPvEncryptionInTransitEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isPvEncryptionInTransitEnabled and :is_pv_encryption_in_transit_enabled' if attributes.key?(:'isPvEncryptionInTransitEnabled') && attributes.key?(:'is_pv_encryption_in_transit_enabled')

      self.is_pv_encryption_in_transit_enabled = attributes[:'is_pv_encryption_in_transit_enabled'] unless attributes[:'is_pv_encryption_in_transit_enabled'].nil?
      self.is_pv_encryption_in_transit_enabled = false if is_pv_encryption_in_transit_enabled.nil? && !attributes.key?(:'isPvEncryptionInTransitEnabled') && !attributes.key?(:'is_pv_encryption_in_transit_enabled') # rubocop:disable Style/StringLiterals

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.placement_configs = attributes[:'placementConfigs'] if attributes[:'placementConfigs']

      raise 'You cannot provide both :placementConfigs and :placement_configs' if attributes.key?(:'placementConfigs') && attributes.key?(:'placement_configs')

      self.placement_configs = attributes[:'placement_configs'] if attributes[:'placement_configs']

      self.node_pool_pod_network_option_details = attributes[:'nodePoolPodNetworkOptionDetails'] if attributes[:'nodePoolPodNetworkOptionDetails']

      raise 'You cannot provide both :nodePoolPodNetworkOptionDetails and :node_pool_pod_network_option_details' if attributes.key?(:'nodePoolPodNetworkOptionDetails') && attributes.key?(:'node_pool_pod_network_option_details')

      self.node_pool_pod_network_option_details = attributes[:'node_pool_pod_network_option_details'] if attributes[:'node_pool_pod_network_option_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        size == other.size &&
        nsg_ids == other.nsg_ids &&
        kms_key_id == other.kms_key_id &&
        is_pv_encryption_in_transit_enabled == other.is_pv_encryption_in_transit_enabled &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        placement_configs == other.placement_configs &&
        node_pool_pod_network_option_details == other.node_pool_pod_network_option_details
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
      [size, nsg_ids, kms_key_id, is_pv_encryption_in_transit_enabled, freeform_tags, defined_tags, placement_configs, node_pool_pod_network_option_details].hash
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