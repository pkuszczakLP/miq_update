# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The properties that define a cluster summary.
  class ContainerEngine::Models::ClusterSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The OCID of the cluster.
    # @return [String]
    attr_accessor :id

    # The name of the cluster.
    # @return [String]
    attr_accessor :name

    # The OCID of the compartment in which the cluster exists.
    # @return [String]
    attr_accessor :compartment_id

    # The network configuration for access to the Cluster control plane.
    #
    # @return [OCI::ContainerEngine::Models::ClusterEndpointConfig]
    attr_accessor :endpoint_config

    # The OCID of the virtual cloud network (VCN) in which the cluster exists
    # @return [String]
    attr_accessor :vcn_id

    # The version of Kubernetes running on the cluster masters.
    # @return [String]
    attr_accessor :kubernetes_version

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

    # Optional attributes for the cluster.
    # @return [OCI::ContainerEngine::Models::ClusterCreateOptions]
    attr_accessor :options

    # Metadata about the cluster.
    # @return [OCI::ContainerEngine::Models::ClusterMetadata]
    attr_accessor :metadata

    # The state of the cluster masters.
    # @return [String]
    attr_reader :lifecycle_state

    # Details about the state of the cluster masters.
    # @return [String]
    attr_accessor :lifecycle_details

    # Endpoints served up by the cluster masters.
    # @return [OCI::ContainerEngine::Models::ClusterEndpoints]
    attr_accessor :endpoints

    # Available Kubernetes versions to which the clusters masters may be upgraded.
    # @return [Array<String>]
    attr_accessor :available_kubernetes_upgrades

    # The image verification policy for signature validation.
    #
    # @return [OCI::ContainerEngine::Models::ImagePolicyConfig]
    attr_accessor :image_policy_config

    # Available CNIs and network options for existing and new node pools of the cluster
    # @return [Array<OCI::ContainerEngine::Models::ClusterPodNetworkOptionDetails>]
    attr_accessor :cluster_pod_network_options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'endpoint_config': :'endpointConfig',
        'vcn_id': :'vcnId',
        'kubernetes_version': :'kubernetesVersion',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags',
        'options': :'options',
        'metadata': :'metadata',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_details': :'lifecycleDetails',
        'endpoints': :'endpoints',
        'available_kubernetes_upgrades': :'availableKubernetesUpgrades',
        'image_policy_config': :'imagePolicyConfig',
        'cluster_pod_network_options': :'clusterPodNetworkOptions'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'name': :'String',
        'compartment_id': :'String',
        'endpoint_config': :'OCI::ContainerEngine::Models::ClusterEndpointConfig',
        'vcn_id': :'String',
        'kubernetes_version': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>',
        'options': :'OCI::ContainerEngine::Models::ClusterCreateOptions',
        'metadata': :'OCI::ContainerEngine::Models::ClusterMetadata',
        'lifecycle_state': :'String',
        'lifecycle_details': :'String',
        'endpoints': :'OCI::ContainerEngine::Models::ClusterEndpoints',
        'available_kubernetes_upgrades': :'Array<String>',
        'image_policy_config': :'OCI::ContainerEngine::Models::ImagePolicyConfig',
        'cluster_pod_network_options': :'Array<OCI::ContainerEngine::Models::ClusterPodNetworkOptionDetails>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [OCI::ContainerEngine::Models::ClusterEndpointConfig] :endpoint_config The value to assign to the {#endpoint_config} property
    # @option attributes [String] :vcn_id The value to assign to the {#vcn_id} property
    # @option attributes [String] :kubernetes_version The value to assign to the {#kubernetes_version} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    # @option attributes [OCI::ContainerEngine::Models::ClusterCreateOptions] :options The value to assign to the {#options} property
    # @option attributes [OCI::ContainerEngine::Models::ClusterMetadata] :metadata The value to assign to the {#metadata} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_details The value to assign to the {#lifecycle_details} property
    # @option attributes [OCI::ContainerEngine::Models::ClusterEndpoints] :endpoints The value to assign to the {#endpoints} property
    # @option attributes [Array<String>] :available_kubernetes_upgrades The value to assign to the {#available_kubernetes_upgrades} property
    # @option attributes [OCI::ContainerEngine::Models::ImagePolicyConfig] :image_policy_config The value to assign to the {#image_policy_config} property
    # @option attributes [Array<OCI::ContainerEngine::Models::ClusterPodNetworkOptionDetails>] :cluster_pod_network_options The value to assign to the {#cluster_pod_network_options} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.endpoint_config = attributes[:'endpointConfig'] if attributes[:'endpointConfig']

      raise 'You cannot provide both :endpointConfig and :endpoint_config' if attributes.key?(:'endpointConfig') && attributes.key?(:'endpoint_config')

      self.endpoint_config = attributes[:'endpoint_config'] if attributes[:'endpoint_config']

      self.vcn_id = attributes[:'vcnId'] if attributes[:'vcnId']

      raise 'You cannot provide both :vcnId and :vcn_id' if attributes.key?(:'vcnId') && attributes.key?(:'vcn_id')

      self.vcn_id = attributes[:'vcn_id'] if attributes[:'vcn_id']

      self.kubernetes_version = attributes[:'kubernetesVersion'] if attributes[:'kubernetesVersion']

      raise 'You cannot provide both :kubernetesVersion and :kubernetes_version' if attributes.key?(:'kubernetesVersion') && attributes.key?(:'kubernetes_version')

      self.kubernetes_version = attributes[:'kubernetes_version'] if attributes[:'kubernetes_version']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']

      self.options = attributes[:'options'] if attributes[:'options']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_details = attributes[:'lifecycleDetails'] if attributes[:'lifecycleDetails']

      raise 'You cannot provide both :lifecycleDetails and :lifecycle_details' if attributes.key?(:'lifecycleDetails') && attributes.key?(:'lifecycle_details')

      self.lifecycle_details = attributes[:'lifecycle_details'] if attributes[:'lifecycle_details']

      self.endpoints = attributes[:'endpoints'] if attributes[:'endpoints']

      self.available_kubernetes_upgrades = attributes[:'availableKubernetesUpgrades'] if attributes[:'availableKubernetesUpgrades']

      raise 'You cannot provide both :availableKubernetesUpgrades and :available_kubernetes_upgrades' if attributes.key?(:'availableKubernetesUpgrades') && attributes.key?(:'available_kubernetes_upgrades')

      self.available_kubernetes_upgrades = attributes[:'available_kubernetes_upgrades'] if attributes[:'available_kubernetes_upgrades']

      self.image_policy_config = attributes[:'imagePolicyConfig'] if attributes[:'imagePolicyConfig']

      raise 'You cannot provide both :imagePolicyConfig and :image_policy_config' if attributes.key?(:'imagePolicyConfig') && attributes.key?(:'image_policy_config')

      self.image_policy_config = attributes[:'image_policy_config'] if attributes[:'image_policy_config']

      self.cluster_pod_network_options = attributes[:'clusterPodNetworkOptions'] if attributes[:'clusterPodNetworkOptions']

      raise 'You cannot provide both :clusterPodNetworkOptions and :cluster_pod_network_options' if attributes.key?(:'clusterPodNetworkOptions') && attributes.key?(:'cluster_pod_network_options')

      self.cluster_pod_network_options = attributes[:'cluster_pod_network_options'] if attributes[:'cluster_pod_network_options']
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
        name == other.name &&
        compartment_id == other.compartment_id &&
        endpoint_config == other.endpoint_config &&
        vcn_id == other.vcn_id &&
        kubernetes_version == other.kubernetes_version &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags &&
        options == other.options &&
        metadata == other.metadata &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_details == other.lifecycle_details &&
        endpoints == other.endpoints &&
        available_kubernetes_upgrades == other.available_kubernetes_upgrades &&
        image_policy_config == other.image_policy_config &&
        cluster_pod_network_options == other.cluster_pod_network_options
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
      [id, name, compartment_id, endpoint_config, vcn_id, kubernetes_version, freeform_tags, defined_tags, system_tags, options, metadata, lifecycle_state, lifecycle_details, endpoints, available_kubernetes_upgrades, image_policy_config, cluster_pod_network_options].hash
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
