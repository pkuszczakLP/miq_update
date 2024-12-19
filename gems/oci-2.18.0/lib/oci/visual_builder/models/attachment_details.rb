# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of an attachments for this instance
  class VisualBuilder::Models::AttachmentDetails
    TARGET_ROLE_ENUM = [
      TARGET_ROLE_PARENT = 'PARENT'.freeze,
      TARGET_ROLE_CHILD = 'CHILD'.freeze,
      TARGET_ROLE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The role of the target attachment.
    #    * `PARENT` - The target instance is the parent of this attachment.
    #    * `CHILD` - The target instance is the child of this attachment.
    #
    # @return [String]
    attr_reader :target_role

    # **[Required]** * If role == `PARENT`, the attached instance was created by this service instance
    # * If role == `CHILD`, this instance was created from attached instance on behalf of a user
    #
    # @return [BOOLEAN]
    attr_accessor :is_implicit

    # **[Required]** The OCID of the target instance (which could be any other OCI PaaS/SaaS resource), to which this instance is attached.
    # @return [String]
    attr_accessor :target_id

    # **[Required]** The dataplane instance URL of the attached instance
    # @return [String]
    attr_accessor :target_instance_url

    # **[Required]** The type of the target instance, such as \"FUSION\".
    # @return [String]
    attr_accessor :target_service_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'target_role': :'targetRole',
        'is_implicit': :'isImplicit',
        'target_id': :'targetId',
        'target_instance_url': :'targetInstanceUrl',
        'target_service_type': :'targetServiceType'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'target_role': :'String',
        'is_implicit': :'BOOLEAN',
        'target_id': :'String',
        'target_instance_url': :'String',
        'target_service_type': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :target_role The value to assign to the {#target_role} property
    # @option attributes [BOOLEAN] :is_implicit The value to assign to the {#is_implicit} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [String] :target_instance_url The value to assign to the {#target_instance_url} property
    # @option attributes [String] :target_service_type The value to assign to the {#target_service_type} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.target_role = attributes[:'targetRole'] if attributes[:'targetRole']

      raise 'You cannot provide both :targetRole and :target_role' if attributes.key?(:'targetRole') && attributes.key?(:'target_role')

      self.target_role = attributes[:'target_role'] if attributes[:'target_role']

      self.is_implicit = attributes[:'isImplicit'] unless attributes[:'isImplicit'].nil?

      raise 'You cannot provide both :isImplicit and :is_implicit' if attributes.key?(:'isImplicit') && attributes.key?(:'is_implicit')

      self.is_implicit = attributes[:'is_implicit'] unless attributes[:'is_implicit'].nil?

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.target_instance_url = attributes[:'targetInstanceUrl'] if attributes[:'targetInstanceUrl']

      raise 'You cannot provide both :targetInstanceUrl and :target_instance_url' if attributes.key?(:'targetInstanceUrl') && attributes.key?(:'target_instance_url')

      self.target_instance_url = attributes[:'target_instance_url'] if attributes[:'target_instance_url']

      self.target_service_type = attributes[:'targetServiceType'] if attributes[:'targetServiceType']

      raise 'You cannot provide both :targetServiceType and :target_service_type' if attributes.key?(:'targetServiceType') && attributes.key?(:'target_service_type')

      self.target_service_type = attributes[:'target_service_type'] if attributes[:'target_service_type']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] target_role Object to be assigned
    def target_role=(target_role)
      # rubocop:disable Style/ConditionalAssignment
      if target_role && !TARGET_ROLE_ENUM.include?(target_role)
        OCI.logger.debug("Unknown value for 'target_role' [" + target_role + "]. Mapping to 'TARGET_ROLE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @target_role = TARGET_ROLE_UNKNOWN_ENUM_VALUE
      else
        @target_role = target_role
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        target_role == other.target_role &&
        is_implicit == other.is_implicit &&
        target_id == other.target_id &&
        target_instance_url == other.target_instance_url &&
        target_service_type == other.target_service_type
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
      [target_role, is_implicit, target_id, target_instance_url, target_service_type].hash
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
