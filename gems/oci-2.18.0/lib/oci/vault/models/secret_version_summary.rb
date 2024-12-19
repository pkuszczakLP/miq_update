# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The secret version summary object, which doesn't include the contents of the secret.
  class Vault::Models::SecretVersionSummary
    CONTENT_TYPE_ENUM = [
      CONTENT_TYPE_BASE64 = 'BASE64'.freeze,
      CONTENT_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    STAGES_ENUM = [
      STAGES_CURRENT = 'CURRENT'.freeze,
      STAGES_PENDING = 'PENDING'.freeze,
      STAGES_LATEST = 'LATEST'.freeze,
      STAGES_PREVIOUS = 'PREVIOUS'.freeze,
      STAGES_DEPRECATED = 'DEPRECATED'.freeze,
      STAGES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The content type of the secret version's secret contents.
    # @return [String]
    attr_reader :content_type

    # The name of the secret version. A name is unique across versions of a secret.
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The OCID of the secret.
    # @return [String]
    attr_accessor :secret_id

    # A list of possible rotation states for the secret version. A secret version marked `CURRENT` is currently in use. A secret version
    # marked `PENDING` is staged and available for use, but has not been applied on the target system and, therefore, has not been rotated
    # into current, active use. The secret most recently uploaded to a vault is always marked `LATEST`. (The first version of a secret is
    # always marked as both `CURRENT` and `LATEST`.) A secret version marked `PREVIOUS` is the secret version that was most recently marked
    # `CURRENT`, before the last secret version rotation. A secret version marked `DEPRECATED` is neither current, pending, nor the previous
    # one in use. Only secret versions marked `DEPRECATED` can be scheduled for deletion.
    #
    # @return [Array<String>]
    attr_reader :stages

    # **[Required]** A optional property indicating when the secret version was created, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339) timestamp format.
    # Example: `2019-04-03T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

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

    # **[Required]** The version number of the secret.
    # @return [Integer]
    attr_accessor :version_number

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'content_type': :'contentType',
        'name': :'name',
        'secret_id': :'secretId',
        'stages': :'stages',
        'time_created': :'timeCreated',
        'time_of_deletion': :'timeOfDeletion',
        'time_of_expiry': :'timeOfExpiry',
        'version_number': :'versionNumber'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'content_type': :'String',
        'name': :'String',
        'secret_id': :'String',
        'stages': :'Array<String>',
        'time_created': :'DateTime',
        'time_of_deletion': :'DateTime',
        'time_of_expiry': :'DateTime',
        'version_number': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :content_type The value to assign to the {#content_type} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :secret_id The value to assign to the {#secret_id} property
    # @option attributes [Array<String>] :stages The value to assign to the {#stages} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_of_deletion The value to assign to the {#time_of_deletion} property
    # @option attributes [DateTime] :time_of_expiry The value to assign to the {#time_of_expiry} property
    # @option attributes [Integer] :version_number The value to assign to the {#version_number} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.content_type = attributes[:'contentType'] if attributes[:'contentType']

      raise 'You cannot provide both :contentType and :content_type' if attributes.key?(:'contentType') && attributes.key?(:'content_type')

      self.content_type = attributes[:'content_type'] if attributes[:'content_type']

      self.name = attributes[:'name'] if attributes[:'name']

      self.secret_id = attributes[:'secretId'] if attributes[:'secretId']

      raise 'You cannot provide both :secretId and :secret_id' if attributes.key?(:'secretId') && attributes.key?(:'secret_id')

      self.secret_id = attributes[:'secret_id'] if attributes[:'secret_id']

      self.stages = attributes[:'stages'] if attributes[:'stages']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_of_deletion = attributes[:'timeOfDeletion'] if attributes[:'timeOfDeletion']

      raise 'You cannot provide both :timeOfDeletion and :time_of_deletion' if attributes.key?(:'timeOfDeletion') && attributes.key?(:'time_of_deletion')

      self.time_of_deletion = attributes[:'time_of_deletion'] if attributes[:'time_of_deletion']

      self.time_of_expiry = attributes[:'timeOfExpiry'] if attributes[:'timeOfExpiry']

      raise 'You cannot provide both :timeOfExpiry and :time_of_expiry' if attributes.key?(:'timeOfExpiry') && attributes.key?(:'time_of_expiry')

      self.time_of_expiry = attributes[:'time_of_expiry'] if attributes[:'time_of_expiry']

      self.version_number = attributes[:'versionNumber'] if attributes[:'versionNumber']

      raise 'You cannot provide both :versionNumber and :version_number' if attributes.key?(:'versionNumber') && attributes.key?(:'version_number')

      self.version_number = attributes[:'version_number'] if attributes[:'version_number']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] content_type Object to be assigned
    def content_type=(content_type)
      # rubocop:disable Style/ConditionalAssignment
      if content_type && !CONTENT_TYPE_ENUM.include?(content_type)
        OCI.logger.debug("Unknown value for 'content_type' [" + content_type + "]. Mapping to 'CONTENT_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @content_type = CONTENT_TYPE_UNKNOWN_ENUM_VALUE
      else
        @content_type = content_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

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
        content_type == other.content_type &&
        name == other.name &&
        secret_id == other.secret_id &&
        stages == other.stages &&
        time_created == other.time_created &&
        time_of_deletion == other.time_of_deletion &&
        time_of_expiry == other.time_of_expiry &&
        version_number == other.version_number
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
      [content_type, name, secret_id, stages, time_created, time_of_deletion, time_of_expiry, version_number].hash
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
