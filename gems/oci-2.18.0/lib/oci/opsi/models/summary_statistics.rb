# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Contains common summary statistics.
  #
  class Opsi::Models::SummaryStatistics
    # **[Required]** The smallest number in the data set.
    # @return [Float]
    attr_accessor :minimum

    # **[Required]** The largest number in the data set.
    # @return [Float]
    attr_accessor :maximum

    # **[Required]** The average number in the data set.
    # @return [Float]
    attr_accessor :average

    # **[Required]** The middle number in the data set.
    # @return [Float]
    attr_accessor :median

    # **[Required]** The middle number between the smallest number and the median of the data set. It's also known as the 25th quartile.
    # @return [Float]
    attr_accessor :lower_quartile

    # **[Required]** The middle number between the median and the largest number of the data set. It's also known as the 75th quartile.
    # @return [Float]
    attr_accessor :upper_quartile

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'minimum': :'minimum',
        'maximum': :'maximum',
        'average': :'average',
        'median': :'median',
        'lower_quartile': :'lowerQuartile',
        'upper_quartile': :'upperQuartile'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'minimum': :'Float',
        'maximum': :'Float',
        'average': :'Float',
        'median': :'Float',
        'lower_quartile': :'Float',
        'upper_quartile': :'Float'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Float] :minimum The value to assign to the {#minimum} property
    # @option attributes [Float] :maximum The value to assign to the {#maximum} property
    # @option attributes [Float] :average The value to assign to the {#average} property
    # @option attributes [Float] :median The value to assign to the {#median} property
    # @option attributes [Float] :lower_quartile The value to assign to the {#lower_quartile} property
    # @option attributes [Float] :upper_quartile The value to assign to the {#upper_quartile} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.minimum = attributes[:'minimum'] if attributes[:'minimum']

      self.maximum = attributes[:'maximum'] if attributes[:'maximum']

      self.average = attributes[:'average'] if attributes[:'average']

      self.median = attributes[:'median'] if attributes[:'median']

      self.lower_quartile = attributes[:'lowerQuartile'] if attributes[:'lowerQuartile']

      raise 'You cannot provide both :lowerQuartile and :lower_quartile' if attributes.key?(:'lowerQuartile') && attributes.key?(:'lower_quartile')

      self.lower_quartile = attributes[:'lower_quartile'] if attributes[:'lower_quartile']

      self.upper_quartile = attributes[:'upperQuartile'] if attributes[:'upperQuartile']

      raise 'You cannot provide both :upperQuartile and :upper_quartile' if attributes.key?(:'upperQuartile') && attributes.key?(:'upper_quartile')

      self.upper_quartile = attributes[:'upper_quartile'] if attributes[:'upper_quartile']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        minimum == other.minimum &&
        maximum == other.maximum &&
        average == other.average &&
        median == other.median &&
        lower_quartile == other.lower_quartile &&
        upper_quartile == other.upper_quartile
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
      [minimum, maximum, average, median, lower_quartile, upper_quartile].hash
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
