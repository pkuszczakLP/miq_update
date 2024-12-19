# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A pool of compute nodes attached to a cluster. Avoid entering confidential information.
  class ContainerEngine::Models::NodePool
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCID of the node pool.
    # @return [String]
    attr_accessor :id

    # The state of the nodepool.
    # @return [String]
    attr_reader :lifecycle_state

    # Details about the state of the nodepool.
    # @return [String]
    attr_accessor :lifecycle_details

    # The OCID of the compartment in which the node pool exists.
    # @return [String]
    attr_accessor :compartment_id

    # The OCID of the cluster to which this node pool is attached.
    # @return [String]
    attr_accessor :cluster_id

    # The name of the node pool.
    # @return [String]
    attr_accessor :name

    # The version of Kubernetes running on the nodes in the node pool.
    # @return [String]
    attr_accessor :kubernetes_version

    # A list of key/value pairs to add to each underlying OCI instance in the node pool on launch.
    # @return [Hash<String, String>]
    attr_accessor :node_metadata

    # Deprecated. see `nodeSource`. The OCID of the image running on the nodes in the node pool.
    #
    # @return [String]
    attr_accessor :node_image_id

    # Deprecated. see `nodeSource`. The name of the image running on the nodes in the node pool.
    #
    # @return [String]
    attr_accessor :node_image_name

    # The shape configuration of the nodes.
    # @return [OCI::ContainerEngine::Models::NodeShapeConfig]
    attr_accessor :node_shape_config

    # Deprecated. see `nodeSourceDetails`. Source running on the nodes in the node pool.
    # @return [OCI::ContainerEngine::Models::NodeSourceOption]
    attr_accessor :node_source

    # Source running on the nodes in the node pool.
    # @return [OCI::ContainerEngine::Models::NodeSourceDetails]
    attr_accessor :node_source_details

    # The name of the node shape of the nodes in the node pool.
    # @return [String]
    attr_accessor :node_shape

    # A list of key/value pairs to add to nodes after they join the Kubernetes cluster.
    # @return [Array<OCI::ContainerEngine::Models::KeyValue>]
    attr_accessor :initial_node_labels

    # The SSH public key on each node in the node pool on launch.
    # @return [String]
    attr_accessor :ssh_public_key

    # The number of nodes in each subnet.
    # @return [Integer]
    attr_accessor :quantity_per_subnet

    # The OCIDs of the subnets in which to place nodes for this node pool.
    # @return [Array<String>]
    attr_accessor :subnet_ids

    # The nodes in the node pool.
    # @return [Array<OCI::ContainerEngine::Models::Node>]
    attr_accessor :nodes

    # The configuration of nodes in the node pool.
    # @return [OCI::ContainerEngine::Models::NodePoolNodeConfigDetails]
    attr_accessor :node_config_details

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

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # @return [OCI::ContainerEngine::Models::NodeEvictionNodePoolSettings]
    attr_accessor :node_eviction_node_pool_settings

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'compartment_id': :'compartmentId',
        'cluster_id': :'clusterId',
        'name': :'name',
        'kubernetes_version': :'kubernetesVersion',
        'node_metadata': :'nodeMetadata',
        'node_image_id': :'nodeImageId',
        'node_image_name': :'nodeImageName',
        'node_shape_config': :'nodeShapeConfig',
        'node_source': :'nodeSource',
        'node_source_details': :'nodeSourceDetails',
        'node_shape': :'nodeShape',
        'initial_node_labels': :'initialNodeLabels',
        'ssh_public_key': :'sshPublicKey',
        'quantity_per_subnet': :'quantityPerSubnet',
        'subnet_ids': :'subnetIds',
        'nodes': :'nodes',
        'node_config_details': :'nodeConfigDetails',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'node_eviction_node_pool_settings': :'nodeEvictionNodePoolSettings'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'compartment_id': :'String',
        'cluster_id': :'String',
        'name': :'String',
        'kubernetes_version': :'String',
        'node_metadata': :'Hash<String, String>',
        'node_image_id': :'String',
        'node_image_name': :'String',
        'node_shape_config': :'OCI::ContainerEngine::Models::NodeShapeConfig',
        'node_source': :'OCI::ContainerEngine::Models::NodeSourceOption',
        'node_source_details': :'OCI::ContainerEngine::Models::NodeSourceDetails',
        'node_shape': :'String',
        'initial_node_labels': :'Array<OCI::ContainerEngine::Models::KeyValue>',
        'ssh_public_key': :'String',
        'quantity_per_subnet': :'Integer',
        'subnet_ids': :'Array<String>',
        'nodes': :'Array<OCI::ContainerEngine::Models::Node>',
        'node_config_details': :'OCI::ContainerEngine::Models::NodePoolNodeConfigDetails',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'node_eviction_node_pool_settings': :'OCI::ContainerEngine::Models::NodeEvictionNodePoolSettings'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :cluster_id The value to assign to the {#cluster_id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :kubernetes_version The value to assign to the {#kubernetes_version} property
    # @option attributes [Hash<String, String>] :node_metadata The value to assign to the {#node_metadata} property
    # @option attributes [String] :node_image_id The value to assign to the {#node_image_id} property
    # @option attributes [String] :node_image_name The value to assign to the {#node_image_name} property
    # @option attributes [OCI::ContainerEngine::Models::NodeShapeConfig] :node_shape_config The value to assign to the {#node_shape_config} property
    # @option attributes [OCI::ContainerEngine::Models::NodeSourceOption] :node_source The value to assign to the {#node_source} property
    # @option attributes [OCI::ContainerEngine::Models::NodeSourceDetails] :node_source_details The value to assign to the {#node_source_details} property
    # @option attributes [String] :node_shape The value to assign to the {#node_shape} property
    # @option attributes [Array<OCI::ContainerEngine::Models::KeyValue>] :initial_node_labels The value to assign to the {#initial_node_labels} property
    # @option attributes [String] :ssh_public_key The value to assign to the {#ssh_public_key} property
    # @option attributes [Integer] :quantity_per_subnet The value to assign to the {#quantity_per_subnet} property
    # @option attributes [Array<String>] :subnet_ids The value to assign to the {#subnet_ids} property
    # @option attributes [Array<OCI::ContainerEngine::Models::Node>] :nodes The value to assign to the {#nodes} property
    # @option attributes [OCI::ContainerEngine::Models::NodePoolNodeConfigDetails] :node_config_details The value to assign to the {#node_config_details} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [OCI::ContainerEngine::Models::NodeEvictionNodePoolSettings] :node_eviction_node_pool_settings The value to assign to the {#node_eviction_node_pool_settings} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.cluster_id = attributes[:'clusterId'] if attributes[:'clusterId']

      raise 'You cannot provide both :clusterId and :cluster_id' if attributes.key?(:'clusterId') && attributes.key?(:'cluster_id')

      self.cluster_id = attributes[:'cluster_id'] if attributes[:'cluster_id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.kubernetes_version = attributes[:'kubernetesVersion'] if attributes[:'kubernetesVersion']

      raise 'You cannot provide both :kubernetesVersion and :kubernetes_version' if attributes.key?(:'kubernetesVersion') && attributes.key?(:'kubernetes_version')

      self.kubernetes_version = attributes[:'kubernetes_version'] if attributes[:'kubernetes_version']

      self.node_metadata = attributes[:'nodeMetadata'] if attributes[:'nodeMetadata']

      raise 'You cannot provide both :nodeMetadata and :node_metadata' if attributes.key?(:'nodeMetadata') && attributes.key?(:'node_metadata')

      self.node_metadata = attributes[:'node_metadata'] if attributes[:'node_metadata']

      self.node_image_id = attributes[:'nodeImageId'] if attributes[:'nodeImageId']

      raise 'You cannot provide both :nodeImageId and :node_image_id' if attributes.key?(:'nodeImageId') && attributes.key?(:'node_image_id')

      self.node_image_id = attributes[:'node_image_id'] if attributes[:'node_image_id']

      self.node_image_name = attributes[:'nodeImageName'] if attributes[:'nodeImageName']

      raise 'You cannot provide both :nodeImageName and :node_image_name' if attributes.key?(:'nodeImageName') && attributes.key?(:'node_image_name')

      self.node_image_name = attributes[:'node_image_name'] if attributes[:'node_image_name']

      self.node_shape_config = attributes[:'nodeShapeConfig'] if attributes[:'nodeShapeConfig']

      raise 'You cannot provide both :nodeShapeConfig and :node_shape_config' if attributes.key?(:'nodeShapeConfig') && attributes.key?(:'node_shape_config')

      self.node_shape_config = attributes[:'node_shape_config'] if attributes[:'node_shape_config']

      self.node_source = attributes[:'nodeSource'] if attributes[:'nodeSource']

      raise 'You cannot provide both :nodeSource and :node_source' if attributes.key?(:'nodeSource') && attributes.key?(:'node_source')

      self.node_source = attributes[:'node_source'] if attributes[:'node_source']

      self.node_source_details = attributes[:'nodeSourceDetails'] if attributes[:'nodeSourceDetails']

      raise 'You cannot provide both :nodeSourceDetails and :node_source_details' if attributes.key?(:'nodeSourceDetails') && attributes.key?(:'node_source_details')

      self.node_source_details = attributes[:'node_source_details'] if attributes[:'node_source_details']

      self.node_shape = attributes[:'nodeShape'] if attributes[:'nodeShape']

      raise 'You cannot provide both :nodeShape and :node_shape' if attributes.key?(:'nodeShape') && attributes.key?(:'node_shape')

      self.node_shape = attributes[:'node_shape'] if attributes[:'node_shape']

      self.initial_node_labels = attributes[:'initialNodeLabels'] if attributes[:'initialNodeLabels']

      raise 'You cannot provide both :initialNodeLabels and :initial_node_labels' if attributes.key?(:'initialNodeLabels') && attributes.key?(:'initial_node_labels')

      self.initial_node_labels = attributes[:'initial_node_labels'] if attributes[:'initial_node_labels']

      self.ssh_public_key = attributes[:'sshPublicKey'] if attributes[:'sshPublicKey']

      raise 'You cannot provide both :sshPublicKey and :ssh_public_key' if attributes.key?(:'sshPublicKey') && attributes.key?(:'ssh_public_key')

      self.ssh_public_key = attributes[:'ssh_public_key'] if attributes[:'ssh_public_key']

      self.quantity_per_subnet = attributes[:'quantityPerSubnet'] if attributes[:'quantityPerSubnet']

      raise 'You cannot provide both :quantityPerSubnet and :quantity_per_subnet' if attributes.key?(:'quantityPerSubnet') && attributes.key?(:'quantity_per_subnet')

      self.quantity_per_subnet = attributes[:'quantity_per_subnet'] if attributes[:'quantity_per_subnet']

      self.subnet_ids = attributes[:'subnetIds'] if attributes[:'subnetIds']

      raise 'You cannot provide both :subnetIds and :subnet_ids' if attributes.key?(:'subnetIds') && attributes.key?(:'subnet_ids')

      self.subnet_ids = attributes[:'subnet_ids'] if attributes[:'subnet_ids']

      self.nodes = attributes[:'nodes'] if attributes[:'nodes']

      self.node_config_details = attributes[:'nodeConfigDetails'] if attributes[:'nodeConfigDetails']

      raise 'You cannot provide both :nodeConfigDetails and :node_config_details' if attributes.key?(:'nodeConfigDetails') && attributes.key?(:'node_config_details')

      self.node_config_details = attributes[:'node_config_details'] if attributes[:'node_config_details']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.node_eviction_node_pool_settings = attributes[:'nodeEvictionNodePoolSettings'] if attributes[:'nodeEvictionNodePoolSettings']

      raise 'You cannot provide both :nodeEvictionNodePoolSettings and :node_eviction_node_pool_settings' if attributes.key?(:'nodeEvictionNodePoolSettings') && attributes.key?(:'node_eviction_node_pool_settings')

      self.node_eviction_node_pool_settings = attributes[:'node_eviction_node_pool_settings'] if attributes[:'node_eviction_node_pool_settings']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        compartment_id == other.compartment_id &&
        cluster_id == other.cluster_id &&
        name == other.name &&
        kubernetes_version == other.kubernetes_version &&
        node_metadata == other.node_metadata &&
        node_image_id == other.node_image_id &&
        node_image_name == other.node_image_name &&
        node_shape_config == other.node_shape_config &&
        node_source == other.node_source &&
        node_source_details == other.node_source_details &&
        node_shape == other.node_shape &&
        initial_node_labels == other.initial_node_labels &&
        ssh_public_key == other.ssh_public_key &&
        quantity_per_subnet == other.quantity_per_subnet &&
        subnet_ids == other.subnet_ids &&
        nodes == other.nodes &&
        node_config_details == other.node_config_details &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        node_eviction_node_pool_settings == other.node_eviction_node_pool_settings
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
      [id, lifecycle_state, lifecycle_details, compartment_id, cluster_id, name, kubernetes_version, node_metadata, node_image_id, node_image_name, node_shape_config, node_source, node_source_details, node_shape, initial_node_labels, ssh_public_key, quantity_per_subnet, subnet_ids, nodes, node_config_details, freeform_tags, defined_tags, system_tags, node_eviction_node_pool_settings].hash
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