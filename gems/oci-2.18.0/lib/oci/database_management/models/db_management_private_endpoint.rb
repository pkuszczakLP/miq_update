# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A Database Management private endpoint allows Database Management to connect to databases in a Virtual Cloud Network (VCN).
  class DatabaseManagement::Models::DbManagementPrivateEndpoint
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Management private endpoint.
    # @return [String]
    attr_accessor :id

    # **[Required]** The display name of the Database Management private endpoint.
    # @return [String]
    attr_accessor :name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # Specifies whether the Database Management private endpoint can be used for Oracle Databases in a cluster.
    # @return [BOOLEAN]
    attr_accessor :is_cluster

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the VCN.
    # @return [String]
    attr_accessor :vcn_id

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet.
    # @return [String]
    attr_accessor :subnet_id

    # The IP addresses assigned to the Database Management private endpoint.
    #
    # @return [String]
    attr_accessor :private_ip

    # The description of the Database Management private endpoint.
    # @return [String]
    attr_accessor :description

    # The date and time the Database Managament private endpoint was created, in the format defined by [RFC3339](https://tools.ietf.org/html/rfc3339).
    # @return [DateTime]
    attr_accessor :time_created

    # The current lifecycle state of the Database Management private endpoint.
    # @return [String]
    attr_reader :lifecycle_state

    # The OCIDs of the Network Security Groups to which the Database Management private endpoint belongs.
    #
    # @return [Array<String>]
    attr_accessor :nsg_ids

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'name': :'name',
        'compartment_id': :'compartmentId',
        'is_cluster': :'isCluster',
        'vcn_id': :'vcnId',
        'subnet_id': :'subnetId',
        'private_ip': :'privateIp',
        'description': :'description',
        'time_created': :'timeCreated',
        'lifecycle_state': :'lifecycleState',
        'nsg_ids': :'nsgIds'
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
        'is_cluster': :'BOOLEAN',
        'vcn_id': :'String',
        'subnet_id': :'String',
        'private_ip': :'String',
        'description': :'String',
        'time_created': :'DateTime',
        'lifecycle_state': :'String',
        'nsg_ids': :'Array<String>'
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
    # @option attributes [BOOLEAN] :is_cluster The value to assign to the {#is_cluster} property
    # @option attributes [String] :vcn_id The value to assign to the {#vcn_id} property
    # @option attributes [String] :subnet_id The value to assign to the {#subnet_id} property
    # @option attributes [String] :private_ip The value to assign to the {#private_ip} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Array<String>] :nsg_ids The value to assign to the {#nsg_ids} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.is_cluster = attributes[:'isCluster'] unless attributes[:'isCluster'].nil?

      raise 'You cannot provide both :isCluster and :is_cluster' if attributes.key?(:'isCluster') && attributes.key?(:'is_cluster')

      self.is_cluster = attributes[:'is_cluster'] unless attributes[:'is_cluster'].nil?

      self.vcn_id = attributes[:'vcnId'] if attributes[:'vcnId']

      raise 'You cannot provide both :vcnId and :vcn_id' if attributes.key?(:'vcnId') && attributes.key?(:'vcn_id')

      self.vcn_id = attributes[:'vcn_id'] if attributes[:'vcn_id']

      self.subnet_id = attributes[:'subnetId'] if attributes[:'subnetId']

      raise 'You cannot provide both :subnetId and :subnet_id' if attributes.key?(:'subnetId') && attributes.key?(:'subnet_id')

      self.subnet_id = attributes[:'subnet_id'] if attributes[:'subnet_id']

      self.private_ip = attributes[:'privateIp'] if attributes[:'privateIp']

      raise 'You cannot provide both :privateIp and :private_ip' if attributes.key?(:'privateIp') && attributes.key?(:'private_ip')

      self.private_ip = attributes[:'private_ip'] if attributes[:'private_ip']

      self.description = attributes[:'description'] if attributes[:'description']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.nsg_ids = attributes[:'nsgIds'] if attributes[:'nsgIds']

      raise 'You cannot provide both :nsgIds and :nsg_ids' if attributes.key?(:'nsgIds') && attributes.key?(:'nsg_ids')

      self.nsg_ids = attributes[:'nsg_ids'] if attributes[:'nsg_ids']
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
        is_cluster == other.is_cluster &&
        vcn_id == other.vcn_id &&
        subnet_id == other.subnet_id &&
        private_ip == other.private_ip &&
        description == other.description &&
        time_created == other.time_created &&
        lifecycle_state == other.lifecycle_state &&
        nsg_ids == other.nsg_ids
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
      [id, name, compartment_id, is_cluster, vcn_id, subnet_id, private_ip, description, time_created, lifecycle_state, nsg_ids].hash
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
