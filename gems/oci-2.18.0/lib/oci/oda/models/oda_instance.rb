# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Description of `OdaServiceInstance` object.
  class Oda::Models::OdaInstance
    SHAPE_NAME_ENUM = [
      SHAPE_NAME_DEVELOPMENT = 'DEVELOPMENT'.freeze,
      SHAPE_NAME_PRODUCTION = 'PRODUCTION'.freeze,
      SHAPE_NAME_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_SUB_STATE_ENUM = [
      LIFECYCLE_SUB_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_SUB_STATE_STARTING = 'STARTING'.freeze,
      LIFECYCLE_SUB_STATE_STOPPING = 'STOPPING'.freeze,
      LIFECYCLE_SUB_STATE_CHANGING_COMPARTMENT = 'CHANGING_COMPARTMENT'.freeze,
      LIFECYCLE_SUB_STATE_ACTIVATING_CUSTOMER_ENCRYPTION_KEY = 'ACTIVATING_CUSTOMER_ENCRYPTION_KEY'.freeze,
      LIFECYCLE_SUB_STATE_UPDATING_CUSTOMER_ENCRYPTION_KEY = 'UPDATING_CUSTOMER_ENCRYPTION_KEY'.freeze,
      LIFECYCLE_SUB_STATE_DEACTIVATING_CUSTOMER_ENCRYPTION_KEY = 'DEACTIVATING_CUSTOMER_ENCRYPTION_KEY'.freeze,
      LIFECYCLE_SUB_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_SUB_STATE_DELETE_PENDING = 'DELETE_PENDING'.freeze,
      LIFECYCLE_SUB_STATE_RECOVERING = 'RECOVERING'.freeze,
      LIFECYCLE_SUB_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_SUB_STATE_PURGING = 'PURGING'.freeze,
      LIFECYCLE_SUB_STATE_QUEUED = 'QUEUED'.freeze,
      LIFECYCLE_SUB_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** Unique immutable identifier that was assigned when the instance was created.
    # @return [String]
    attr_accessor :id

    # User-defined name for the Digital Assistant instance. Avoid entering confidential information.
    # You can change this value.
    #
    # @return [String]
    attr_accessor :display_name

    # Description of the Digital Assistant instance.
    # @return [String]
    attr_accessor :description

    # **[Required]** Identifier of the compartment that the instance belongs to.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** Shape or size of the instance.
    # @return [String]
    attr_reader :shape_name

    # URL for the Digital Assistant web application that's associated with the instance.
    # @return [String]
    attr_accessor :web_app_url

    # URL for the connector's endpoint.
    # @return [String]
    attr_accessor :connector_url

    # When the Digital Assistant instance was created. A date-time string as described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339), section 14.29.
    # @return [DateTime]
    attr_accessor :time_created

    # When the Digital Assistance instance was last updated. A date-time string as described in [RFC 3339](https://tools.ietf.org/rfc/rfc3339), section 14.29.
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the Digital Assistant instance.
    # @return [String]
    attr_reader :lifecycle_state

    # The current sub-state of the Digital Assistant instance.
    # @return [String]
    attr_reader :lifecycle_sub_state

    # A message that describes the current state in more detail.
    # For example, actionable information about an instance that's in the `FAILED` state.
    #
    # @return [String]
    attr_accessor :state_message

    # Simple key-value pair that is applied without any predefined name, type, or scope.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Should this Digital Assistant instance use role-based authorization via an identity domain (true) or use the default policy-based authorization via IAM policies (false)
    # @return [BOOLEAN]
    attr_accessor :is_role_based_access

    # If isRoleBasedAccess is set to true, this property specifies the identity domain that is to be used to implement this type of authorzation. Digital Assistant will create an Identity Application instance and Application Roles within this identity domain. The caller may then perform and user roll mappings they like to grant access to users within the identity domain.
    # @return [String]
    attr_accessor :identity_domain

    # If isRoleBasedAccess is set to true, this property specifies the GUID of the Identity Application instance Digital Assistant has created inside the user-specified identity domain. This identity application instance may be used to host user roll mappings to grant access to this Digital Assistant instance for users within the identity domain.
    # @return [String]
    attr_accessor :identity_app_guid

    # If isRoleBasedAccess is set to true, this property specifies the URL for the administration console used to manage the Identity Application instance Digital Assistant has created inside the user-specified identity domain.
    # @return [String]
    attr_accessor :identity_app_console_url

    # A list of package names imported into this instance (if any). Use importedPackageIds field to get the details of the imported packages.
    # @return [Array<String>]
    attr_accessor :imported_package_names

    # A list of package ids imported into this instance (if any). Use GetImportedPackage to get the details of the imported packages.
    # @return [Array<String>]
    attr_accessor :imported_package_ids

    # A list of attachment types for this instance (if any). Use attachmentIds to get the details of the attachments.
    # @return [Array<String>]
    attr_accessor :attachment_types

    # A list of attachment identifiers for this instance (if any). Use GetOdaInstanceAttachment to get the details of the attachments.
    # @return [Array<String>]
    attr_accessor :attachment_ids

    # A list of restricted operations (across all attachments) for this instance (if any). Use GetOdaInstanceAttachment to get the details of the attachments.
    # @return [Array<OCI::Oda::Models::RestrictedOperation>]
    attr_accessor :restricted_operations

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'display_name': :'displayName',
        'description': :'description',
        'compartment_id': :'compartmentId',
        'shape_name': :'shapeName',
        'web_app_url': :'webAppUrl',
        'connector_url': :'connectorUrl',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'lifecycle_sub_state': :'lifecycleSubState',
        'state_message': :'stateMessage',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'is_role_based_access': :'isRoleBasedAccess',
        'identity_domain': :'identityDomain',
        'identity_app_guid': :'identityAppGuid',
        'identity_app_console_url': :'identityAppConsoleUrl',
        'imported_package_names': :'importedPackageNames',
        'imported_package_ids': :'importedPackageIds',
        'attachment_types': :'attachmentTypes',
        'attachment_ids': :'attachmentIds',
        'restricted_operations': :'restrictedOperations'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'description': :'String',
        'compartment_id': :'String',
        'shape_name': :'String',
        'web_app_url': :'String',
        'connector_url': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'lifecycle_sub_state': :'String',
        'state_message': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'is_role_based_access': :'BOOLEAN',
        'identity_domain': :'String',
        'identity_app_guid': :'String',
        'identity_app_console_url': :'String',
        'imported_package_names': :'Array<String>',
        'imported_package_ids': :'Array<String>',
        'attachment_types': :'Array<String>',
        'attachment_ids': :'Array<String>',
        'restricted_operations': :'Array<OCI::Oda::Models::RestrictedOperation>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :description The value to assign to the {#description} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :shape_name The value to assign to the {#shape_name} property
    # @option attributes [String] :web_app_url The value to assign to the {#web_app_url} property
    # @option attributes [String] :connector_url The value to assign to the {#connector_url} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :lifecycle_sub_state The value to assign to the {#lifecycle_sub_state} property
    # @option attributes [String] :state_message The value to assign to the {#state_message} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [BOOLEAN] :is_role_based_access The value to assign to the {#is_role_based_access} property
    # @option attributes [String] :identity_domain The value to assign to the {#identity_domain} property
    # @option attributes [String] :identity_app_guid The value to assign to the {#identity_app_guid} property
    # @option attributes [String] :identity_app_console_url The value to assign to the {#identity_app_console_url} property
    # @option attributes [Array<String>] :imported_package_names The value to assign to the {#imported_package_names} property
    # @option attributes [Array<String>] :imported_package_ids The value to assign to the {#imported_package_ids} property
    # @option attributes [Array<String>] :attachment_types The value to assign to the {#attachment_types} property
    # @option attributes [Array<String>] :attachment_ids The value to assign to the {#attachment_ids} property
    # @option attributes [Array<OCI::Oda::Models::RestrictedOperation>] :restricted_operations The value to assign to the {#restricted_operations} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.description = attributes[:'description'] if attributes[:'description']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.shape_name = attributes[:'shapeName'] if attributes[:'shapeName']

      raise 'You cannot provide both :shapeName and :shape_name' if attributes.key?(:'shapeName') && attributes.key?(:'shape_name')

      self.shape_name = attributes[:'shape_name'] if attributes[:'shape_name']

      self.web_app_url = attributes[:'webAppUrl'] if attributes[:'webAppUrl']

      raise 'You cannot provide both :webAppUrl and :web_app_url' if attributes.key?(:'webAppUrl') && attributes.key?(:'web_app_url')

      self.web_app_url = attributes[:'web_app_url'] if attributes[:'web_app_url']

      self.connector_url = attributes[:'connectorUrl'] if attributes[:'connectorUrl']

      raise 'You cannot provide both :connectorUrl and :connector_url' if attributes.key?(:'connectorUrl') && attributes.key?(:'connector_url')

      self.connector_url = attributes[:'connector_url'] if attributes[:'connector_url']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.lifecycle_sub_state = attributes[:'lifecycleSubState'] if attributes[:'lifecycleSubState']

      raise 'You cannot provide both :lifecycleSubState and :lifecycle_sub_state' if attributes.key?(:'lifecycleSubState') && attributes.key?(:'lifecycle_sub_state')

      self.lifecycle_sub_state = attributes[:'lifecycle_sub_state'] if attributes[:'lifecycle_sub_state']

      self.state_message = attributes[:'stateMessage'] if attributes[:'stateMessage']

      raise 'You cannot provide both :stateMessage and :state_message' if attributes.key?(:'stateMessage') && attributes.key?(:'state_message')

      self.state_message = attributes[:'state_message'] if attributes[:'state_message']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.is_role_based_access = attributes[:'isRoleBasedAccess'] unless attributes[:'isRoleBasedAccess'].nil?
      self.is_role_based_access = false if is_role_based_access.nil? && !attributes.key?(:'isRoleBasedAccess') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isRoleBasedAccess and :is_role_based_access' if attributes.key?(:'isRoleBasedAccess') && attributes.key?(:'is_role_based_access')

      self.is_role_based_access = attributes[:'is_role_based_access'] unless attributes[:'is_role_based_access'].nil?
      self.is_role_based_access = false if is_role_based_access.nil? && !attributes.key?(:'isRoleBasedAccess') && !attributes.key?(:'is_role_based_access') # rubocop:disable Style/StringLiterals

      self.identity_domain = attributes[:'identityDomain'] if attributes[:'identityDomain']

      raise 'You cannot provide both :identityDomain and :identity_domain' if attributes.key?(:'identityDomain') && attributes.key?(:'identity_domain')

      self.identity_domain = attributes[:'identity_domain'] if attributes[:'identity_domain']

      self.identity_app_guid = attributes[:'identityAppGuid'] if attributes[:'identityAppGuid']

      raise 'You cannot provide both :identityAppGuid and :identity_app_guid' if attributes.key?(:'identityAppGuid') && attributes.key?(:'identity_app_guid')

      self.identity_app_guid = attributes[:'identity_app_guid'] if attributes[:'identity_app_guid']

      self.identity_app_console_url = attributes[:'identityAppConsoleUrl'] if attributes[:'identityAppConsoleUrl']

      raise 'You cannot provide both :identityAppConsoleUrl and :identity_app_console_url' if attributes.key?(:'identityAppConsoleUrl') && attributes.key?(:'identity_app_console_url')

      self.identity_app_console_url = attributes[:'identity_app_console_url'] if attributes[:'identity_app_console_url']

      self.imported_package_names = attributes[:'importedPackageNames'] if attributes[:'importedPackageNames']

      raise 'You cannot provide both :importedPackageNames and :imported_package_names' if attributes.key?(:'importedPackageNames') && attributes.key?(:'imported_package_names')

      self.imported_package_names = attributes[:'imported_package_names'] if attributes[:'imported_package_names']

      self.imported_package_ids = attributes[:'importedPackageIds'] if attributes[:'importedPackageIds']

      raise 'You cannot provide both :importedPackageIds and :imported_package_ids' if attributes.key?(:'importedPackageIds') && attributes.key?(:'imported_package_ids')

      self.imported_package_ids = attributes[:'imported_package_ids'] if attributes[:'imported_package_ids']

      self.attachment_types = attributes[:'attachmentTypes'] if attributes[:'attachmentTypes']

      raise 'You cannot provide both :attachmentTypes and :attachment_types' if attributes.key?(:'attachmentTypes') && attributes.key?(:'attachment_types')

      self.attachment_types = attributes[:'attachment_types'] if attributes[:'attachment_types']

      self.attachment_ids = attributes[:'attachmentIds'] if attributes[:'attachmentIds']

      raise 'You cannot provide both :attachmentIds and :attachment_ids' if attributes.key?(:'attachmentIds') && attributes.key?(:'attachment_ids')

      self.attachment_ids = attributes[:'attachment_ids'] if attributes[:'attachment_ids']

      self.restricted_operations = attributes[:'restrictedOperations'] if attributes[:'restrictedOperations']

      raise 'You cannot provide both :restrictedOperations and :restricted_operations' if attributes.key?(:'restrictedOperations') && attributes.key?(:'restricted_operations')

      self.restricted_operations = attributes[:'restricted_operations'] if attributes[:'restricted_operations']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] shape_name Object to be assigned
    def shape_name=(shape_name)
      # rubocop:disable Style/ConditionalAssignment
      if shape_name && !SHAPE_NAME_ENUM.include?(shape_name)
        OCI.logger.debug("Unknown value for 'shape_name' [" + shape_name + "]. Mapping to 'SHAPE_NAME_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @shape_name = SHAPE_NAME_UNKNOWN_ENUM_VALUE
      else
        @shape_name = shape_name
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)
        OCI.logger.debug("Unknown value for 'lifecycle_state' [" + lifecycle_state + "]. Mapping to 'LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_state = LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_state = lifecycle_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_sub_state Object to be assigned
    def lifecycle_sub_state=(lifecycle_sub_state)
      # rubocop:disable Style/ConditionalAssignment
      if lifecycle_sub_state && !LIFECYCLE_SUB_STATE_ENUM.include?(lifecycle_sub_state)
        OCI.logger.debug("Unknown value for 'lifecycle_sub_state' [" + lifecycle_sub_state + "]. Mapping to 'LIFECYCLE_SUB_STATE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @lifecycle_sub_state = LIFECYCLE_SUB_STATE_UNKNOWN_ENUM_VALUE
      else
        @lifecycle_sub_state = lifecycle_sub_state
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        id == other.id &&
        display_name == other.display_name &&
        description == other.description &&
        compartment_id == other.compartment_id &&
        shape_name == other.shape_name &&
        web_app_url == other.web_app_url &&
        connector_url == other.connector_url &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        lifecycle_sub_state == other.lifecycle_sub_state &&
        state_message == other.state_message &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        is_role_based_access == other.is_role_based_access &&
        identity_domain == other.identity_domain &&
        identity_app_guid == other.identity_app_guid &&
        identity_app_console_url == other.identity_app_console_url &&
        imported_package_names == other.imported_package_names &&
        imported_package_ids == other.imported_package_ids &&
        attachment_types == other.attachment_types &&
        attachment_ids == other.attachment_ids &&
        restricted_operations == other.restricted_operations
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
      [id, display_name, description, compartment_id, shape_name, web_app_url, connector_url, time_created, time_updated, lifecycle_state, lifecycle_sub_state, state_message, freeform_tags, defined_tags, is_role_based_access, identity_domain, identity_app_guid, identity_app_console_url, imported_package_names, imported_package_ids, attachment_types, attachment_ids, restricted_operations].hash
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
