# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Commit object with commit information.
  class Devops::Models::RepositoryCommit
    # **[Required]** Commit hash pointed to by reference name.
    # @return [String]
    attr_accessor :commit_id

    # **[Required]** The commit message.
    # @return [String]
    attr_accessor :commit_message

    # Name of the author of the repository.
    # @return [String]
    attr_accessor :author_name

    # Email of the author of the repository.
    # @return [String]
    attr_accessor :author_email

    # Name of who creates the commit.
    # @return [String]
    attr_accessor :committer_name

    # Email of who creates the commit.
    # @return [String]
    attr_accessor :committer_email

    # An array of parent commit IDs of created commit.
    # @return [Array<String>]
    attr_accessor :parent_commit_ids

    # The time at which commit was created.
    # @return [DateTime]
    attr_accessor :time_created

    # Tree information for the specified commit.
    # @return [String]
    attr_accessor :tree_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'commit_id': :'commitId',
        'commit_message': :'commitMessage',
        'author_name': :'authorName',
        'author_email': :'authorEmail',
        'committer_name': :'committerName',
        'committer_email': :'committerEmail',
        'parent_commit_ids': :'parentCommitIds',
        'time_created': :'timeCreated',
        'tree_id': :'treeId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'commit_id': :'String',
        'commit_message': :'String',
        'author_name': :'String',
        'author_email': :'String',
        'committer_name': :'String',
        'committer_email': :'String',
        'parent_commit_ids': :'Array<String>',
        'time_created': :'DateTime',
        'tree_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :commit_id The value to assign to the {#commit_id} property
    # @option attributes [String] :commit_message The value to assign to the {#commit_message} property
    # @option attributes [String] :author_name The value to assign to the {#author_name} property
    # @option attributes [String] :author_email The value to assign to the {#author_email} property
    # @option attributes [String] :committer_name The value to assign to the {#committer_name} property
    # @option attributes [String] :committer_email The value to assign to the {#committer_email} property
    # @option attributes [Array<String>] :parent_commit_ids The value to assign to the {#parent_commit_ids} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [String] :tree_id The value to assign to the {#tree_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.commit_id = attributes[:'commitId'] if attributes[:'commitId']

      raise 'You cannot provide both :commitId and :commit_id' if attributes.key?(:'commitId') && attributes.key?(:'commit_id')

      self.commit_id = attributes[:'commit_id'] if attributes[:'commit_id']

      self.commit_message = attributes[:'commitMessage'] if attributes[:'commitMessage']

      raise 'You cannot provide both :commitMessage and :commit_message' if attributes.key?(:'commitMessage') && attributes.key?(:'commit_message')

      self.commit_message = attributes[:'commit_message'] if attributes[:'commit_message']

      self.author_name = attributes[:'authorName'] if attributes[:'authorName']

      raise 'You cannot provide both :authorName and :author_name' if attributes.key?(:'authorName') && attributes.key?(:'author_name')

      self.author_name = attributes[:'author_name'] if attributes[:'author_name']

      self.author_email = attributes[:'authorEmail'] if attributes[:'authorEmail']

      raise 'You cannot provide both :authorEmail and :author_email' if attributes.key?(:'authorEmail') && attributes.key?(:'author_email')

      self.author_email = attributes[:'author_email'] if attributes[:'author_email']

      self.committer_name = attributes[:'committerName'] if attributes[:'committerName']

      raise 'You cannot provide both :committerName and :committer_name' if attributes.key?(:'committerName') && attributes.key?(:'committer_name')

      self.committer_name = attributes[:'committer_name'] if attributes[:'committer_name']

      self.committer_email = attributes[:'committerEmail'] if attributes[:'committerEmail']

      raise 'You cannot provide both :committerEmail and :committer_email' if attributes.key?(:'committerEmail') && attributes.key?(:'committer_email')

      self.committer_email = attributes[:'committer_email'] if attributes[:'committer_email']

      self.parent_commit_ids = attributes[:'parentCommitIds'] if attributes[:'parentCommitIds']

      raise 'You cannot provide both :parentCommitIds and :parent_commit_ids' if attributes.key?(:'parentCommitIds') && attributes.key?(:'parent_commit_ids')

      self.parent_commit_ids = attributes[:'parent_commit_ids'] if attributes[:'parent_commit_ids']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.tree_id = attributes[:'treeId'] if attributes[:'treeId']

      raise 'You cannot provide both :treeId and :tree_id' if attributes.key?(:'treeId') && attributes.key?(:'tree_id')

      self.tree_id = attributes[:'tree_id'] if attributes[:'tree_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        commit_id == other.commit_id &&
        commit_message == other.commit_message &&
        author_name == other.author_name &&
        author_email == other.author_email &&
        committer_name == other.committer_name &&
        committer_email == other.committer_email &&
        parent_commit_ids == other.parent_commit_ids &&
        time_created == other.time_created &&
        tree_id == other.tree_id
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
      [commit_id, commit_message, author_name, author_email, committer_name, committer_email, parent_commit_ids, time_created, tree_id].hash
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
