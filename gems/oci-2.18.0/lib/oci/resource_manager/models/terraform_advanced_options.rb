# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Specifies advanced options for Terraform commands. These options are not necessary for normal usage of Terraform.
  #
  class ResourceManager::Models::TerraformAdvancedOptions
    DETAILED_LOG_LEVEL_ENUM = [
      DETAILED_LOG_LEVEL_ERROR = 'ERROR'.freeze,
      DETAILED_LOG_LEVEL_WARN = 'WARN'.freeze,
      DETAILED_LOG_LEVEL_INFO = 'INFO'.freeze,
      DETAILED_LOG_LEVEL_DEBUG = 'DEBUG'.freeze,
      DETAILED_LOG_LEVEL_TRACE = 'TRACE'.freeze,
      DETAILED_LOG_LEVEL_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # Specifies whether to refresh the state for each resource before running the job (operation).
    # Refreshing the state can affect performance. Consider setting to `false` if the configuration includes several resources.
    # Used with the following operations: `PLAN`, `APPLY`, `DESTROY`.
    #
    # @return [BOOLEAN]
    attr_accessor :is_refresh_required

    # Limits the number of concurrent Terraform operations when [walking the graph](https://www.terraform.io/docs/internals/graph.html#walking-the-graph).
    # Use this parameter to help debug Terraform issues or to accomplish certain special use cases.
    # A higher value might cause resources to be throttled.
    # Used with the following operations: `PLAN`, `APPLY`, `DESTROY`.
    #
    # @return [Integer]
    attr_accessor :parallelism

    # Enables detailed logs at the specified verbosity for running the job (operation).
    #
    # @return [String]
    attr_reader :detailed_log_level

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'is_refresh_required': :'isRefreshRequired',
        'parallelism': :'parallelism',
        'detailed_log_level': :'detailedLogLevel'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'is_refresh_required': :'BOOLEAN',
        'parallelism': :'Integer',
        'detailed_log_level': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [BOOLEAN] :is_refresh_required The value to assign to the {#is_refresh_required} property
    # @option attributes [Integer] :parallelism The value to assign to the {#parallelism} property
    # @option attributes [String] :detailed_log_level The value to assign to the {#detailed_log_level} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.is_refresh_required = attributes[:'isRefreshRequired'] unless attributes[:'isRefreshRequired'].nil?
      self.is_refresh_required = true if is_refresh_required.nil? && !attributes.key?(:'isRefreshRequired') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRefreshRequired and :is_refresh_required' if attributes.key?(:'isRefreshRequired') && attributes.key?(:'is_refresh_required')

      self.is_refresh_required = attributes[:'is_refresh_required'] unless attributes[:'is_refresh_required'].nil?
      self.is_refresh_required = true if is_refresh_required.nil? && !attributes.key?(:'isRefreshRequired') && !attributes.key?(:'is_refresh_required') # rubocop:disable Style/StringLiterals

      self.parallelism = attributes[:'parallelism'] if attributes[:'parallelism']

      self.detailed_log_level = attributes[:'detailedLogLevel'] if attributes[:'detailedLogLevel']

      raise 'You cannot provide both :detailedLogLevel and :detailed_log_level' if attributes.key?(:'detailedLogLevel') && attributes.key?(:'detailed_log_level')

      self.detailed_log_level = attributes[:'detailed_log_level'] if attributes[:'detailed_log_level']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] detailed_log_level Object to be assigned
    def detailed_log_level=(detailed_log_level)
      # rubocop:disable Style/ConditionalAssignment
      if detailed_log_level && !DETAILED_LOG_LEVEL_ENUM.include?(detailed_log_level)
        OCI.logger.debug("Unknown value for 'detailed_log_level' [" + detailed_log_level + "]. Mapping to 'DETAILED_LOG_LEVEL_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @detailed_log_level = DETAILED_LOG_LEVEL_UNKNOWN_ENUM_VALUE
      else
        @detailed_log_level = detailed_log_level
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        is_refresh_required == other.is_refresh_required &&
        parallelism == other.parallelism &&
        detailed_log_level == other.detailed_log_level
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
      [is_refresh_required, parallelism, detailed_log_level].hash
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
