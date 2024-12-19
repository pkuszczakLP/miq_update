# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Oracle Database software version.
  #
  # To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized, talk to an administrator. If you're an administrator who needs to write policies to give users access, see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).
  #
  class Database::Models::DbVersionSummary
    # **[Required]** A valid Oracle Database version.
    # @return [String]
    attr_accessor :version

    # True if this version of the Oracle Database software is the latest version for a release.
    # @return [BOOLEAN]
    attr_accessor :is_latest_for_major_version

    # True if this version of the Oracle Database software supports pluggable databases.
    # @return [BOOLEAN]
    attr_accessor :supports_pdb

    # True if this version of the Oracle Database software is the preview version.
    # @return [BOOLEAN]
    attr_accessor :is_preview_db_version

    # True if this version of the Oracle Database software is supported for Upgrade.
    # @return [BOOLEAN]
    attr_accessor :is_upgrade_supported

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'version': :'version',
        'is_latest_for_major_version': :'isLatestForMajorVersion',
        'supports_pdb': :'supportsPdb',
        'is_preview_db_version': :'isPreviewDbVersion',
        'is_upgrade_supported': :'isUpgradeSupported'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'version': :'String',
        'is_latest_for_major_version': :'BOOLEAN',
        'supports_pdb': :'BOOLEAN',
        'is_preview_db_version': :'BOOLEAN',
        'is_upgrade_supported': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :version The value to assign to the {#version} property
    # @option attributes [BOOLEAN] :is_latest_for_major_version The value to assign to the {#is_latest_for_major_version} property
    # @option attributes [BOOLEAN] :supports_pdb The value to assign to the {#supports_pdb} property
    # @option attributes [BOOLEAN] :is_preview_db_version The value to assign to the {#is_preview_db_version} property
    # @option attributes [BOOLEAN] :is_upgrade_supported The value to assign to the {#is_upgrade_supported} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.version = attributes[:'version'] if attributes[:'version']

      self.is_latest_for_major_version = attributes[:'isLatestForMajorVersion'] unless attributes[:'isLatestForMajorVersion'].nil?

      raise 'You cannot provide both :isLatestForMajorVersion and :is_latest_for_major_version' if attributes.key?(:'isLatestForMajorVersion') && attributes.key?(:'is_latest_for_major_version')

      self.is_latest_for_major_version = attributes[:'is_latest_for_major_version'] unless attributes[:'is_latest_for_major_version'].nil?

      self.supports_pdb = attributes[:'supportsPdb'] unless attributes[:'supportsPdb'].nil?

      raise 'You cannot provide both :supportsPdb and :supports_pdb' if attributes.key?(:'supportsPdb') && attributes.key?(:'supports_pdb')

      self.supports_pdb = attributes[:'supports_pdb'] unless attributes[:'supports_pdb'].nil?

      self.is_preview_db_version = attributes[:'isPreviewDbVersion'] unless attributes[:'isPreviewDbVersion'].nil?

      raise 'You cannot provide both :isPreviewDbVersion and :is_preview_db_version' if attributes.key?(:'isPreviewDbVersion') && attributes.key?(:'is_preview_db_version')

      self.is_preview_db_version = attributes[:'is_preview_db_version'] unless attributes[:'is_preview_db_version'].nil?

      self.is_upgrade_supported = attributes[:'isUpgradeSupported'] unless attributes[:'isUpgradeSupported'].nil?

      raise 'You cannot provide both :isUpgradeSupported and :is_upgrade_supported' if attributes.key?(:'isUpgradeSupported') && attributes.key?(:'is_upgrade_supported')

      self.is_upgrade_supported = attributes[:'is_upgrade_supported'] unless attributes[:'is_upgrade_supported'].nil?
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        version == other.version &&
        is_latest_for_major_version == other.is_latest_for_major_version &&
        supports_pdb == other.supports_pdb &&
        is_preview_db_version == other.is_preview_db_version &&
        is_upgrade_supported == other.is_upgrade_supported
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
      [version, is_latest_for_major_version, supports_pdb, is_preview_db_version, is_upgrade_supported].hash
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