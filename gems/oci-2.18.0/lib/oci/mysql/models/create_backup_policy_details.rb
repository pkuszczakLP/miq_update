# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Backup policy as optionally used for DB System Creation.
  #
  class Mysql::Models::CreateBackupPolicyDetails
    # Specifies if automatic backups are enabled.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # The start of a 30-minute window of time in which daily, automated backups occur.
    #
    # This should be in the format of the \"Time\" portion of an RFC3339-formatted timestamp. Any second or sub-second time data will be truncated to zero.
    #
    # At some point in the window, the system may incur a brief service disruption as the backup is performed.
    #
    # @return [String]
    attr_accessor :window_start_time

    # Number of days to retain an automatic backup.
    # @return [Integer]
    attr_accessor :retention_in_days

    # Simple key-value pair applied without any predefined name, type or scope. Exists for cross-compatibility only.
    #
    # Tags defined here will be copied verbatim as tags on the Backup resource created by this BackupPolicy.
    #
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    #
    # Tags defined here will be copied verbatim as tags on the Backup resource created by this BackupPolicy.
    #
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # @return [OCI::Mysql::Models::PitrPolicy]
    attr_accessor :pitr_policy

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'isEnabled',
        'window_start_time': :'windowStartTime',
        'retention_in_days': :'retentionInDays',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'pitr_policy': :'pitrPolicy'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_enabled': :'BOOLEAN',
        'window_start_time': :'String',
        'retention_in_days': :'Integer',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'pitr_policy': :'OCI::Mysql::Models::PitrPolicy'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [String] :window_start_time The value to assign to the {#window_start_time} property
    # @option attributes [Integer] :retention_in_days The value to assign to the {#retention_in_days} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [OCI::Mysql::Models::PitrPolicy] :pitr_policy The value to assign to the {#pitr_policy} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?
      self.is_enabled = true if is_enabled.nil? && !attributes.key?(:'isEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?
      self.is_enabled = true if is_enabled.nil? && !attributes.key?(:'isEnabled') && !attributes.key?(:'is_enabled') # rubocop:disable Style/StringLiterals

      self.window_start_time = attributes[:'windowStartTime'] if attributes[:'windowStartTime']

      raise 'You cannot provide both :windowStartTime and :window_start_time' if attributes.key?(:'windowStartTime') && attributes.key?(:'window_start_time')

      self.window_start_time = attributes[:'window_start_time'] if attributes[:'window_start_time']

      self.retention_in_days = attributes[:'retentionInDays'] if attributes[:'retentionInDays']

      raise 'You cannot provide both :retentionInDays and :retention_in_days' if attributes.key?(:'retentionInDays') && attributes.key?(:'retention_in_days')

      self.retention_in_days = attributes[:'retention_in_days'] if attributes[:'retention_in_days']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.pitr_policy = attributes[:'pitrPolicy'] if attributes[:'pitrPolicy']

      raise 'You cannot provide both :pitrPolicy and :pitr_policy' if attributes.key?(:'pitrPolicy') && attributes.key?(:'pitr_policy')

      self.pitr_policy = attributes[:'pitr_policy'] if attributes[:'pitr_policy']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_enabled == other.is_enabled &&
        window_start_time == other.window_start_time &&
        retention_in_days == other.retention_in_days &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        pitr_policy == other.pitr_policy
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
      [is_enabled, window_start_time, retention_in_days, freeform_tags, defined_tags, pitr_policy].hash
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
