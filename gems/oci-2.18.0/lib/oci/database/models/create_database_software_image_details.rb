# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Parameters for creating a database software image in the specified compartment.
  #
  # **Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.
  #
  class Database::Models::CreateDatabaseSoftwareImageDetails
    IMAGE_SHAPE_FAMILY_ENUM = [
      IMAGE_SHAPE_FAMILY_VM_BM_SHAPE = 'VM_BM_SHAPE'.freeze,
      IMAGE_SHAPE_FAMILY_EXADATA_SHAPE = 'EXADATA_SHAPE'.freeze,
      IMAGE_SHAPE_FAMILY_EXACC_SHAPE = 'EXACC_SHAPE'.freeze
    ].freeze

    IMAGE_TYPE_ENUM = [
      IMAGE_TYPE_GRID_IMAGE = 'GRID_IMAGE'.freeze,
      IMAGE_TYPE_DATABASE_IMAGE = 'DATABASE_IMAGE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment the database software image  belongs in.
    # @return [String]
    attr_accessor :compartment_id

    # The database version with which the database software image is to be built.
    # @return [String]
    attr_accessor :database_version

    # **[Required]** The user-friendly name for the database software image. The name does not have to be unique.
    # @return [String]
    attr_accessor :display_name

    # To what shape the image is meant for.
    # @return [String]
    attr_reader :image_shape_family

    # The type of software image. Can be grid or database.
    # @return [String]
    attr_reader :image_type

    # The PSU or PBP or Release Updates. To get a list of supported versions, use the {#list_db_versions list_db_versions} operation.
    # @return [String]
    attr_accessor :patch_set

    # List of one-off patches for Database Homes.
    # @return [Array<String>]
    attr_accessor :database_software_image_one_off_patches

    # The output from the OPatch lsInventory command, which is passed as a string.
    # @return [String]
    attr_accessor :ls_inventory

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Database Home.
    # @return [String]
    attr_accessor :source_db_home_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'database_version': :'databaseVersion',
        'display_name': :'displayName',
        'image_shape_family': :'imageShapeFamily',
        'image_type': :'imageType',
        'patch_set': :'patchSet',
        'database_software_image_one_off_patches': :'databaseSoftwareImageOneOffPatches',
        'ls_inventory': :'lsInventory',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'source_db_home_id': :'sourceDbHomeId'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'database_version': :'String',
        'display_name': :'String',
        'image_shape_family': :'String',
        'image_type': :'String',
        'patch_set': :'String',
        'database_software_image_one_off_patches': :'Array<String>',
        'ls_inventory': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'source_db_home_id': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :database_version The value to assign to the {#database_version} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :image_shape_family The value to assign to the {#image_shape_family} property
    # @option attributes [String] :image_type The value to assign to the {#image_type} property
    # @option attributes [String] :patch_set The value to assign to the {#patch_set} property
    # @option attributes [Array<String>] :database_software_image_one_off_patches The value to assign to the {#database_software_image_one_off_patches} property
    # @option attributes [String] :ls_inventory The value to assign to the {#ls_inventory} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [String] :source_db_home_id The value to assign to the {#source_db_home_id} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.database_version = attributes[:'databaseVersion'] if attributes[:'databaseVersion']

      raise 'You cannot provide both :databaseVersion and :database_version' if attributes.key?(:'databaseVersion') && attributes.key?(:'database_version')

      self.database_version = attributes[:'database_version'] if attributes[:'database_version']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.image_shape_family = attributes[:'imageShapeFamily'] if attributes[:'imageShapeFamily']
      self.image_shape_family = "VM_BM_SHAPE" if image_shape_family.nil? && !attributes.key?(:'imageShapeFamily') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :imageShapeFamily and :image_shape_family' if attributes.key?(:'imageShapeFamily') && attributes.key?(:'image_shape_family')

      self.image_shape_family = attributes[:'image_shape_family'] if attributes[:'image_shape_family']
      self.image_shape_family = "VM_BM_SHAPE" if image_shape_family.nil? && !attributes.key?(:'imageShapeFamily') && !attributes.key?(:'image_shape_family') # rubocop:disable Style/StringLiterals

      self.image_type = attributes[:'imageType'] if attributes[:'imageType']
      self.image_type = "DATABASE_IMAGE" if image_type.nil? && !attributes.key?(:'imageType') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :imageType and :image_type' if attributes.key?(:'imageType') && attributes.key?(:'image_type')

      self.image_type = attributes[:'image_type'] if attributes[:'image_type']
      self.image_type = "DATABASE_IMAGE" if image_type.nil? && !attributes.key?(:'imageType') && !attributes.key?(:'image_type') # rubocop:disable Style/StringLiterals

      self.patch_set = attributes[:'patchSet'] if attributes[:'patchSet']

      raise 'You cannot provide both :patchSet and :patch_set' if attributes.key?(:'patchSet') && attributes.key?(:'patch_set')

      self.patch_set = attributes[:'patch_set'] if attributes[:'patch_set']

      self.database_software_image_one_off_patches = attributes[:'databaseSoftwareImageOneOffPatches'] if attributes[:'databaseSoftwareImageOneOffPatches']

      raise 'You cannot provide both :databaseSoftwareImageOneOffPatches and :database_software_image_one_off_patches' if attributes.key?(:'databaseSoftwareImageOneOffPatches') && attributes.key?(:'database_software_image_one_off_patches')

      self.database_software_image_one_off_patches = attributes[:'database_software_image_one_off_patches'] if attributes[:'database_software_image_one_off_patches']

      self.ls_inventory = attributes[:'lsInventory'] if attributes[:'lsInventory']

      raise 'You cannot provide both :lsInventory and :ls_inventory' if attributes.key?(:'lsInventory') && attributes.key?(:'ls_inventory')

      self.ls_inventory = attributes[:'ls_inventory'] if attributes[:'ls_inventory']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.source_db_home_id = attributes[:'sourceDbHomeId'] if attributes[:'sourceDbHomeId']

      raise 'You cannot provide both :sourceDbHomeId and :source_db_home_id' if attributes.key?(:'sourceDbHomeId') && attributes.key?(:'source_db_home_id')

      self.source_db_home_id = attributes[:'source_db_home_id'] if attributes[:'source_db_home_id']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] image_shape_family Object to be assigned
    def image_shape_family=(image_shape_family)
      raise "Invalid value for 'image_shape_family': this must be one of the values in IMAGE_SHAPE_FAMILY_ENUM." if image_shape_family && !IMAGE_SHAPE_FAMILY_ENUM.include?(image_shape_family)

      @image_shape_family = image_shape_family
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] image_type Object to be assigned
    def image_type=(image_type)
      raise "Invalid value for 'image_type': this must be one of the values in IMAGE_TYPE_ENUM." if image_type && !IMAGE_TYPE_ENUM.include?(image_type)

      @image_type = image_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        database_version == other.database_version &&
        display_name == other.display_name &&
        image_shape_family == other.image_shape_family &&
        image_type == other.image_type &&
        patch_set == other.patch_set &&
        database_software_image_one_off_patches == other.database_software_image_one_off_patches &&
        ls_inventory == other.ls_inventory &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        source_db_home_id == other.source_db_home_id
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
      [compartment_id, database_version, display_name, image_shape_family, image_type, patch_set, database_software_image_one_off_patches, ls_inventory, freeform_tags, defined_tags, source_db_home_id].hash
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