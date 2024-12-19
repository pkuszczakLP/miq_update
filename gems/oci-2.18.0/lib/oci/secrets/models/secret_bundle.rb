# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The contents of the secret, properties of the secret (and secret version), and user-provided contextual metadata for the secret.
  #
  class Secrets::Models::SecretBundle
    STAGES_ENUM = [
      STAGES_CURRENT = 'CURRENT'.freeze,
      STAGES_PENDING = 'PENDING'.freeze,
      STAGES_LATEST = 'LATEST'.freeze,
      STAGES_PREVIOUS = 'PREVIOUS'.freeze,
      STAGES_DEPRECATED = 'DEPRECATED'.freeze,
      STAGES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The OCID of the secret.
    # @return [String]
    attr_accessor :secret_id

    # The time when the secret bundle was created.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The version number of the secret.
    # @return [Integer]
    attr_accessor :version_number

    # The name of the secret version. Labels are unique across the different versions of a particular secret.
    #
    # @return [String]
    attr_accessor :version_name

    # @return [OCI::Secrets::Models::SecretBundleContentDetails]
    attr_accessor :secret_bundle_content

    # An optional property indicating when to delete the secret version, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: `2019-04-03T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_of_deletion

    # An optional property indicating when the secret version will expire, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: `2019-04-03T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_of_expiry

    # A list of possible rotation states for the secret version.
    # @return [Array<String>]
    attr_reader :stages

    # Customer-provided contextual metadata for the secret.
    #
    # @return [Hash<String, Object>]
    attr_accessor :metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'secret_id': :'secretId',
        'time_created': :'timeCreated',
        'version_number': :'versionNumber',
        'version_name': :'versionName',
        'secret_bundle_content': :'secretBundleContent',
        'time_of_deletion': :'timeOfDeletion',
        'time_of_expiry': :'timeOfExpiry',
        'stages': :'stages',
        'metadata': :'metadata'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'secret_id': :'String',
        'time_created': :'DateTime',
        'version_number': :'Integer',
        'version_name': :'String',
        'secret_bundle_content': :'OCI::Secrets::Models::SecretBundleContentDetails',
        'time_of_deletion': :'DateTime',
        'time_of_expiry': :'DateTime',
        'stages': :'Array<String>',
        'metadata': :'Hash<String, Object>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :secret_id The value to assign to the {#secret_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [Integer] :version_number The value to assign to the {#version_number} property
    # @option attributes [String] :version_name The value to assign to the {#version_name} property
    # @option attributes [OCI::Secrets::Models::SecretBundleContentDetails] :secret_bundle_content The value to assign to the {#secret_bundle_content} property
    # @option attributes [DateTime] :time_of_deletion The value to assign to the {#time_of_deletion} property
    # @option attributes [DateTime] :time_of_expiry The value to assign to the {#time_of_expiry} property
    # @option attributes [Array<String>] :stages The value to assign to the {#stages} property
    # @option attributes [Hash<String, Object>] :metadata The value to assign to the {#metadata} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.secret_id = attributes[:'secretId'] if attributes[:'secretId']

      raise 'You cannot provide both :secretId and :secret_id' if attributes.key?(:'secretId') && attributes.key?(:'secret_id')

      self.secret_id = attributes[:'secret_id'] if attributes[:'secret_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.version_number = attributes[:'versionNumber'] if attributes[:'versionNumber']

      raise 'You cannot provide both :versionNumber and :version_number' if attributes.key?(:'versionNumber') && attributes.key?(:'version_number')

      self.version_number = attributes[:'version_number'] if attributes[:'version_number']

      self.version_name = attributes[:'versionName'] if attributes[:'versionName']

      raise 'You cannot provide both :versionName and :version_name' if attributes.key?(:'versionName') && attributes.key?(:'version_name')

      self.version_name = attributes[:'version_name'] if attributes[:'version_name']

      self.secret_bundle_content = attributes[:'secretBundleContent'] if attributes[:'secretBundleContent']

      raise 'You cannot provide both :secretBundleContent and :secret_bundle_content' if attributes.key?(:'secretBundleContent') && attributes.key?(:'secret_bundle_content')

      self.secret_bundle_content = attributes[:'secret_bundle_content'] if attributes[:'secret_bundle_content']

      self.time_of_deletion = attributes[:'timeOfDeletion'] if attributes[:'timeOfDeletion']

      raise 'You cannot provide both :timeOfDeletion and :time_of_deletion' if attributes.key?(:'timeOfDeletion') && attributes.key?(:'time_of_deletion')

      self.time_of_deletion = attributes[:'time_of_deletion'] if attributes[:'time_of_deletion']

      self.time_of_expiry = attributes[:'timeOfExpiry'] if attributes[:'timeOfExpiry']

      raise 'You cannot provide both :timeOfExpiry and :time_of_expiry' if attributes.key?(:'timeOfExpiry') && attributes.key?(:'time_of_expiry')

      self.time_of_expiry = attributes[:'time_of_expiry'] if attributes[:'time_of_expiry']

      self.stages = attributes[:'stages'] if attributes[:'stages']

      self.metadata = attributes[:'metadata'] if attributes[:'metadata']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] stages Object to be assigned
    def stages=(stages)
      # rubocop:disable Style/ConditionalAssignment
      if stages.nil?
        @stages = nil
      else
        @stages =
          stages.collect do |item|
            if STAGES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'stages' [#{item}]. Mapping to 'STAGES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              STAGES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        secret_id == other.secret_id &&
        time_created == other.time_created &&
        version_number == other.version_number &&
        version_name == other.version_name &&
        secret_bundle_content == other.secret_bundle_content &&
        time_of_deletion == other.time_of_deletion &&
        time_of_expiry == other.time_of_expiry &&
        stages == other.stages &&
        metadata == other.metadata
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
      [secret_id, time_created, version_number, version_name, secret_bundle_content, time_of_deletion, time_of_expiry, stages, metadata].hash
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
