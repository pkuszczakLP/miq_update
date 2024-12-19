# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Response object for obtaining list of changed files.
  class Devops::Models::DiffResponse
    # Boolean value to indicate if all changes are included in the response.
    # @return [BOOLEAN]
    attr_accessor :are_all_changes_included

    # Count of each type of change in difference.
    # @return [Hash<String, Integer>]
    attr_accessor :change_type_count

    # The ID of the common commit between source and target.
    # @return [String]
    attr_accessor :common_commit

    # The number of commits source is ahead of target by.
    # @return [Integer]
    attr_accessor :commits_ahead_count

    # The number of commits source is behind target by.
    # @return [Integer]
    attr_accessor :commits_behind_count

    # The number of lines added in whole difference.
    # @return [Integer]
    attr_accessor :added_lines_count

    # The number of lines deleted in whole difference.
    # @return [Integer]
    attr_accessor :deleted_lines_count

    # **[Required]** List of changes in the difference.
    # @return [Array<OCI::Devops::Models::DiffResponseEntry>]
    attr_accessor :changes

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'are_all_changes_included': :'areAllChangesIncluded',
        'change_type_count': :'changeTypeCount',
        'common_commit': :'commonCommit',
        'commits_ahead_count': :'commitsAheadCount',
        'commits_behind_count': :'commitsBehindCount',
        'added_lines_count': :'addedLinesCount',
        'deleted_lines_count': :'deletedLinesCount',
        'changes': :'changes'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'are_all_changes_included': :'BOOLEAN',
        'change_type_count': :'Hash<String, Integer>',
        'common_commit': :'String',
        'commits_ahead_count': :'Integer',
        'commits_behind_count': :'Integer',
        'added_lines_count': :'Integer',
        'deleted_lines_count': :'Integer',
        'changes': :'Array<OCI::Devops::Models::DiffResponseEntry>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :are_all_changes_included The value to assign to the {#are_all_changes_included} property
    # @option attributes [Hash<String, Integer>] :change_type_count The value to assign to the {#change_type_count} property
    # @option attributes [String] :common_commit The value to assign to the {#common_commit} property
    # @option attributes [Integer] :commits_ahead_count The value to assign to the {#commits_ahead_count} property
    # @option attributes [Integer] :commits_behind_count The value to assign to the {#commits_behind_count} property
    # @option attributes [Integer] :added_lines_count The value to assign to the {#added_lines_count} property
    # @option attributes [Integer] :deleted_lines_count The value to assign to the {#deleted_lines_count} property
    # @option attributes [Array<OCI::Devops::Models::DiffResponseEntry>] :changes The value to assign to the {#changes} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.are_all_changes_included = attributes[:'areAllChangesIncluded'] unless attributes[:'areAllChangesIncluded'].nil?

      raise 'You cannot provide both :areAllChangesIncluded and :are_all_changes_included' if attributes.key?(:'areAllChangesIncluded') && attributes.key?(:'are_all_changes_included')

      self.are_all_changes_included = attributes[:'are_all_changes_included'] unless attributes[:'are_all_changes_included'].nil?

      self.change_type_count = attributes[:'changeTypeCount'] if attributes[:'changeTypeCount']

      raise 'You cannot provide both :changeTypeCount and :change_type_count' if attributes.key?(:'changeTypeCount') && attributes.key?(:'change_type_count')

      self.change_type_count = attributes[:'change_type_count'] if attributes[:'change_type_count']

      self.common_commit = attributes[:'commonCommit'] if attributes[:'commonCommit']

      raise 'You cannot provide both :commonCommit and :common_commit' if attributes.key?(:'commonCommit') && attributes.key?(:'common_commit')

      self.common_commit = attributes[:'common_commit'] if attributes[:'common_commit']

      self.commits_ahead_count = attributes[:'commitsAheadCount'] if attributes[:'commitsAheadCount']

      raise 'You cannot provide both :commitsAheadCount and :commits_ahead_count' if attributes.key?(:'commitsAheadCount') && attributes.key?(:'commits_ahead_count')

      self.commits_ahead_count = attributes[:'commits_ahead_count'] if attributes[:'commits_ahead_count']

      self.commits_behind_count = attributes[:'commitsBehindCount'] if attributes[:'commitsBehindCount']

      raise 'You cannot provide both :commitsBehindCount and :commits_behind_count' if attributes.key?(:'commitsBehindCount') && attributes.key?(:'commits_behind_count')

      self.commits_behind_count = attributes[:'commits_behind_count'] if attributes[:'commits_behind_count']

      self.added_lines_count = attributes[:'addedLinesCount'] if attributes[:'addedLinesCount']

      raise 'You cannot provide both :addedLinesCount and :added_lines_count' if attributes.key?(:'addedLinesCount') && attributes.key?(:'added_lines_count')

      self.added_lines_count = attributes[:'added_lines_count'] if attributes[:'added_lines_count']

      self.deleted_lines_count = attributes[:'deletedLinesCount'] if attributes[:'deletedLinesCount']

      raise 'You cannot provide both :deletedLinesCount and :deleted_lines_count' if attributes.key?(:'deletedLinesCount') && attributes.key?(:'deleted_lines_count')

      self.deleted_lines_count = attributes[:'deleted_lines_count'] if attributes[:'deleted_lines_count']

      self.changes = attributes[:'changes'] if attributes[:'changes']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        are_all_changes_included == other.are_all_changes_included &&
        change_type_count == other.change_type_count &&
        common_commit == other.common_commit &&
        commits_ahead_count == other.commits_ahead_count &&
        commits_behind_count == other.commits_behind_count &&
        added_lines_count == other.added_lines_count &&
        deleted_lines_count == other.deleted_lines_count &&
        changes == other.changes
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
      [are_all_changes_included, change_type_count, common_commit, commits_ahead_count, commits_behind_count, added_lines_count, deleted_lines_count, changes].hash
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
