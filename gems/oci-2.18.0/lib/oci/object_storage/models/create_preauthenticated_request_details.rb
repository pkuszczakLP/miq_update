# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # CreatePreauthenticatedRequestDetails model.
  class ObjectStorage::Models::CreatePreauthenticatedRequestDetails
    ACCESS_TYPE_ENUM = [
      ACCESS_TYPE_OBJECT_READ = 'ObjectRead'.freeze,
      ACCESS_TYPE_OBJECT_WRITE = 'ObjectWrite'.freeze,
      ACCESS_TYPE_OBJECT_READ_WRITE = 'ObjectReadWrite'.freeze,
      ACCESS_TYPE_ANY_OBJECT_WRITE = 'AnyObjectWrite'.freeze,
      ACCESS_TYPE_ANY_OBJECT_READ = 'AnyObjectRead'.freeze,
      ACCESS_TYPE_ANY_OBJECT_READ_WRITE = 'AnyObjectReadWrite'.freeze
    ].freeze

    # **[Required]** A user-specified name for the pre-authenticated request. Names can be helpful in managing pre-authenticated requests.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :name

    # Specifies whether a list operation is allowed on a PAR with accessType \"AnyObjectRead\" or \"AnyObjectReadWrite\".
    # Deny: Prevents the user from performing a list operation.
    # ListObjects: Authorizes the user to perform a list operation.
    #
    # @return [String]
    attr_accessor :bucket_listing_action

    # The name of the object that is being granted access to by the pre-authenticated request. Avoid entering confidential
    # information. The object name can be null and if so, the pre-authenticated request grants access to the entire bucket
    # if the access type allows that. The object name can be a prefix as well, in that case pre-authenticated request
    # grants access to all the objects within the bucket starting with that prefix provided that we have the correct access type.
    #
    # @return [String]
    attr_accessor :object_name

    # **[Required]** The operation that can be performed on this resource.
    # @return [String]
    attr_reader :access_type

    # **[Required]** The expiration date for the pre-authenticated request as per [RFC 3339](https://tools.ietf.org/html/rfc3339).
    # After this date the pre-authenticated request will no longer be valid.
    #
    # @return [DateTime]
    attr_accessor :time_expires

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'bucket_listing_action': :'bucketListingAction',
        'object_name': :'objectName',
        'access_type': :'accessType',
        'time_expires': :'timeExpires'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'bucket_listing_action': :'String',
        'object_name': :'String',
        'access_type': :'String',
        'time_expires': :'DateTime'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :bucket_listing_action The value to assign to the {#bucket_listing_action} property
    # @option attributes [String] :object_name The value to assign to the {#object_name} property
    # @option attributes [String] :access_type The value to assign to the {#access_type} property
    # @option attributes [DateTime] :time_expires The value to assign to the {#time_expires} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.bucket_listing_action = attributes[:'bucketListingAction'] if attributes[:'bucketListingAction']
      self.bucket_listing_action = "Deny" if bucket_listing_action.nil? && !attributes.key?(:'bucketListingAction') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :bucketListingAction and :bucket_listing_action' if attributes.key?(:'bucketListingAction') && attributes.key?(:'bucket_listing_action')

      self.bucket_listing_action = attributes[:'bucket_listing_action'] if attributes[:'bucket_listing_action']
      self.bucket_listing_action = "Deny" if bucket_listing_action.nil? && !attributes.key?(:'bucketListingAction') && !attributes.key?(:'bucket_listing_action') # rubocop:disable Style/StringLiterals

      self.object_name = attributes[:'objectName'] if attributes[:'objectName']

      raise 'You cannot provide both :objectName and :object_name' if attributes.key?(:'objectName') && attributes.key?(:'object_name')

      self.object_name = attributes[:'object_name'] if attributes[:'object_name']

      self.access_type = attributes[:'accessType'] if attributes[:'accessType']

      raise 'You cannot provide both :accessType and :access_type' if attributes.key?(:'accessType') && attributes.key?(:'access_type')

      self.access_type = attributes[:'access_type'] if attributes[:'access_type']

      self.time_expires = attributes[:'timeExpires'] if attributes[:'timeExpires']

      raise 'You cannot provide both :timeExpires and :time_expires' if attributes.key?(:'timeExpires') && attributes.key?(:'time_expires')

      self.time_expires = attributes[:'time_expires'] if attributes[:'time_expires']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] access_type Object to be assigned
    def access_type=(access_type)
      raise "Invalid value for 'access_type': this must be one of the values in ACCESS_TYPE_ENUM." if access_type && !ACCESS_TYPE_ENUM.include?(access_type)

      @access_type = access_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        bucket_listing_action == other.bucket_listing_action &&
        object_name == other.object_name &&
        access_type == other.access_type &&
        time_expires == other.time_expires
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
      [name, bucket_listing_action, object_name, access_type, time_expires].hash
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
