# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'update_build_pipeline_stage_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies the Wait stage. You can specify variable wait times or an absolute duration.
  class Devops::Models::UpdateWaitStageDetails < Devops::Models::UpdateBuildPipelineStageDetails
    # @return [OCI::Devops::Models::UpdateWaitCriteriaDetails]
    attr_accessor :wait_criteria

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'displayName',
        'description': :'description',
        'build_pipeline_stage_type': :'buildPipelineStageType',
        'build_pipeline_stage_predecessor_collection': :'buildPipelineStagePredecessorCollection',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'wait_criteria': :'waitCriteria'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'display_name': :'String',
        'description': :'String',
        'build_pipeline_stage_type': :'String',
        'build_pipeline_stage_predecessor_collection': :'OCI::Devops::Models::BuildPipelineStagePredecessorCollection',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'wait_criteria': :'OCI::Devops::Models::UpdateWaitCriteriaDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :display_name The value to assign to the {OCI::Devops::Models::UpdateBuildPipelineStageDetails#display_name #display_name} proprety
    # @option attributes [String] :description The value to assign to the {OCI::Devops::Models::UpdateBuildPipelineStageDetails#description #description} proprety
    # @option attributes [OCI::Devops::Models::BuildPipelineStagePredecessorCollection] :build_pipeline_stage_predecessor_collection The value to assign to the {OCI::Devops::Models::UpdateBuildPipelineStageDetails#build_pipeline_stage_predecessor_collection #build_pipeline_stage_predecessor_collection} proprety
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {OCI::Devops::Models::UpdateBuildPipelineStageDetails#freeform_tags #freeform_tags} proprety
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {OCI::Devops::Models::UpdateBuildPipelineStageDetails#defined_tags #defined_tags} proprety
    # @option attributes [OCI::Devops::Models::UpdateWaitCriteriaDetails] :wait_criteria The value to assign to the {#wait_criteria} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['buildPipelineStageType'] = 'WAIT'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.wait_criteria = attributes[:'waitCriteria'] if attributes[:'waitCriteria']

      raise 'You cannot provide both :waitCriteria and :wait_criteria' if attributes.key?(:'waitCriteria') && attributes.key?(:'wait_criteria')

      self.wait_criteria = attributes[:'wait_criteria'] if attributes[:'wait_criteria']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        description == other.description &&
        build_pipeline_stage_type == other.build_pipeline_stage_type &&
        build_pipeline_stage_predecessor_collection == other.build_pipeline_stage_predecessor_collection &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        wait_criteria == other.wait_criteria
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
      [display_name, description, build_pipeline_stage_type, build_pipeline_stage_predecessor_collection, freeform_tags, defined_tags, wait_criteria].hash
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
