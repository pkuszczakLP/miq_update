# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Attributes to update a Fleet Agent Configuration.
  class Jms::Models::UpdateFleetAgentConfigurationDetails
    # The frequency (in minutes) of JRE scanning. (That is, how often should JMS scan for JRE installations.)
    #
    # @return [Integer]
    attr_accessor :jre_scan_frequency_in_minutes

    # The frequency (in minutes) of Java Usage Tracker processing. (That is, how often should JMS process data from the Java Usage Tracker.)
    #
    # @return [Integer]
    attr_accessor :java_usage_tracker_processing_frequency_in_minutes

    # @return [OCI::Jms::Models::FleetAgentOsConfiguration]
    attr_accessor :linux_configuration

    # @return [OCI::Jms::Models::FleetAgentOsConfiguration]
    attr_accessor :windows_configuration

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'jre_scan_frequency_in_minutes': :'jreScanFrequencyInMinutes',
        'java_usage_tracker_processing_frequency_in_minutes': :'javaUsageTrackerProcessingFrequencyInMinutes',
        'linux_configuration': :'linuxConfiguration',
        'windows_configuration': :'windowsConfiguration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'jre_scan_frequency_in_minutes': :'Integer',
        'java_usage_tracker_processing_frequency_in_minutes': :'Integer',
        'linux_configuration': :'OCI::Jms::Models::FleetAgentOsConfiguration',
        'windows_configuration': :'OCI::Jms::Models::FleetAgentOsConfiguration'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :jre_scan_frequency_in_minutes The value to assign to the {#jre_scan_frequency_in_minutes} property
    # @option attributes [Integer] :java_usage_tracker_processing_frequency_in_minutes The value to assign to the {#java_usage_tracker_processing_frequency_in_minutes} property
    # @option attributes [OCI::Jms::Models::FleetAgentOsConfiguration] :linux_configuration The value to assign to the {#linux_configuration} property
    # @option attributes [OCI::Jms::Models::FleetAgentOsConfiguration] :windows_configuration The value to assign to the {#windows_configuration} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.jre_scan_frequency_in_minutes = attributes[:'jreScanFrequencyInMinutes'] if attributes[:'jreScanFrequencyInMinutes']

      raise 'You cannot provide both :jreScanFrequencyInMinutes and :jre_scan_frequency_in_minutes' if attributes.key?(:'jreScanFrequencyInMinutes') && attributes.key?(:'jre_scan_frequency_in_minutes')

      self.jre_scan_frequency_in_minutes = attributes[:'jre_scan_frequency_in_minutes'] if attributes[:'jre_scan_frequency_in_minutes']

      self.java_usage_tracker_processing_frequency_in_minutes = attributes[:'javaUsageTrackerProcessingFrequencyInMinutes'] if attributes[:'javaUsageTrackerProcessingFrequencyInMinutes']

      raise 'You cannot provide both :javaUsageTrackerProcessingFrequencyInMinutes and :java_usage_tracker_processing_frequency_in_minutes' if attributes.key?(:'javaUsageTrackerProcessingFrequencyInMinutes') && attributes.key?(:'java_usage_tracker_processing_frequency_in_minutes')

      self.java_usage_tracker_processing_frequency_in_minutes = attributes[:'java_usage_tracker_processing_frequency_in_minutes'] if attributes[:'java_usage_tracker_processing_frequency_in_minutes']

      self.linux_configuration = attributes[:'linuxConfiguration'] if attributes[:'linuxConfiguration']

      raise 'You cannot provide both :linuxConfiguration and :linux_configuration' if attributes.key?(:'linuxConfiguration') && attributes.key?(:'linux_configuration')

      self.linux_configuration = attributes[:'linux_configuration'] if attributes[:'linux_configuration']

      self.windows_configuration = attributes[:'windowsConfiguration'] if attributes[:'windowsConfiguration']

      raise 'You cannot provide both :windowsConfiguration and :windows_configuration' if attributes.key?(:'windowsConfiguration') && attributes.key?(:'windows_configuration')

      self.windows_configuration = attributes[:'windows_configuration'] if attributes[:'windows_configuration']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        jre_scan_frequency_in_minutes == other.jre_scan_frequency_in_minutes &&
        java_usage_tracker_processing_frequency_in_minutes == other.java_usage_tracker_processing_frequency_in_minutes &&
        linux_configuration == other.linux_configuration &&
        windows_configuration == other.windows_configuration
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
      [jre_scan_frequency_in_minutes, java_usage_tracker_processing_frequency_in_minutes, linux_configuration, windows_configuration].hash
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
