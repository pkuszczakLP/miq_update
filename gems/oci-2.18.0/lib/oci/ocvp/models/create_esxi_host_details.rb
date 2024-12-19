# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Details of the ESXi host to add to the SDDC.
  class Ocvp::Models::CreateEsxiHostDetails
    CURRENT_SKU_ENUM = [
      CURRENT_SKU_HOUR = 'HOUR'.freeze,
      CURRENT_SKU_MONTH = 'MONTH'.freeze,
      CURRENT_SKU_ONE_YEAR = 'ONE_YEAR'.freeze,
      CURRENT_SKU_THREE_YEARS = 'THREE_YEARS'.freeze
    ].freeze

    NEXT_SKU_ENUM = [
      NEXT_SKU_HOUR = 'HOUR'.freeze,
      NEXT_SKU_MONTH = 'MONTH'.freeze,
      NEXT_SKU_ONE_YEAR = 'ONE_YEAR'.freeze,
      NEXT_SKU_THREE_YEARS = 'THREE_YEARS'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC to add the
    # ESXi host to.
    #
    # @return [String]
    attr_accessor :sddc_id

    # A descriptive name for the ESXi host. It's changeable.
    # Esxi Host name requirements are 1-16 character length limit, Must start with a letter, Must be English letters, numbers, - only, No repeating hyphens, Must be unique within the SDDC.
    #
    # If this attribute is not specified, the SDDC's `instanceDisplayNamePrefix` attribute is used
    # to name and incrementally number the ESXi host. For example, if you're creating the fourth
    # ESXi host in the SDDC, and `instanceDisplayNamePrefix` is `MySDDC`, the host's display
    # name is `MySDDC-4`.
    #
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # The billing option currently used by the ESXi host.
    # {#list_supported_skus list_supported_skus}.
    #
    # @return [String]
    attr_reader :current_sku

    # The billing option to switch to after the existing billing cycle ends.
    # If `nextSku` is null or empty, `currentSku` continues to the next billing cycle.
    # {#list_supported_skus list_supported_skus}.
    #
    # @return [String]
    attr_reader :next_sku

    # The availability domain to create the ESXi host in.
    # If keep empty, for AD-specific SDDC, new ESXi host will be created in the same availability domain;
    # for multi-AD SDDC, new ESXi host will be auto assigned to the next availability domain following evenly distribution strategy.
    #
    # @return [String]
    attr_accessor :compute_availability_domain

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the ESXi host that
    # is failed. This is an optional parameter. If this parameter is specified, a new ESXi
    # host will be created to replace the failed one, and the `failedEsxiHostId` field
    # will be udpated in the newly created Esxi host.
    #
    # @return [String]
    attr_accessor :failed_esxi_host_id

    # The compute shape name of the ESXi host.
    # {#list_supported_host_shapes list_supported_host_shapes}.
    #
    # @return [String]
    attr_accessor :host_shape_name

    # The OCPU count of the ESXi host.
    #
    # @return [Float]
    attr_accessor :host_ocpu_count

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Capacity Reservation.
    #
    # @return [String]
    attr_accessor :capacity_reservation_id

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a
    # namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'sddc_id': :'sddcId',
        'display_name': :'displayName',
        'current_sku': :'currentSku',
        'next_sku': :'nextSku',
        'compute_availability_domain': :'computeAvailabilityDomain',
        'failed_esxi_host_id': :'failedEsxiHostId',
        'host_shape_name': :'hostShapeName',
        'host_ocpu_count': :'hostOcpuCount',
        'capacity_reservation_id': :'capacityReservationId',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'sddc_id': :'String',
        'display_name': :'String',
        'current_sku': :'String',
        'next_sku': :'String',
        'compute_availability_domain': :'String',
        'failed_esxi_host_id': :'String',
        'host_shape_name': :'String',
        'host_ocpu_count': :'Float',
        'capacity_reservation_id': :'String',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :sddc_id The value to assign to the {#sddc_id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :current_sku The value to assign to the {#current_sku} property
    # @option attributes [String] :next_sku The value to assign to the {#next_sku} property
    # @option attributes [String] :compute_availability_domain The value to assign to the {#compute_availability_domain} property
    # @option attributes [String] :failed_esxi_host_id The value to assign to the {#failed_esxi_host_id} property
    # @option attributes [String] :host_shape_name The value to assign to the {#host_shape_name} property
    # @option attributes [Float] :host_ocpu_count The value to assign to the {#host_ocpu_count} property
    # @option attributes [String] :capacity_reservation_id The value to assign to the {#capacity_reservation_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.sddc_id = attributes[:'sddcId'] if attributes[:'sddcId']

      raise 'You cannot provide both :sddcId and :sddc_id' if attributes.key?(:'sddcId') && attributes.key?(:'sddc_id')

      self.sddc_id = attributes[:'sddc_id'] if attributes[:'sddc_id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.current_sku = attributes[:'currentSku'] if attributes[:'currentSku']
      self.current_sku = "MONTH" if current_sku.nil? && !attributes.key?(:'currentSku') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :currentSku and :current_sku' if attributes.key?(:'currentSku') && attributes.key?(:'current_sku')

      self.current_sku = attributes[:'current_sku'] if attributes[:'current_sku']
      self.current_sku = "MONTH" if current_sku.nil? && !attributes.key?(:'currentSku') && !attributes.key?(:'current_sku') # rubocop:disable Style/StringLiterals

      self.next_sku = attributes[:'nextSku'] if attributes[:'nextSku']

      raise 'You cannot provide both :nextSku and :next_sku' if attributes.key?(:'nextSku') && attributes.key?(:'next_sku')

      self.next_sku = attributes[:'next_sku'] if attributes[:'next_sku']

      self.compute_availability_domain = attributes[:'computeAvailabilityDomain'] if attributes[:'computeAvailabilityDomain']

      raise 'You cannot provide both :computeAvailabilityDomain and :compute_availability_domain' if attributes.key?(:'computeAvailabilityDomain') && attributes.key?(:'compute_availability_domain')

      self.compute_availability_domain = attributes[:'compute_availability_domain'] if attributes[:'compute_availability_domain']

      self.failed_esxi_host_id = attributes[:'failedEsxiHostId'] if attributes[:'failedEsxiHostId']

      raise 'You cannot provide both :failedEsxiHostId and :failed_esxi_host_id' if attributes.key?(:'failedEsxiHostId') && attributes.key?(:'failed_esxi_host_id')

      self.failed_esxi_host_id = attributes[:'failed_esxi_host_id'] if attributes[:'failed_esxi_host_id']

      self.host_shape_name = attributes[:'hostShapeName'] if attributes[:'hostShapeName']

      raise 'You cannot provide both :hostShapeName and :host_shape_name' if attributes.key?(:'hostShapeName') && attributes.key?(:'host_shape_name')

      self.host_shape_name = attributes[:'host_shape_name'] if attributes[:'host_shape_name']

      self.host_ocpu_count = attributes[:'hostOcpuCount'] if attributes[:'hostOcpuCount']

      raise 'You cannot provide both :hostOcpuCount and :host_ocpu_count' if attributes.key?(:'hostOcpuCount') && attributes.key?(:'host_ocpu_count')

      self.host_ocpu_count = attributes[:'host_ocpu_count'] if attributes[:'host_ocpu_count']

      self.capacity_reservation_id = attributes[:'capacityReservationId'] if attributes[:'capacityReservationId']

      raise 'You cannot provide both :capacityReservationId and :capacity_reservation_id' if attributes.key?(:'capacityReservationId') && attributes.key?(:'capacity_reservation_id')

      self.capacity_reservation_id = attributes[:'capacity_reservation_id'] if attributes[:'capacity_reservation_id']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] current_sku Object to be assigned
    def current_sku=(current_sku)
      raise "Invalid value for 'current_sku': this must be one of the values in CURRENT_SKU_ENUM." if current_sku && !CURRENT_SKU_ENUM.include?(current_sku)

      @current_sku = current_sku
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] next_sku Object to be assigned
    def next_sku=(next_sku)
      raise "Invalid value for 'next_sku': this must be one of the values in NEXT_SKU_ENUM." if next_sku && !NEXT_SKU_ENUM.include?(next_sku)

      @next_sku = next_sku
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        sddc_id == other.sddc_id &&
        display_name == other.display_name &&
        current_sku == other.current_sku &&
        next_sku == other.next_sku &&
        compute_availability_domain == other.compute_availability_domain &&
        failed_esxi_host_id == other.failed_esxi_host_id &&
        host_shape_name == other.host_shape_name &&
        host_ocpu_count == other.host_ocpu_count &&
        capacity_reservation_id == other.capacity_reservation_id &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags
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
      [sddc_id, display_name, current_sku, next_sku, compute_availability_domain, failed_esxi_host_id, host_shape_name, host_ocpu_count, capacity_reservation_id, freeform_tags, defined_tags].hash
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
