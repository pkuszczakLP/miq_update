# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The confidence, source information, and visibility for a particular sighting or observation of some data associated with an indicator such as threat type, attribute or relationship.
  class ThreatIntelligence::Models::DataAttribution
    # **[Required]** Confidence is an integer from 0 to 100 that provides a measure of our certainty in the maliciousness of data attributed to an indicator.  For example, if the source of the data being attributed is the Tor Project, our confidence that the associated indicator is a tor exit node would be 100.
    # @return [Integer]
    attr_accessor :confidence

    # This attribute is required.
    # @return [OCI::ThreatIntelligence::Models::IndicatorSourceSummary]
    attr_accessor :source

    # This attribute is required.
    # @return [OCI::ThreatIntelligence::Models::DataVisibility]
    attr_accessor :visibility

    # The time the data was first seen for this entity. Defaults to time last seen if no time first seen is provided from the data source. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_first_seen

    # **[Required]** The last time this data was seen for this entity. An RFC3339 formatted datetime string
    # @return [DateTime]
    attr_accessor :time_last_seen

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'confidence': :'confidence',
        'source': :'source',
        'visibility': :'visibility',
        'time_first_seen': :'timeFirstSeen',
        'time_last_seen': :'timeLastSeen'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'confidence': :'Integer',
        'source': :'OCI::ThreatIntelligence::Models::IndicatorSourceSummary',
        'visibility': :'OCI::ThreatIntelligence::Models::DataVisibility',
        'time_first_seen': :'DateTime',
        'time_last_seen': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :confidence The value to assign to the {#confidence} property
    # @option attributes [OCI::ThreatIntelligence::Models::IndicatorSourceSummary] :source The value to assign to the {#source} property
    # @option attributes [OCI::ThreatIntelligence::Models::DataVisibility] :visibility The value to assign to the {#visibility} property
    # @option attributes [DateTime] :time_first_seen The value to assign to the {#time_first_seen} property
    # @option attributes [DateTime] :time_last_seen The value to assign to the {#time_last_seen} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.confidence = attributes[:'confidence'] if attributes[:'confidence']

      self.source = attributes[:'source'] if attributes[:'source']

      self.visibility = attributes[:'visibility'] if attributes[:'visibility']

      self.time_first_seen = attributes[:'timeFirstSeen'] if attributes[:'timeFirstSeen']

      raise 'You cannot provide both :timeFirstSeen and :time_first_seen' if attributes.key?(:'timeFirstSeen') && attributes.key?(:'time_first_seen')

      self.time_first_seen = attributes[:'time_first_seen'] if attributes[:'time_first_seen']

      self.time_last_seen = attributes[:'timeLastSeen'] if attributes[:'timeLastSeen']

      raise 'You cannot provide both :timeLastSeen and :time_last_seen' if attributes.key?(:'timeLastSeen') && attributes.key?(:'time_last_seen')

      self.time_last_seen = attributes[:'time_last_seen'] if attributes[:'time_last_seen']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        confidence == other.confidence &&
        source == other.source &&
        visibility == other.visibility &&
        time_first_seen == other.time_first_seen &&
        time_last_seen == other.time_last_seen
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
      [confidence, source, visibility, time_first_seen, time_last_seen].hash
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
