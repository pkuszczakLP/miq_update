# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The product license details.
  class LicenseManager::Models::ProductLicense
    STATUS_ENUM = [
      STATUS_INCOMPLETE = 'INCOMPLETE'.freeze,
      STATUS_ISSUES_FOUND = 'ISSUES_FOUND'.freeze,
      STATUS_WARNING = 'WARNING'.freeze,
      STATUS_OK = 'OK'.freeze,
      STATUS_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_INACTIVE = 'INACTIVE'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LICENSE_UNIT_ENUM = [
      LICENSE_UNIT_OCPU = 'OCPU'.freeze,
      LICENSE_UNIT_NAMED_USER_PLUS = 'NAMED_USER_PLUS'.freeze,
      LICENSE_UNIT_PROCESSORS = 'PROCESSORS'.freeze,
      LICENSE_UNIT_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The product license [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm).
    # @return [String]
    attr_accessor :id

    # **[Required]** The compartment [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) where the product license is created.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The current product license status.
    # @return [String]
    attr_reader :status

    # Status description for the current product license status.
    #
    # @return [String]
    attr_accessor :status_description

    # The total number of licenses available for the product license, calculated by adding up all the license counts for active license records associated with the product license.
    # @return [Integer]
    attr_accessor :total_active_license_unit_count

    # The current product license state.
    # @return [String]
    attr_reader :lifecycle_state

    # The number of license units consumed. Updated after each allocation run.
    #
    # @return [Float]
    attr_accessor :total_license_units_consumed

    # The number of license records associated with the product license.
    #
    # @return [Integer]
    attr_accessor :total_license_record_count

    # The number of active license records associated with the product license.
    # @return [Integer]
    attr_accessor :active_license_record_count

    # **[Required]** The product license unit.
    # @return [String]
    attr_reader :license_unit

    # **[Required]** Specifies whether the vendor is Oracle or a third party.
    # @return [BOOLEAN]
    attr_accessor :is_vendor_oracle

    # Specifies whether or not the product license is oversubscribed.
    # @return [BOOLEAN]
    attr_accessor :is_over_subscribed

    # Specifies if the license unit count is unlimited.
    # @return [BOOLEAN]
    attr_accessor :is_unlimited

    # **[Required]** License record name
    #
    # @return [String]
    attr_accessor :display_name

    # The vendor of the ProductLicense
    #
    # @return [String]
    attr_accessor :vendor_name

    # The time the product license was created. An [RFC 3339](https://tools.ietf.org/html/rfc3339)-formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_created

    # The time the product license was updated. An [RFC 3339](https://tools.ietf.org/html/rfc3339)-formatted datetime string.
    # @return [DateTime]
    attr_accessor :time_updated

    # The images associated with the product license.
    # @return [Array<OCI::LicenseManager::Models::ImageResponse>]
    attr_accessor :images

    # Simple key-value pair that is applied without any predefined name, type, or scope. Exists for cross-compatibility only.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Usage of system tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"orcl-cloud\": {\"free-tier-retained\": \"true\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'id',
        'compartment_id': :'compartmentId',
        'status': :'status',
        'status_description': :'statusDescription',
        'total_active_license_unit_count': :'totalActiveLicenseUnitCount',
        'lifecycle_state': :'lifecycleState',
        'total_license_units_consumed': :'totalLicenseUnitsConsumed',
        'total_license_record_count': :'totalLicenseRecordCount',
        'active_license_record_count': :'activeLicenseRecordCount',
        'license_unit': :'licenseUnit',
        'is_vendor_oracle': :'isVendorOracle',
        'is_over_subscribed': :'isOverSubscribed',
        'is_unlimited': :'isUnlimited',
        'display_name': :'displayName',
        'vendor_name': :'vendorName',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'images': :'images',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'system_tags': :'systemTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'compartment_id': :'String',
        'status': :'String',
        'status_description': :'String',
        'total_active_license_unit_count': :'Integer',
        'lifecycle_state': :'String',
        'total_license_units_consumed': :'Float',
        'total_license_record_count': :'Integer',
        'active_license_record_count': :'Integer',
        'license_unit': :'String',
        'is_vendor_oracle': :'BOOLEAN',
        'is_over_subscribed': :'BOOLEAN',
        'is_unlimited': :'BOOLEAN',
        'display_name': :'String',
        'vendor_name': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'images': :'Array<OCI::LicenseManager::Models::ImageResponse>',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'system_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :status The value to assign to the {#status} property
    # @option attributes [String] :status_description The value to assign to the {#status_description} property
    # @option attributes [Integer] :total_active_license_unit_count The value to assign to the {#total_active_license_unit_count} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [Float] :total_license_units_consumed The value to assign to the {#total_license_units_consumed} property
    # @option attributes [Integer] :total_license_record_count The value to assign to the {#total_license_record_count} property
    # @option attributes [Integer] :active_license_record_count The value to assign to the {#active_license_record_count} property
    # @option attributes [String] :license_unit The value to assign to the {#license_unit} property
    # @option attributes [BOOLEAN] :is_vendor_oracle The value to assign to the {#is_vendor_oracle} property
    # @option attributes [BOOLEAN] :is_over_subscribed The value to assign to the {#is_over_subscribed} property
    # @option attributes [BOOLEAN] :is_unlimited The value to assign to the {#is_unlimited} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :vendor_name The value to assign to the {#vendor_name} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [Array<OCI::LicenseManager::Models::ImageResponse>] :images The value to assign to the {#images} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.status = attributes[:'status'] if attributes[:'status']

      self.status_description = attributes[:'statusDescription'] if attributes[:'statusDescription']

      raise 'You cannot provide both :statusDescription and :status_description' if attributes.key?(:'statusDescription') && attributes.key?(:'status_description')

      self.status_description = attributes[:'status_description'] if attributes[:'status_description']

      self.total_active_license_unit_count = attributes[:'totalActiveLicenseUnitCount'] if attributes[:'totalActiveLicenseUnitCount']

      raise 'You cannot provide both :totalActiveLicenseUnitCount and :total_active_license_unit_count' if attributes.key?(:'totalActiveLicenseUnitCount') && attributes.key?(:'total_active_license_unit_count')

      self.total_active_license_unit_count = attributes[:'total_active_license_unit_count'] if attributes[:'total_active_license_unit_count']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.total_license_units_consumed = attributes[:'totalLicenseUnitsConsumed'] if attributes[:'totalLicenseUnitsConsumed']
      self.total_license_units_consumed = 0.0 if total_license_units_consumed.nil? && !attributes.key?(:'totalLicenseUnitsConsumed') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :totalLicenseUnitsConsumed and :total_license_units_consumed' if attributes.key?(:'totalLicenseUnitsConsumed') && attributes.key?(:'total_license_units_consumed')

      self.total_license_units_consumed = attributes[:'total_license_units_consumed'] if attributes[:'total_license_units_consumed']
      self.total_license_units_consumed = 0.0 if total_license_units_consumed.nil? && !attributes.key?(:'totalLicenseUnitsConsumed') && !attributes.key?(:'total_license_units_consumed') # rubocop:disable Style/StringLiterals

      self.total_license_record_count = attributes[:'totalLicenseRecordCount'] if attributes[:'totalLicenseRecordCount']

      raise 'You cannot provide both :totalLicenseRecordCount and :total_license_record_count' if attributes.key?(:'totalLicenseRecordCount') && attributes.key?(:'total_license_record_count')

      self.total_license_record_count = attributes[:'total_license_record_count'] if attributes[:'total_license_record_count']

      self.active_license_record_count = attributes[:'activeLicenseRecordCount'] if attributes[:'activeLicenseRecordCount']

      raise 'You cannot provide both :activeLicenseRecordCount and :active_license_record_count' if attributes.key?(:'activeLicenseRecordCount') && attributes.key?(:'active_license_record_count')

      self.active_license_record_count = attributes[:'active_license_record_count'] if attributes[:'active_license_record_count']

      self.license_unit = attributes[:'licenseUnit'] if attributes[:'licenseUnit']

      raise 'You cannot provide both :licenseUnit and :license_unit' if attributes.key?(:'licenseUnit') && attributes.key?(:'license_unit')

      self.license_unit = attributes[:'license_unit'] if attributes[:'license_unit']

      self.is_vendor_oracle = attributes[:'isVendorOracle'] unless attributes[:'isVendorOracle'].nil?
      self.is_vendor_oracle = false if is_vendor_oracle.nil? && !attributes.key?(:'isVendorOracle') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isVendorOracle and :is_vendor_oracle' if attributes.key?(:'isVendorOracle') && attributes.key?(:'is_vendor_oracle')

      self.is_vendor_oracle = attributes[:'is_vendor_oracle'] unless attributes[:'is_vendor_oracle'].nil?
      self.is_vendor_oracle = false if is_vendor_oracle.nil? && !attributes.key?(:'isVendorOracle') && !attributes.key?(:'is_vendor_oracle') # rubocop:disable Style/StringLiterals

      self.is_over_subscribed = attributes[:'isOverSubscribed'] unless attributes[:'isOverSubscribed'].nil?
      self.is_over_subscribed = false if is_over_subscribed.nil? && !attributes.key?(:'isOverSubscribed') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isOverSubscribed and :is_over_subscribed' if attributes.key?(:'isOverSubscribed') && attributes.key?(:'is_over_subscribed')

      self.is_over_subscribed = attributes[:'is_over_subscribed'] unless attributes[:'is_over_subscribed'].nil?
      self.is_over_subscribed = false if is_over_subscribed.nil? && !attributes.key?(:'isOverSubscribed') && !attributes.key?(:'is_over_subscribed') # rubocop:disable Style/StringLiterals

      self.is_unlimited = attributes[:'isUnlimited'] unless attributes[:'isUnlimited'].nil?
      self.is_unlimited = false if is_unlimited.nil? && !attributes.key?(:'isUnlimited') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isUnlimited and :is_unlimited' if attributes.key?(:'isUnlimited') && attributes.key?(:'is_unlimited')

      self.is_unlimited = attributes[:'is_unlimited'] unless attributes[:'is_unlimited'].nil?
      self.is_unlimited = false if is_unlimited.nil? && !attributes.key?(:'isUnlimited') && !attributes.key?(:'is_unlimited') # rubocop:disable Style/StringLiterals

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.vendor_name = attributes[:'vendorName'] if attributes[:'vendorName']

      raise 'You cannot provide both :vendorName and :vendor_name' if attributes.key?(:'vendorName') && attributes.key?(:'vendor_name')

      self.vendor_name = attributes[:'vendor_name'] if attributes[:'vendor_name']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.images = attributes[:'images'] if attributes[:'images']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.system_tags = attributes[:'systemTags'] if attributes[:'systemTags']

      raise 'You cannot provide both :systemTags and :system_tags' if attributes.key?(:'systemTags') && attributes.key?(:'system_tags')

      self.system_tags = attributes[:'system_tags'] if attributes[:'system_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      # rubocop:disable Style/ConditionalAssignment
      if status && !STATUS_ENUM.include?(status)
        OCI.logger.debug("Unknown value for 'status' [" + status + "]. Mapping to 'STATUS_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @status = STATUS_UNKNOWN_ENUM_VALUE
      else
        @status = status
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
    # @param [Object] license_unit Object to be assigned
    def license_unit=(license_unit)
      # rubocop:disable Style/ConditionalAssignment
      if license_unit && !LICENSE_UNIT_ENUM.include?(license_unit)
        OCI.logger.debug("Unknown value for 'license_unit' [" + license_unit + "]. Mapping to 'LICENSE_UNIT_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @license_unit = LICENSE_UNIT_UNKNOWN_ENUM_VALUE
      else
        @license_unit = license_unit
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
        compartment_id == other.compartment_id &&
        status == other.status &&
        status_description == other.status_description &&
        total_active_license_unit_count == other.total_active_license_unit_count &&
        lifecycle_state == other.lifecycle_state &&
        total_license_units_consumed == other.total_license_units_consumed &&
        total_license_record_count == other.total_license_record_count &&
        active_license_record_count == other.active_license_record_count &&
        license_unit == other.license_unit &&
        is_vendor_oracle == other.is_vendor_oracle &&
        is_over_subscribed == other.is_over_subscribed &&
        is_unlimited == other.is_unlimited &&
        display_name == other.display_name &&
        vendor_name == other.vendor_name &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        images == other.images &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        system_tags == other.system_tags
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
      [id, compartment_id, status, status_description, total_active_license_unit_count, lifecycle_state, total_license_units_consumed, total_license_record_count, active_license_record_count, license_unit, is_vendor_oracle, is_over_subscribed, is_unlimited, display_name, vendor_name, time_created, time_updated, images, freeform_tags, defined_tags, system_tags].hash
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
