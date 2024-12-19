# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The model for an Oracle Cloud Infrastructure Marketplace publication.
  class Marketplace::Models::Publication
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    PACKAGE_TYPE_ENUM = [
      PACKAGE_TYPE_ORCHESTRATION = 'ORCHESTRATION'.freeze,
      PACKAGE_TYPE_IMAGE = 'IMAGE'.freeze,
      PACKAGE_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    LISTING_TYPE_ENUM = [
      LISTING_TYPE_COMMUNITY = 'COMMUNITY'.freeze,
      LISTING_TYPE_PARTNER = 'PARTNER'.freeze,
      LISTING_TYPE_PRIVATE = 'PRIVATE'.freeze,
      LISTING_TYPE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # The lifecycle state of the publication.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment where the publication exists.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** The unique identifier for the publication in Marketplace.
    # @return [String]
    attr_accessor :id

    # **[Required]** The name of the publication, which is also used in the listing.
    # @return [String]
    attr_accessor :name

    # A short description of the publication to use in the listing.
    # @return [String]
    attr_accessor :short_description

    # A long description of the publication to use in the listing.
    # @return [String]
    attr_accessor :long_description

    # Contact information for getting support from the publisher for the listing.
    # @return [Array<OCI::Marketplace::Models::SupportContact>]
    attr_accessor :support_contacts

    # @return [OCI::Marketplace::Models::UploadData]
    attr_accessor :icon

    # The listing's package type.
    # @return [String]
    attr_reader :package_type

    # **[Required]** The publisher category to which the publication belongs. The publisher category informs where the listing appears for use.
    # @return [String]
    attr_reader :listing_type

    # The list of operating systems supprted by the listing.
    # @return [Array<OCI::Marketplace::Models::OperatingSystem>]
    attr_accessor :supported_operating_systems

    # The date and time the publication was created, expressed in [RFC 3339](https://tools.ietf.org/html/rfc3339)
    # timestamp format.
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The defined tags associated with this resource, if any. Each key is predefined and scoped to namespaces.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The freeform tags associated with this resource, if any. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'lifecycle_state': :'lifecycleState',
        'compartment_id': :'compartmentId',
        'id': :'id',
        'name': :'name',
        'short_description': :'shortDescription',
        'long_description': :'longDescription',
        'support_contacts': :'supportContacts',
        'icon': :'icon',
        'package_type': :'packageType',
        'listing_type': :'listingType',
        'supported_operating_systems': :'supportedOperatingSystems',
        'time_created': :'timeCreated',
        'defined_tags': :'definedTags',
        'freeform_tags': :'freeformTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'lifecycle_state': :'String',
        'compartment_id': :'String',
        'id': :'String',
        'name': :'String',
        'short_description': :'String',
        'long_description': :'String',
        'support_contacts': :'Array<OCI::Marketplace::Models::SupportContact>',
        'icon': :'OCI::Marketplace::Models::UploadData',
        'package_type': :'String',
        'listing_type': :'String',
        'supported_operating_systems': :'Array<OCI::Marketplace::Models::OperatingSystem>',
        'time_created': :'DateTime',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'freeform_tags': :'Hash<String, String>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :short_description The value to assign to the {#short_description} property
    # @option attributes [String] :long_description The value to assign to the {#long_description} property
    # @option attributes [Array<OCI::Marketplace::Models::SupportContact>] :support_contacts The value to assign to the {#support_contacts} property
    # @option attributes [OCI::Marketplace::Models::UploadData] :icon The value to assign to the {#icon} property
    # @option attributes [String] :package_type The value to assign to the {#package_type} property
    # @option attributes [String] :listing_type The value to assign to the {#listing_type} property
    # @option attributes [Array<OCI::Marketplace::Models::OperatingSystem>] :supported_operating_systems The value to assign to the {#supported_operating_systems} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.id = attributes[:'id'] if attributes[:'id']

      self.name = attributes[:'name'] if attributes[:'name']

      self.short_description = attributes[:'shortDescription'] if attributes[:'shortDescription']

      raise 'You cannot provide both :shortDescription and :short_description' if attributes.key?(:'shortDescription') && attributes.key?(:'short_description')

      self.short_description = attributes[:'short_description'] if attributes[:'short_description']

      self.long_description = attributes[:'longDescription'] if attributes[:'longDescription']

      raise 'You cannot provide both :longDescription and :long_description' if attributes.key?(:'longDescription') && attributes.key?(:'long_description')

      self.long_description = attributes[:'long_description'] if attributes[:'long_description']

      self.support_contacts = attributes[:'supportContacts'] if attributes[:'supportContacts']

      raise 'You cannot provide both :supportContacts and :support_contacts' if attributes.key?(:'supportContacts') && attributes.key?(:'support_contacts')

      self.support_contacts = attributes[:'support_contacts'] if attributes[:'support_contacts']

      self.icon = attributes[:'icon'] if attributes[:'icon']

      self.package_type = attributes[:'packageType'] if attributes[:'packageType']

      raise 'You cannot provide both :packageType and :package_type' if attributes.key?(:'packageType') && attributes.key?(:'package_type')

      self.package_type = attributes[:'package_type'] if attributes[:'package_type']

      self.listing_type = attributes[:'listingType'] if attributes[:'listingType']

      raise 'You cannot provide both :listingType and :listing_type' if attributes.key?(:'listingType') && attributes.key?(:'listing_type')

      self.listing_type = attributes[:'listing_type'] if attributes[:'listing_type']

      self.supported_operating_systems = attributes[:'supportedOperatingSystems'] if attributes[:'supportedOperatingSystems']

      raise 'You cannot provide both :supportedOperatingSystems and :supported_operating_systems' if attributes.key?(:'supportedOperatingSystems') && attributes.key?(:'supported_operating_systems')

      self.supported_operating_systems = attributes[:'supported_operating_systems'] if attributes[:'supported_operating_systems']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

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
    # @param [Object] package_type Object to be assigned
    def package_type=(package_type)
      # rubocop:disable Style/ConditionalAssignment
      if package_type && !PACKAGE_TYPE_ENUM.include?(package_type)
        OCI.logger.debug("Unknown value for 'package_type' [" + package_type + "]. Mapping to 'PACKAGE_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @package_type = PACKAGE_TYPE_UNKNOWN_ENUM_VALUE
      else
        @package_type = package_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] listing_type Object to be assigned
    def listing_type=(listing_type)
      # rubocop:disable Style/ConditionalAssignment
      if listing_type && !LISTING_TYPE_ENUM.include?(listing_type)
        OCI.logger.debug("Unknown value for 'listing_type' [" + listing_type + "]. Mapping to 'LISTING_TYPE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @listing_type = LISTING_TYPE_UNKNOWN_ENUM_VALUE
      else
        @listing_type = listing_type
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        lifecycle_state == other.lifecycle_state &&
        compartment_id == other.compartment_id &&
        id == other.id &&
        name == other.name &&
        short_description == other.short_description &&
        long_description == other.long_description &&
        support_contacts == other.support_contacts &&
        icon == other.icon &&
        package_type == other.package_type &&
        listing_type == other.listing_type &&
        supported_operating_systems == other.supported_operating_systems &&
        time_created == other.time_created &&
        defined_tags == other.defined_tags &&
        freeform_tags == other.freeform_tags
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
      [lifecycle_state, compartment_id, id, name, short_description, long_description, support_contacts, icon, package_type, listing_type, supported_operating_systems, time_created, defined_tags, freeform_tags].hash
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
