# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The particular finding reported by the security assessment.
  class DataSafe::Models::FindingSummary
    SEVERITY_ENUM = [
      SEVERITY_HIGH = 'HIGH'.freeze,
      SEVERITY_MEDIUM = 'MEDIUM'.freeze,
      SEVERITY_LOW = 'LOW'.freeze,
      SEVERITY_EVALUATE = 'EVALUATE'.freeze,
      SEVERITY_ADVISORY = 'ADVISORY'.freeze,
      SEVERITY_PASS = 'PASS'.freeze,
      SEVERITY_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The severity of the finding.
    # @return [String]
    attr_reader :severity

    # The OCID of the assessment that generated this finding.
    # @return [String]
    attr_accessor :assessment_id

    # The OCID of the target database.
    # @return [String]
    attr_accessor :target_id

    # The unique finding key. This is a system-generated identifier. To get the finding key for a finding, use ListFindings.
    # @return [String]
    attr_accessor :key

    # The short title for the finding.
    # @return [String]
    attr_accessor :title

    # The explanation of the issue in this finding. It explains the reason for the rule and, if a risk is reported, it may also explain the recommended actions for remediation.
    # @return [String]
    attr_accessor :remarks

    # The details of the finding. Provides detailed information to explain the finding summary, typically results from the assessed database, followed by any recommendations for changes.
    # @return [Object]
    attr_accessor :details

    # The brief summary of the finding. When the finding is informational, the summary typically reports only the number of data elements that were examined.
    # @return [String]
    attr_accessor :summary

    # Provides information on whether the finding is related to a CIS Oracle Database Benchmark recommendation, a STIG rule, or a GDPR Article/Recital.
    # @return [OCI::DataSafe::Models::References]
    attr_accessor :references

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'severity': :'severity',
        'assessment_id': :'assessmentId',
        'target_id': :'targetId',
        'key': :'key',
        'title': :'title',
        'remarks': :'remarks',
        'details': :'details',
        'summary': :'summary',
        'references': :'references'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'severity': :'String',
        'assessment_id': :'String',
        'target_id': :'String',
        'key': :'String',
        'title': :'String',
        'remarks': :'String',
        'details': :'Object',
        'summary': :'String',
        'references': :'OCI::DataSafe::Models::References'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :severity The value to assign to the {#severity} property
    # @option attributes [String] :assessment_id The value to assign to the {#assessment_id} property
    # @option attributes [String] :target_id The value to assign to the {#target_id} property
    # @option attributes [String] :key The value to assign to the {#key} property
    # @option attributes [String] :title The value to assign to the {#title} property
    # @option attributes [String] :remarks The value to assign to the {#remarks} property
    # @option attributes [Object] :details The value to assign to the {#details} property
    # @option attributes [String] :summary The value to assign to the {#summary} property
    # @option attributes [OCI::DataSafe::Models::References] :references The value to assign to the {#references} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.severity = attributes[:'severity'] if attributes[:'severity']

      self.assessment_id = attributes[:'assessmentId'] if attributes[:'assessmentId']

      raise 'You cannot provide both :assessmentId and :assessment_id' if attributes.key?(:'assessmentId') && attributes.key?(:'assessment_id')

      self.assessment_id = attributes[:'assessment_id'] if attributes[:'assessment_id']

      self.target_id = attributes[:'targetId'] if attributes[:'targetId']

      raise 'You cannot provide both :targetId and :target_id' if attributes.key?(:'targetId') && attributes.key?(:'target_id')

      self.target_id = attributes[:'target_id'] if attributes[:'target_id']

      self.key = attributes[:'key'] if attributes[:'key']

      self.title = attributes[:'title'] if attributes[:'title']

      self.remarks = attributes[:'remarks'] if attributes[:'remarks']

      self.details = attributes[:'details'] if attributes[:'details']

      self.summary = attributes[:'summary'] if attributes[:'summary']

      self.references = attributes[:'references'] if attributes[:'references']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] severity Object to be assigned
    def severity=(severity)
      # rubocop:disable Style/ConditionalAssignment
      if severity && !SEVERITY_ENUM.include?(severity)
        OCI.logger.debug("Unknown value for 'severity' [" + severity + "]. Mapping to 'SEVERITY_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @severity = SEVERITY_UNKNOWN_ENUM_VALUE
      else
        @severity = severity
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        severity == other.severity &&
        assessment_id == other.assessment_id &&
        target_id == other.target_id &&
        key == other.key &&
        title == other.title &&
        remarks == other.remarks &&
        details == other.details &&
        summary == other.summary &&
        references == other.references
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
      [severity, assessment_id, target_id, key, title, remarks, details, summary, references].hash
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
