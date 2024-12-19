# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The metadata associated with the profile level summary.
  #
  class Optimizer::Models::ProfileLevelSummary
    # **[Required]** A unique name for the profile level.
    # @return [String]
    attr_accessor :name

    # **[Required]** The name of the recommendation this profile level applies to.
    # @return [String]
    attr_accessor :recommendation_name

    # **[Required]** The metrics that will be evaluated by profiles using this profile level.
    # @return [Array<OCI::Optimizer::Models::EvaluatedMetric>]
    attr_accessor :metrics

    # **[Required]** The default aggregation interval (in days) for profiles using this profile level.
    #
    # @return [Integer]
    attr_accessor :default_interval

    # **[Required]** An array of aggregation intervals (in days) allowed for profiles using this profile level.
    #
    # @return [Array<Integer>]
    attr_accessor :valid_intervals

    # **[Required]** The date and time the category details were created, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_created

    # **[Required]** The date and time the category details were last updated, in the format defined by RFC3339.
    # @return [DateTime]
    attr_accessor :time_updated

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'recommendation_name': :'recommendationName',
        'metrics': :'metrics',
        'default_interval': :'defaultInterval',
        'valid_intervals': :'validIntervals',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'recommendation_name': :'String',
        'metrics': :'Array<OCI::Optimizer::Models::EvaluatedMetric>',
        'default_interval': :'Integer',
        'valid_intervals': :'Array<Integer>',
        'time_created': :'DateTime',
        'time_updated': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :recommendation_name The value to assign to the {#recommendation_name} property
    # @option attributes [Array<OCI::Optimizer::Models::EvaluatedMetric>] :metrics The value to assign to the {#metrics} property
    # @option attributes [Integer] :default_interval The value to assign to the {#default_interval} property
    # @option attributes [Array<Integer>] :valid_intervals The value to assign to the {#valid_intervals} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.recommendation_name = attributes[:'recommendationName'] if attributes[:'recommendationName']

      raise 'You cannot provide both :recommendationName and :recommendation_name' if attributes.key?(:'recommendationName') && attributes.key?(:'recommendation_name')

      self.recommendation_name = attributes[:'recommendation_name'] if attributes[:'recommendation_name']

      self.metrics = attributes[:'metrics'] if attributes[:'metrics']

      self.default_interval = attributes[:'defaultInterval'] if attributes[:'defaultInterval']

      raise 'You cannot provide both :defaultInterval and :default_interval' if attributes.key?(:'defaultInterval') && attributes.key?(:'default_interval')

      self.default_interval = attributes[:'default_interval'] if attributes[:'default_interval']

      self.valid_intervals = attributes[:'validIntervals'] if attributes[:'validIntervals']

      raise 'You cannot provide both :validIntervals and :valid_intervals' if attributes.key?(:'validIntervals') && attributes.key?(:'valid_intervals')

      self.valid_intervals = attributes[:'valid_intervals'] if attributes[:'valid_intervals']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        recommendation_name == other.recommendation_name &&
        metrics == other.metrics &&
        default_interval == other.default_interval &&
        valid_intervals == other.valid_intervals &&
        time_created == other.time_created &&
        time_updated == other.time_updated
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
      [name, recommendation_name, metrics, default_interval, valid_intervals, time_created, time_updated].hash
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
