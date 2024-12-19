# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Deletion policy for the DB System.
  class Mysql::Models::DeletionPolicyDetails
    AUTOMATIC_BACKUP_RETENTION_ENUM = [
      AUTOMATIC_BACKUP_RETENTION_DELETE = 'DELETE'.freeze,
      AUTOMATIC_BACKUP_RETENTION_RETAIN = 'RETAIN'.freeze,
      AUTOMATIC_BACKUP_RETENTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    FINAL_BACKUP_ENUM = [
      FINAL_BACKUP_SKIP_FINAL_BACKUP = 'SKIP_FINAL_BACKUP'.freeze,
      FINAL_BACKUP_REQUIRE_FINAL_BACKUP = 'REQUIRE_FINAL_BACKUP'.freeze,
      FINAL_BACKUP_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Specifies if any automatic backups created for a DB System should be retained or deleted when the DB System is deleted.
    #
    # @return [String]
    attr_reader :automatic_backup_retention

    # **[Required]** Specifies whether or not a backup is taken when the DB System is deleted.
    #   REQUIRE_FINAL_BACKUP: a backup is taken if the DB System is deleted.
    #   SKIP_FINAL_BACKUP: a backup is not taken if the DB System is deleted.
    #
    # @return [String]
    attr_reader :final_backup

    # **[Required]** Specifies whether the DB System can be deleted. Set to true to prevent deletion, false (default) to allow.
    #
    # @return [BOOLEAN]
    attr_accessor :is_delete_protected

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'automatic_backup_retention': :'automaticBackupRetention',
        'final_backup': :'finalBackup',
        'is_delete_protected': :'isDeleteProtected'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'automatic_backup_retention': :'String',
        'final_backup': :'String',
        'is_delete_protected': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :automatic_backup_retention The value to assign to the {#automatic_backup_retention} property
    # @option attributes [String] :final_backup The value to assign to the {#final_backup} property
    # @option attributes [BOOLEAN] :is_delete_protected The value to assign to the {#is_delete_protected} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.automatic_backup_retention = attributes[:'automaticBackupRetention'] if attributes[:'automaticBackupRetention']
      self.automatic_backup_retention = "DELETE" if automatic_backup_retention.nil? && !attributes.key?(:'automaticBackupRetention') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :automaticBackupRetention and :automatic_backup_retention' if attributes.key?(:'automaticBackupRetention') && attributes.key?(:'automatic_backup_retention')

      self.automatic_backup_retention = attributes[:'automatic_backup_retention'] if attributes[:'automatic_backup_retention']
      self.automatic_backup_retention = "DELETE" if automatic_backup_retention.nil? && !attributes.key?(:'automaticBackupRetention') && !attributes.key?(:'automatic_backup_retention') # rubocop:disable Style/StringLiterals

      self.final_backup = attributes[:'finalBackup'] if attributes[:'finalBackup']
      self.final_backup = "SKIP_FINAL_BACKUP" if final_backup.nil? && !attributes.key?(:'finalBackup') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :finalBackup and :final_backup' if attributes.key?(:'finalBackup') && attributes.key?(:'final_backup')

      self.final_backup = attributes[:'final_backup'] if attributes[:'final_backup']
      self.final_backup = "SKIP_FINAL_BACKUP" if final_backup.nil? && !attributes.key?(:'finalBackup') && !attributes.key?(:'final_backup') # rubocop:disable Style/StringLiterals

      self.is_delete_protected = attributes[:'isDeleteProtected'] unless attributes[:'isDeleteProtected'].nil?
      self.is_delete_protected = false if is_delete_protected.nil? && !attributes.key?(:'isDeleteProtected') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isDeleteProtected and :is_delete_protected' if attributes.key?(:'isDeleteProtected') && attributes.key?(:'is_delete_protected')

      self.is_delete_protected = attributes[:'is_delete_protected'] unless attributes[:'is_delete_protected'].nil?
      self.is_delete_protected = false if is_delete_protected.nil? && !attributes.key?(:'isDeleteProtected') && !attributes.key?(:'is_delete_protected') # rubocop:disable Style/StringLiterals
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] automatic_backup_retention Object to be assigned
    def automatic_backup_retention=(automatic_backup_retention)
      # rubocop:disable Style/ConditionalAssignment
      if automatic_backup_retention && !AUTOMATIC_BACKUP_RETENTION_ENUM.include?(automatic_backup_retention)
        OCI.logger.debug("Unknown value for 'automatic_backup_retention' [" + automatic_backup_retention + "]. Mapping to 'AUTOMATIC_BACKUP_RETENTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @automatic_backup_retention = AUTOMATIC_BACKUP_RETENTION_UNKNOWN_ENUM_VALUE
      else
        @automatic_backup_retention = automatic_backup_retention
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] final_backup Object to be assigned
    def final_backup=(final_backup)
      # rubocop:disable Style/ConditionalAssignment
      if final_backup && !FINAL_BACKUP_ENUM.include?(final_backup)
        OCI.logger.debug("Unknown value for 'final_backup' [" + final_backup + "]. Mapping to 'FINAL_BACKUP_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @final_backup = FINAL_BACKUP_UNKNOWN_ENUM_VALUE
      else
        @final_backup = final_backup
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        automatic_backup_retention == other.automatic_backup_retention &&
        final_backup == other.final_backup &&
        is_delete_protected == other.is_delete_protected
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
      [automatic_backup_retention, final_backup, is_delete_protected].hash
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
