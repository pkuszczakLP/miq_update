# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require_relative 'abstract_read_attribute'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties to configure reading from a FUSION_APP BIP data asset / connection.
  class DataIntegration::Models::BipReadAttributes < DataIntegration::Models::AbstractReadAttribute
    # The fetch size for reading.
    # @return [Integer]
    attr_accessor :fetch_size

    # The maximum number of rows to read.
    # @return [Integer]
    attr_accessor :row_limit

    # Name of BIP report parameter to control the start of the chunk
    # @return [String]
    attr_accessor :offset_parameter

    # Name of BIP report parameter to control the start of the chunk
    # @return [String]
    attr_accessor :fetch_next_rows_parameter

    # An array of custom BIP report parameters and their values.
    # @return [Array<OCI::DataIntegration::Models::BipReportParameterValue>]
    attr_accessor :custom_parameters

    # @return [OCI::DataIntegration::Models::DataAssetSummaryFromObjectStorage]
    attr_accessor :staging_data_asset

    # @return [OCI::DataIntegration::Models::ConnectionSummaryFromObjectStorage]
    attr_accessor :staging_connection

    # @return [OCI::DataIntegration::Models::Schema]
    attr_accessor :bucket_schema

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'modelType',
        'fetch_size': :'fetchSize',
        'row_limit': :'rowLimit',
        'offset_parameter': :'offsetParameter',
        'fetch_next_rows_parameter': :'fetchNextRowsParameter',
        'custom_parameters': :'customParameters',
        'staging_data_asset': :'stagingDataAsset',
        'staging_connection': :'stagingConnection',
        'bucket_schema': :'bucketSchema'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'model_type': :'String',
        'fetch_size': :'Integer',
        'row_limit': :'Integer',
        'offset_parameter': :'String',
        'fetch_next_rows_parameter': :'String',
        'custom_parameters': :'Array<OCI::DataIntegration::Models::BipReportParameterValue>',
        'staging_data_asset': :'OCI::DataIntegration::Models::DataAssetSummaryFromObjectStorage',
        'staging_connection': :'OCI::DataIntegration::Models::ConnectionSummaryFromObjectStorage',
        'bucket_schema': :'OCI::DataIntegration::Models::Schema'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Integer] :fetch_size The value to assign to the {#fetch_size} property
    # @option attributes [Integer] :row_limit The value to assign to the {#row_limit} property
    # @option attributes [String] :offset_parameter The value to assign to the {#offset_parameter} property
    # @option attributes [String] :fetch_next_rows_parameter The value to assign to the {#fetch_next_rows_parameter} property
    # @option attributes [Array<OCI::DataIntegration::Models::BipReportParameterValue>] :custom_parameters The value to assign to the {#custom_parameters} property
    # @option attributes [OCI::DataIntegration::Models::DataAssetSummaryFromObjectStorage] :staging_data_asset The value to assign to the {#staging_data_asset} property
    # @option attributes [OCI::DataIntegration::Models::ConnectionSummaryFromObjectStorage] :staging_connection The value to assign to the {#staging_connection} property
    # @option attributes [OCI::DataIntegration::Models::Schema] :bucket_schema The value to assign to the {#bucket_schema} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      attributes['modelType'] = 'BIP_READ_ATTRIBUTE'

      super(attributes)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.fetch_size = attributes[:'fetchSize'] if attributes[:'fetchSize']

      raise 'You cannot provide both :fetchSize and :fetch_size' if attributes.key?(:'fetchSize') && attributes.key?(:'fetch_size')

      self.fetch_size = attributes[:'fetch_size'] if attributes[:'fetch_size']

      self.row_limit = attributes[:'rowLimit'] if attributes[:'rowLimit']

      raise 'You cannot provide both :rowLimit and :row_limit' if attributes.key?(:'rowLimit') && attributes.key?(:'row_limit')

      self.row_limit = attributes[:'row_limit'] if attributes[:'row_limit']

      self.offset_parameter = attributes[:'offsetParameter'] if attributes[:'offsetParameter']

      raise 'You cannot provide both :offsetParameter and :offset_parameter' if attributes.key?(:'offsetParameter') && attributes.key?(:'offset_parameter')

      self.offset_parameter = attributes[:'offset_parameter'] if attributes[:'offset_parameter']

      self.fetch_next_rows_parameter = attributes[:'fetchNextRowsParameter'] if attributes[:'fetchNextRowsParameter']

      raise 'You cannot provide both :fetchNextRowsParameter and :fetch_next_rows_parameter' if attributes.key?(:'fetchNextRowsParameter') && attributes.key?(:'fetch_next_rows_parameter')

      self.fetch_next_rows_parameter = attributes[:'fetch_next_rows_parameter'] if attributes[:'fetch_next_rows_parameter']

      self.custom_parameters = attributes[:'customParameters'] if attributes[:'customParameters']

      raise 'You cannot provide both :customParameters and :custom_parameters' if attributes.key?(:'customParameters') && attributes.key?(:'custom_parameters')

      self.custom_parameters = attributes[:'custom_parameters'] if attributes[:'custom_parameters']

      self.staging_data_asset = attributes[:'stagingDataAsset'] if attributes[:'stagingDataAsset']

      raise 'You cannot provide both :stagingDataAsset and :staging_data_asset' if attributes.key?(:'stagingDataAsset') && attributes.key?(:'staging_data_asset')

      self.staging_data_asset = attributes[:'staging_data_asset'] if attributes[:'staging_data_asset']

      self.staging_connection = attributes[:'stagingConnection'] if attributes[:'stagingConnection']

      raise 'You cannot provide both :stagingConnection and :staging_connection' if attributes.key?(:'stagingConnection') && attributes.key?(:'staging_connection')

      self.staging_connection = attributes[:'staging_connection'] if attributes[:'staging_connection']

      self.bucket_schema = attributes[:'bucketSchema'] if attributes[:'bucketSchema']

      raise 'You cannot provide both :bucketSchema and :bucket_schema' if attributes.key?(:'bucketSchema') && attributes.key?(:'bucket_schema')

      self.bucket_schema = attributes[:'bucket_schema'] if attributes[:'bucket_schema']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        model_type == other.model_type &&
        fetch_size == other.fetch_size &&
        row_limit == other.row_limit &&
        offset_parameter == other.offset_parameter &&
        fetch_next_rows_parameter == other.fetch_next_rows_parameter &&
        custom_parameters == other.custom_parameters &&
        staging_data_asset == other.staging_data_asset &&
        staging_connection == other.staging_connection &&
        bucket_schema == other.bucket_schema
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
      [model_type, fetch_size, row_limit, offset_parameter, fetch_next_rows_parameter, custom_parameters, staging_data_asset, staging_connection, bucket_schema].hash
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