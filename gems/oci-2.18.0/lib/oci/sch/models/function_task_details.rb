# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'task_details'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The Functions task.
  # Batch input for a function can be limited by either size or time. The first limit reached determines the boundary of the batch.
  # For configuration instructions, see
  # [To create a service connector](https://docs.cloud.oracle.com/iaas/Content/service-connector-hub/managingconnectors.htm#create).
  #
  class Sch::Models::FunctionTaskDetails < Sch::Models::TaskDetails
    # **[Required]** The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the function to be used as a task.
    #
    # @return [String]
    attr_accessor :function_id

    # Size limit (kilobytes) for batch sent to invoke the function.
    #
    # @return [Integer]
    attr_accessor :batch_size_in_kbs

    # Time limit (seconds) for batch sent to invoke the function.
    #
    # @return [Integer]
    attr_accessor :batch_time_in_sec

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'kind': :'kind',
        'function_id': :'functionId',
        'batch_size_in_kbs': :'batchSizeInKbs',
        'batch_time_in_sec': :'batchTimeInSec'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'kind': :'String',
        'function_id': :'String',
        'batch_size_in_kbs': :'Integer',
        'batch_time_in_sec': :'Integer'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :function_id The value to assign to the {#function_id} property
    # @option attributes [Integer] :batch_size_in_kbs The value to assign to the {#batch_size_in_kbs} property
    # @option attributes [Integer] :batch_time_in_sec The value to assign to the {#batch_time_in_sec} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['kind'] = 'function'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.function_id = attributes[:'functionId'] if attributes[:'functionId']

      raise 'You cannot provide both :functionId and :function_id' if attributes.key?(:'functionId') && attributes.key?(:'function_id')

      self.function_id = attributes[:'function_id'] if attributes[:'function_id']

      self.batch_size_in_kbs = attributes[:'batchSizeInKbs'] if attributes[:'batchSizeInKbs']

      raise 'You cannot provide both :batchSizeInKbs and :batch_size_in_kbs' if attributes.key?(:'batchSizeInKbs') && attributes.key?(:'batch_size_in_kbs')

      self.batch_size_in_kbs = attributes[:'batch_size_in_kbs'] if attributes[:'batch_size_in_kbs']

      self.batch_time_in_sec = attributes[:'batchTimeInSec'] if attributes[:'batchTimeInSec']

      raise 'You cannot provide both :batchTimeInSec and :batch_time_in_sec' if attributes.key?(:'batchTimeInSec') && attributes.key?(:'batch_time_in_sec')

      self.batch_time_in_sec = attributes[:'batch_time_in_sec'] if attributes[:'batch_time_in_sec']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        kind == other.kind &&
        function_id == other.function_id &&
        batch_size_in_kbs == other.batch_size_in_kbs &&
        batch_time_in_sec == other.batch_time_in_sec
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
      [kind, function_id, batch_size_in_kbs, batch_time_in_sec].hash
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
