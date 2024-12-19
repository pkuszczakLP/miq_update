# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The destination details for the image export.
  #
  # Set `destinationType` to `objectStorageTuple`
  # and use {#export_image_via_object_storage_tuple_details export_image_via_object_storage_tuple_details}
  # when specifying the namespace, bucket name, and object name.
  #
  # Set `destinationType` to `objectStorageUri` and
  # use {#export_image_via_object_storage_uri_details export_image_via_object_storage_uri_details}
  # when specifying the Object Storage URL.
  #
  # This class has direct subclasses. If you are using this class as input to a service operations then you should favor using a subclass over the base class
  class Core::Models::ExportImageDetails
    EXPORT_FORMAT_ENUM = [
      EXPORT_FORMAT_QCOW2 = 'QCOW2'.freeze,
      EXPORT_FORMAT_VMDK = 'VMDK'.freeze,
      EXPORT_FORMAT_OCI = 'OCI'.freeze,
      EXPORT_FORMAT_VHD = 'VHD'.freeze,
      EXPORT_FORMAT_VDI = 'VDI'.freeze
    ].freeze

    # **[Required]** The destination type. Use `objectStorageTuple` when specifying the namespace, bucket name, and object name.
    # Use `objectStorageUri` when specifying the Object Storage URL.
    #
    # @return [String]
    attr_accessor :destination_type

    # The format to export the image to. The default value is `OCI`.
    #
    # The following image formats are available:
    #
    # - `OCI` - Oracle Cloud Infrastructure file with a QCOW2 image and Oracle Cloud Infrastructure metadata (.oci).
    # Use this format to export a custom image that you want to import into other tenancies or regions.
    # - `QCOW2` - QEMU Copy On Write (.qcow2)
    # - `VDI` - Virtual Disk Image (.vdi) for Oracle VM VirtualBox
    # - `VHD` - Virtual Hard Disk (.vhd) for Hyper-V
    # - `VMDK` - Virtual Machine Disk (.vmdk)
    #
    # @return [String]
    attr_reader :export_format

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'destination_type': :'destinationType',
        'export_format': :'exportFormat'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'destination_type': :'String',
        'export_format': :'String'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize


    # Given the hash representation of a subtype of this class,
    # use the info in the hash to return the class of the subtype.
    def self.get_subtype(object_hash)
      type = object_hash[:'destinationType'] # rubocop:disable Style/SymbolLiteral

      return 'OCI::Core::Models::ExportImageViaObjectStorageUriDetails' if type == 'objectStorageUri'
      return 'OCI::Core::Models::ExportImageViaObjectStorageTupleDetails' if type == 'objectStorageTuple'

      # TODO: Log a warning when the subtype is not found.
      'OCI::Core::Models::ExportImageDetails'
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Layout/EmptyLines, Metrics/PerceivedComplexity, Metrics/AbcSize

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :destination_type The value to assign to the {#destination_type} property
    # @option attributes [String] :export_format The value to assign to the {#export_format} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.destination_type = attributes[:'destinationType'] if attributes[:'destinationType']

      raise 'You cannot provide both :destinationType and :destination_type' if attributes.key?(:'destinationType') && attributes.key?(:'destination_type')

      self.destination_type = attributes[:'destination_type'] if attributes[:'destination_type']

      self.export_format = attributes[:'exportFormat'] if attributes[:'exportFormat']

      raise 'You cannot provide both :exportFormat and :export_format' if attributes.key?(:'exportFormat') && attributes.key?(:'export_format')

      self.export_format = attributes[:'export_format'] if attributes[:'export_format']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] export_format Object to be assigned
    def export_format=(export_format)
      raise "Invalid value for 'export_format': this must be one of the values in EXPORT_FORMAT_ENUM." if export_format && !EXPORT_FORMAT_ENUM.include?(export_format)

      @export_format = export_format
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        destination_type == other.destination_type &&
        export_format == other.export_format
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
      [destination_type, export_format].hash
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