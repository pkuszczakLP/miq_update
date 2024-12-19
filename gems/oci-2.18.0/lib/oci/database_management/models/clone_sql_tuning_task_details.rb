# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The request to clone and run a SQL tuning task. The new task uses the same inputs as the one being cloned.
  class DatabaseManagement::Models::CloneSqlTuningTaskDetails
    # **[Required]** The name of the SQL tuning task. The name is unique per user in a database, and it is case-sensitive.
    # @return [String]
    attr_accessor :task_name

    # **[Required]** The identifier of the SQL tuning task being cloned. This is not the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
    # It can be retrieved from the following endpoint
    # {#list_sql_tuning_advisor_tasks list_sql_tuning_advisor_tasks}.
    #
    # @return [Integer]
    attr_accessor :original_task_id

    # The description of the SQL tuning task.
    # @return [String]
    attr_accessor :task_description

    # This attribute is required.
    # @return [OCI::DatabaseManagement::Models::SqlTuningTaskCredentialDetails]
    attr_accessor :credential_details

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'task_name': :'taskName',
        'original_task_id': :'originalTaskId',
        'task_description': :'taskDescription',
        'credential_details': :'credentialDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'task_name': :'String',
        'original_task_id': :'Integer',
        'task_description': :'String',
        'credential_details': :'OCI::DatabaseManagement::Models::SqlTuningTaskCredentialDetails'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :task_name The value to assign to the {#task_name} property
    # @option attributes [Integer] :original_task_id The value to assign to the {#original_task_id} property
    # @option attributes [String] :task_description The value to assign to the {#task_description} property
    # @option attributes [OCI::DatabaseManagement::Models::SqlTuningTaskCredentialDetails] :credential_details The value to assign to the {#credential_details} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.task_name = attributes[:'taskName'] if attributes[:'taskName']

      raise 'You cannot provide both :taskName and :task_name' if attributes.key?(:'taskName') && attributes.key?(:'task_name')

      self.task_name = attributes[:'task_name'] if attributes[:'task_name']

      self.original_task_id = attributes[:'originalTaskId'] if attributes[:'originalTaskId']

      raise 'You cannot provide both :originalTaskId and :original_task_id' if attributes.key?(:'originalTaskId') && attributes.key?(:'original_task_id')

      self.original_task_id = attributes[:'original_task_id'] if attributes[:'original_task_id']

      self.task_description = attributes[:'taskDescription'] if attributes[:'taskDescription']

      raise 'You cannot provide both :taskDescription and :task_description' if attributes.key?(:'taskDescription') && attributes.key?(:'task_description')

      self.task_description = attributes[:'task_description'] if attributes[:'task_description']

      self.credential_details = attributes[:'credentialDetails'] if attributes[:'credentialDetails']

      raise 'You cannot provide both :credentialDetails and :credential_details' if attributes.key?(:'credentialDetails') && attributes.key?(:'credential_details')

      self.credential_details = attributes[:'credential_details'] if attributes[:'credential_details']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        task_name == other.task_name &&
        original_task_id == other.original_task_id &&
        task_description == other.task_description &&
        credential_details == other.credential_details
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
      [task_name, original_task_id, task_description, credential_details].hash
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
