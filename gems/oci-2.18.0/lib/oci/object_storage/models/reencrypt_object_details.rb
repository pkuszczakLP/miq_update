# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The details used to re-encrypt the data encryption keys associated with an object.
  # You can only specify either a kmsKeyId or an sseCustomerKey in the request payload, not both.
  # If the request payload is empty, the object is encrypted using the encryption key assigned to the
  # bucket. The bucket encryption mechanism can either be a master encryption key managed by Oracle or the Vault service.
  #
  # - The sseCustomerKey field specifies the customer-provided encryption key (SSE-C) that will be used to re-encrypt the data encryption keys of the
  #   object and its chunks.
  #
  # - The sourceSSECustomerKey field specifies information about the customer-provided encryption key that is currently
  #   associated with the object source. Specify a value for the sourceSSECustomerKey only if the object
  #   is encrypted with a customer-provided encryption key.
  #
  class ObjectStorage::Models::ReencryptObjectDetails
    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the master encryption key used to call the Vault
    # service to re-encrypt the data encryption keys associated with the object and its chunks. If the kmsKeyId value is
    # empty, whether null or an empty string, the API will perform re-encryption by using the kmsKeyId associated with the
    # bucket or the master encryption key managed by Oracle, depending on the bucket encryption mechanism.
    #
    # @return [String]
    attr_accessor :kms_key_id

    # @return [OCI::ObjectStorage::Models::SSECustomerKeyDetails]
    attr_accessor :sse_customer_key

    # @return [OCI::ObjectStorage::Models::SSECustomerKeyDetails]
    attr_accessor :source_sse_customer_key

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'kms_key_id': :'kmsKeyId',
        'sse_customer_key': :'sseCustomerKey',
        'source_sse_customer_key': :'sourceSseCustomerKey'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'kms_key_id': :'String',
        'sse_customer_key': :'OCI::ObjectStorage::Models::SSECustomerKeyDetails',
        'source_sse_customer_key': :'OCI::ObjectStorage::Models::SSECustomerKeyDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :kms_key_id The value to assign to the {#kms_key_id} property
    # @option attributes [OCI::ObjectStorage::Models::SSECustomerKeyDetails] :sse_customer_key The value to assign to the {#sse_customer_key} property
    # @option attributes [OCI::ObjectStorage::Models::SSECustomerKeyDetails] :source_sse_customer_key The value to assign to the {#source_sse_customer_key} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.kms_key_id = attributes[:'kmsKeyId'] if attributes[:'kmsKeyId']

      raise 'You cannot provide both :kmsKeyId and :kms_key_id' if attributes.key?(:'kmsKeyId') && attributes.key?(:'kms_key_id')

      self.kms_key_id = attributes[:'kms_key_id'] if attributes[:'kms_key_id']

      self.sse_customer_key = attributes[:'sseCustomerKey'] if attributes[:'sseCustomerKey']

      raise 'You cannot provide both :sseCustomerKey and :sse_customer_key' if attributes.key?(:'sseCustomerKey') && attributes.key?(:'sse_customer_key')

      self.sse_customer_key = attributes[:'sse_customer_key'] if attributes[:'sse_customer_key']

      self.source_sse_customer_key = attributes[:'sourceSseCustomerKey'] if attributes[:'sourceSseCustomerKey']

      raise 'You cannot provide both :sourceSseCustomerKey and :source_sse_customer_key' if attributes.key?(:'sourceSseCustomerKey') && attributes.key?(:'source_sse_customer_key')

      self.source_sse_customer_key = attributes[:'source_sse_customer_key'] if attributes[:'source_sse_customer_key']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        kms_key_id == other.kms_key_id &&
        sse_customer_key == other.sse_customer_key &&
        source_sse_customer_key == other.source_sse_customer_key
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
      [kms_key_id, sse_customer_key, source_sse_customer_key].hash
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
