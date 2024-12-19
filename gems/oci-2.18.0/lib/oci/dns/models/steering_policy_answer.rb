# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # DNS record data with metadata for processing in a steering policy.
  #
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Dns::Models::SteeringPolicyAnswer
    # **[Required]** A user-friendly name for the answer, unique within the steering policy.
    # An answer's `name` property can be referenced in `answerCondition` properties
    # of rules using `answer.name`.
    #
    # **Example:**
    #
    #   \"rules\": [
    #     {
    #       \"ruleType\": \"FILTER\",
    #       \"defaultAnswerData\":  [
    #         {
    #           \"answerCondition\": \"answer.name == 'server 1'\",
    #           \"shouldKeep\": true
    #         }
    #       ]
    #     }
    #   ]
    #
    # @return [String]
    attr_accessor :name

    # **[Required]** The type of DNS record, such as A or CNAME. Only A, AAAA, and CNAME are supported. For more
    # information, see [Supported DNS Resource Record Types](https://docs.cloud.oracle.com/iaas/Content/DNS/Reference/supporteddnsresource.htm).
    #
    # @return [String]
    attr_accessor :rtype

    # **[Required]** The record's data, as whitespace-delimited tokens in
    # type-specific presentation format. All RDATA is normalized and the
    # returned presentation of your RDATA may differ from its initial input.
    # For more information about RDATA, see [Supported DNS Resource Record Types](https://docs.cloud.oracle.com/iaas/Content/DNS/Reference/supporteddnsresource.htm).
    #
    # @return [String]
    attr_accessor :rdata

    # The freeform name of a group of one or more records in which this record is included,
    # such as \"LAX data center\". An answer's `pool` property can be referenced in `answerCondition`
    # properties of rules using `answer.pool`.
    #
    # **Example:**
    #
    #   \"rules\": [
    #     {
    #       \"ruleType\": \"FILTER\",
    #       \"defaultAnswerData\":  [
    #         {
    #           \"answerCondition\": \"answer.pool == 'US East Servers'\",
    #           \"shouldKeep\": true
    #         }
    #       ]
    #     }
    #   ]
    #
    # @return [String]
    attr_accessor :pool

    # Set this property to `true` to indicate that the answer is administratively disabled,
    # such as when the corresponding server is down for maintenance. An answer's `isDisabled`
    # property can be referenced in `answerCondition` properties in rules using `answer.isDisabled`.
    #
    # **Example:**
    #   \"rules\": [
    #     {
    #       \"ruleType\": \"FILTER\",
    #       \"defaultAnswerData\": [
    #         {
    #           \"answerCondition\": \"answer.isDisabled != true\",
    #           \"shouldKeep\": true
    #         }
    #       ]
    #     },
    #
    # @return [BOOLEAN]
    attr_accessor :is_disabled

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'rtype': :'rtype',
        'rdata': :'rdata',
        'pool': :'pool',
        'is_disabled': :'isDisabled'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'rtype': :'String',
        'rdata': :'String',
        'pool': :'String',
        'is_disabled': :'BOOLEAN'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :rtype The value to assign to the {#rtype} property
    # @option attributes [String] :rdata The value to assign to the {#rdata} property
    # @option attributes [String] :pool The value to assign to the {#pool} property
    # @option attributes [BOOLEAN] :is_disabled The value to assign to the {#is_disabled} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.rtype = attributes[:'rtype'] if attributes[:'rtype']

      self.rdata = attributes[:'rdata'] if attributes[:'rdata']

      self.pool = attributes[:'pool'] if attributes[:'pool']

      self.is_disabled = attributes[:'isDisabled'] unless attributes[:'isDisabled'].nil?

      raise 'You cannot provide both :isDisabled and :is_disabled' if attributes.key?(:'isDisabled') && attributes.key?(:'is_disabled')

      self.is_disabled = attributes[:'is_disabled'] unless attributes[:'is_disabled'].nil?
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
        rtype == other.rtype &&
        rdata == other.rdata &&
        pool == other.pool &&
        is_disabled == other.is_disabled
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
      [name, rtype, rdata, pool, is_disabled].hash
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
