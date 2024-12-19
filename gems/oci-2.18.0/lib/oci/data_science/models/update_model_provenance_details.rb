# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Model provenance gives data scientists information about the origin of their model. This information allows data scientists to reproduce the development environment in which the model was trained.
  class DataScience::Models::UpdateModelProvenanceDetails
    # For model reproducibility purposes. URL of the git repository associated with model training.
    # @return [String]
    attr_accessor :repository_url

    # For model reproducibility purposes. Branch of the git repository associated with model training.
    # @return [String]
    attr_accessor :git_branch

    # For model reproducibility purposes. Commit ID of the git repository associated with model training.
    # @return [String]
    attr_accessor :git_commit

    # For model reproducibility purposes. Path to model artifacts.
    # @return [String]
    attr_accessor :script_dir

    # For model reproducibility purposes. Path to the python script or notebook in which the model was trained.\"
    #
    # @return [String]
    attr_accessor :training_script

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of a training session(Job or NotebookSession) in which the model was trained. It is used for model reproducibility purposes.
    # @return [String]
    attr_accessor :training_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'repository_url': :'repositoryUrl',
        'git_branch': :'gitBranch',
        'git_commit': :'gitCommit',
        'script_dir': :'scriptDir',
        'training_script': :'trainingScript',
        'training_id': :'trainingId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'repository_url': :'String',
        'git_branch': :'String',
        'git_commit': :'String',
        'script_dir': :'String',
        'training_script': :'String',
        'training_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :repository_url The value to assign to the {#repository_url} property
    # @option attributes [String] :git_branch The value to assign to the {#git_branch} property
    # @option attributes [String] :git_commit The value to assign to the {#git_commit} property
    # @option attributes [String] :script_dir The value to assign to the {#script_dir} property
    # @option attributes [String] :training_script The value to assign to the {#training_script} property
    # @option attributes [String] :training_id The value to assign to the {#training_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.repository_url = attributes[:'repositoryUrl'] if attributes[:'repositoryUrl']

      raise 'You cannot provide both :repositoryUrl and :repository_url' if attributes.key?(:'repositoryUrl') && attributes.key?(:'repository_url')

      self.repository_url = attributes[:'repository_url'] if attributes[:'repository_url']

      self.git_branch = attributes[:'gitBranch'] if attributes[:'gitBranch']

      raise 'You cannot provide both :gitBranch and :git_branch' if attributes.key?(:'gitBranch') && attributes.key?(:'git_branch')

      self.git_branch = attributes[:'git_branch'] if attributes[:'git_branch']

      self.git_commit = attributes[:'gitCommit'] if attributes[:'gitCommit']

      raise 'You cannot provide both :gitCommit and :git_commit' if attributes.key?(:'gitCommit') && attributes.key?(:'git_commit')

      self.git_commit = attributes[:'git_commit'] if attributes[:'git_commit']

      self.script_dir = attributes[:'scriptDir'] if attributes[:'scriptDir']

      raise 'You cannot provide both :scriptDir and :script_dir' if attributes.key?(:'scriptDir') && attributes.key?(:'script_dir')

      self.script_dir = attributes[:'script_dir'] if attributes[:'script_dir']

      self.training_script = attributes[:'trainingScript'] if attributes[:'trainingScript']

      raise 'You cannot provide both :trainingScript and :training_script' if attributes.key?(:'trainingScript') && attributes.key?(:'training_script')

      self.training_script = attributes[:'training_script'] if attributes[:'training_script']

      self.training_id = attributes[:'trainingId'] if attributes[:'trainingId']

      raise 'You cannot provide both :trainingId and :training_id' if attributes.key?(:'trainingId') && attributes.key?(:'training_id')

      self.training_id = attributes[:'training_id'] if attributes[:'training_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        repository_url == other.repository_url &&
        git_branch == other.git_branch &&
        git_commit == other.git_commit &&
        script_dir == other.script_dir &&
        training_script == other.training_script &&
        training_id == other.training_id
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
      [repository_url, git_branch, git_commit, script_dir, training_script, training_id].hash
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