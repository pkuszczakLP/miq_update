# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A summary of the ESXi host.
  class Ocvp::Models::EsxiHostSummary
    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze,
      LIFECYCLE_STATE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    CURRENT_SKU_ENUM = [
      CURRENT_SKU_HOUR = 'HOUR'.freeze,
      CURRENT_SKU_MONTH = 'MONTH'.freeze,
      CURRENT_SKU_ONE_YEAR = 'ONE_YEAR'.freeze,
      CURRENT_SKU_THREE_YEARS = 'THREE_YEARS'.freeze,
      CURRENT_SKU_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    NEXT_SKU_ENUM = [
      NEXT_SKU_HOUR = 'HOUR'.freeze,
      NEXT_SKU_MONTH = 'MONTH'.freeze,
      NEXT_SKU_ONE_YEAR = 'ONE_YEAR'.freeze,
      NEXT_SKU_THREE_YEARS = 'THREE_YEARS'.freeze,
      NEXT_SKU_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the ESXi host.
    #
    # @return [String]
    attr_accessor :id

    # A descriptive name for the ESXi host. Does not have to be unique, and it's changeable.
    # Avoid entering confidential information.
    #
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the SDDC that the
    # ESXi host belongs to.
    #
    # @return [String]
    attr_accessor :sddc_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the compartment that
    # contains the SDDC.
    #
    # @return [String]
    attr_accessor :compartment_id

    # In terms of implementation, an ESXi host is a Compute instance that
    # is configured with the chosen bundle of VMware software. The `computeInstanceId`
    # is the [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of that Compute instance.
    #
    # @return [String]
    attr_accessor :compute_instance_id

    # The date and time the ESXi host was created, in the format defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :time_created

    # The date and time the ESXi host was updated, in the format defined by
    # [RFC3339](https://tools.ietf.org/html/rfc3339).
    #
    # @return [DateTime]
    attr_accessor :time_updated

    # The current state of the ESXi host.
    # @return [String]
    attr_reader :lifecycle_state

    # **[Required]** The billing option currently used by the ESXi host.
    # {#list_supported_skus list_supported_skus}.
    #
    # @return [String]
    attr_reader :current_sku

    # **[Required]** The billing option to switch to after the current billing cycle ends.
    # If `nextSku` is null or empty, `currentSku` continues to the next billing cycle.
    # {#list_supported_skus list_supported_skus}.
    #
    # @return [String]
    attr_reader :next_sku

    # **[Required]** Current billing cycle end date. If the value in `currentSku` and `nextSku` are different, the value specified in `nextSku`
    # becomes the new `currentSKU` when the `contractEndDate` is reached.
    # Example: `2016-08-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :billing_contract_end_date

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the ESXi host that failed.
    #
    # @return [String]
    attr_accessor :failed_esxi_host_id

    # The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the ESXi host that
    # is newly created to replace the failed host.
    #
    # @return [String]
    attr_accessor :replacement_esxi_host_id

    # The date and time when the new esxi host should start billing cycle.
    # [RFC3339](https://tools.ietf.org/html/rfc3339).
    # Example: `2021-07-25T21:10:29.600Z`
    #
    # @return [DateTime]
    attr_accessor :grace_period_end_date

    # **[Required]** The availability domain of the ESXi host.
    #
    # @return [String]
    attr_accessor :compute_availability_domain

    # **[Required]** The compute shape name of the ESXi host.
    # {#list_supported_host_shapes list_supported_host_shapes}.
    #
    # @return [String]
    attr_accessor :host_shape_name

    # The OCPU count of the ESXi host.
    #
    # @return [Float]
    attr_accessor :host_ocpu_count

    # **[Required]** Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # **[Required]** Defined tags for this resource. Each key is predefined and scoped to a
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
        'id': :'id',
        'display_name': :'displayName',
        'sddc_id': :'sddcId',
        'compartment_id': :'compartmentId',
        'compute_instance_id': :'computeInstanceId',
        'time_created': :'timeCreated',
        'time_updated': :'timeUpdated',
        'lifecycle_state': :'lifecycleState',
        'current_sku': :'currentSku',
        'next_sku': :'nextSku',
        'billing_contract_end_date': :'billingContractEndDate',
        'failed_esxi_host_id': :'failedEsxiHostId',
        'replacement_esxi_host_id': :'replacementEsxiHostId',
        'grace_period_end_date': :'gracePeriodEndDate',
        'compute_availability_domain': :'computeAvailabilityDomain',
        'host_shape_name': :'hostShapeName',
        'host_ocpu_count': :'hostOcpuCount',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'id': :'String',
        'display_name': :'String',
        'sddc_id': :'String',
        'compartment_id': :'String',
        'compute_instance_id': :'String',
        'time_created': :'DateTime',
        'time_updated': :'DateTime',
        'lifecycle_state': :'String',
        'current_sku': :'String',
        'next_sku': :'String',
        'billing_contract_end_date': :'DateTime',
        'failed_esxi_host_id': :'String',
        'replacement_esxi_host_id': :'String',
        'grace_period_end_date': :'DateTime',
        'compute_availability_domain': :'String',
        'host_shape_name': :'String',
        'host_ocpu_count': :'Float',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :id The value to assign to the {#id} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :sddc_id The value to assign to the {#sddc_id} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :compute_instance_id The value to assign to the {#compute_instance_id} property
    # @option attributes [DateTime] :time_created The value to assign to the {#time_created} property
    # @option attributes [DateTime] :time_updated The value to assign to the {#time_updated} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :current_sku The value to assign to the {#current_sku} property
    # @option attributes [String] :next_sku The value to assign to the {#next_sku} property
    # @option attributes [DateTime] :billing_contract_end_date The value to assign to the {#billing_contract_end_date} property
    # @option attributes [String] :failed_esxi_host_id The value to assign to the {#failed_esxi_host_id} property
    # @option attributes [String] :replacement_esxi_host_id The value to assign to the {#replacement_esxi_host_id} property
    # @option attributes [DateTime] :grace_period_end_date The value to assign to the {#grace_period_end_date} property
    # @option attributes [String] :compute_availability_domain The value to assign to the {#compute_availability_domain} property
    # @option attributes [String] :host_shape_name The value to assign to the {#host_shape_name} property
    # @option attributes [Float] :host_ocpu_count The value to assign to the {#host_ocpu_count} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.id = attributes[:'id'] if attributes[:'id']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.sddc_id = attributes[:'sddcId'] if attributes[:'sddcId']

      raise 'You cannot provide both :sddcId and :sddc_id' if attributes.key?(:'sddcId') && attributes.key?(:'sddc_id')

      self.sddc_id = attributes[:'sddc_id'] if attributes[:'sddc_id']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.compute_instance_id = attributes[:'computeInstanceId'] if attributes[:'computeInstanceId']

      raise 'You cannot provide both :computeInstanceId and :compute_instance_id' if attributes.key?(:'computeInstanceId') && attributes.key?(:'compute_instance_id')

      self.compute_instance_id = attributes[:'compute_instance_id'] if attributes[:'compute_instance_id']

      self.time_created = attributes[:'timeCreated'] if attributes[:'timeCreated']

      raise 'You cannot provide both :timeCreated and :time_created' if attributes.key?(:'timeCreated') && attributes.key?(:'time_created')

      self.time_created = attributes[:'time_created'] if attributes[:'time_created']

      self.time_updated = attributes[:'timeUpdated'] if attributes[:'timeUpdated']

      raise 'You cannot provide both :timeUpdated and :time_updated' if attributes.key?(:'timeUpdated') && attributes.key?(:'time_updated')

      self.time_updated = attributes[:'time_updated'] if attributes[:'time_updated']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.current_sku = attributes[:'currentSku'] if attributes[:'currentSku']
      self.current_sku = "MONTH" if current_sku.nil? && !attributes.key?(:'currentSku') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :currentSku and :current_sku' if attributes.key?(:'currentSku') && attributes.key?(:'current_sku')

      self.current_sku = attributes[:'current_sku'] if attributes[:'current_sku']
      self.current_sku = "MONTH" if current_sku.nil? && !attributes.key?(:'currentSku') && !attributes.key?(:'current_sku') # rubocop:disable Style/StringLiterals

      self.next_sku = attributes[:'nextSku'] if attributes[:'nextSku']

      raise 'You cannot provide both :nextSku and :next_sku' if attributes.key?(:'nextSku') && attributes.key?(:'next_sku')

      self.next_sku = attributes[:'next_sku'] if attributes[:'next_sku']

      self.billing_contract_end_date = attributes[:'billingContractEndDate'] if attributes[:'billingContractEndDate']

      raise 'You cannot provide both :billingContractEndDate and :billing_contract_end_date' if attributes.key?(:'billingContractEndDate') && attributes.key?(:'billing_contract_end_date')

      self.billing_contract_end_date = attributes[:'billing_contract_end_date'] if attributes[:'billing_contract_end_date']

      self.failed_esxi_host_id = attributes[:'failedEsxiHostId'] if attributes[:'failedEsxiHostId']

      raise 'You cannot provide both :failedEsxiHostId and :failed_esxi_host_id' if attributes.key?(:'failedEsxiHostId') && attributes.key?(:'failed_esxi_host_id')

      self.failed_esxi_host_id = attributes[:'failed_esxi_host_id'] if attributes[:'failed_esxi_host_id']

      self.replacement_esxi_host_id = attributes[:'replacementEsxiHostId'] if attributes[:'replacementEsxiHostId']

      raise 'You cannot provide both :replacementEsxiHostId and :replacement_esxi_host_id' if attributes.key?(:'replacementEsxiHostId') && attributes.key?(:'replacement_esxi_host_id')

      self.replacement_esxi_host_id = attributes[:'replacement_esxi_host_id'] if attributes[:'replacement_esxi_host_id']

      self.grace_period_end_date = attributes[:'gracePeriodEndDate'] if attributes[:'gracePeriodEndDate']

      raise 'You cannot provide both :gracePeriodEndDate and :grace_period_end_date' if attributes.key?(:'gracePeriodEndDate') && attributes.key?(:'grace_period_end_date')

      self.grace_period_end_date = attributes[:'grace_period_end_date'] if attributes[:'grace_period_end_date']

      self.compute_availability_domain = attributes[:'computeAvailabilityDomain'] if attributes[:'computeAvailabilityDomain']

      raise 'You cannot provide both :computeAvailabilityDomain and :compute_availability_domain' if attributes.key?(:'computeAvailabilityDomain') && attributes.key?(:'compute_availability_domain')

      self.compute_availability_domain = attributes[:'compute_availability_domain'] if attributes[:'compute_availability_domain']

      self.host_shape_name = attributes[:'hostShapeName'] if attributes[:'hostShapeName']

      raise 'You cannot provide both :hostShapeName and :host_shape_name' if attributes.key?(:'hostShapeName') && attributes.key?(:'host_shape_name')

      self.host_shape_name = attributes[:'host_shape_name'] if attributes[:'host_shape_name']

      self.host_ocpu_count = attributes[:'hostOcpuCount'] if attributes[:'hostOcpuCount']

      raise 'You cannot provide both :hostOcpuCount and :host_ocpu_count' if attributes.key?(:'hostOcpuCount') && attributes.key?(:'host_ocpu_count')

      self.host_ocpu_count = attributes[:'host_ocpu_count'] if attributes[:'host_ocpu_count']

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
    # @param [Object] current_sku Object to be assigned
    def current_sku=(current_sku)
      # rubocop:disable Style/ConditionalAssignment
      if current_sku && !CURRENT_SKU_ENUM.include?(current_sku)
        OCI.logger.debug("Unknown value for 'current_sku' [" + current_sku + "]. Mapping to 'CURRENT_SKU_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @current_sku = CURRENT_SKU_UNKNOWN_ENUM_VALUE
      else
        @current_sku = current_sku
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] next_sku Object to be assigned
    def next_sku=(next_sku)
      # rubocop:disable Style/ConditionalAssignment
      if next_sku && !NEXT_SKU_ENUM.include?(next_sku)
        OCI.logger.debug("Unknown value for 'next_sku' [" + next_sku + "]. Mapping to 'NEXT_SKU_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @next_sku = NEXT_SKU_UNKNOWN_ENUM_VALUE
      else
        @next_sku = next_sku
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
        sddc_id == other.sddc_id &&
        compartment_id == other.compartment_id &&
        compute_instance_id == other.compute_instance_id &&
        time_created == other.time_created &&
        time_updated == other.time_updated &&
        lifecycle_state == other.lifecycle_state &&
        current_sku == other.current_sku &&
        next_sku == other.next_sku &&
        billing_contract_end_date == other.billing_contract_end_date &&
        failed_esxi_host_id == other.failed_esxi_host_id &&
        replacement_esxi_host_id == other.replacement_esxi_host_id &&
        grace_period_end_date == other.grace_period_end_date &&
        compute_availability_domain == other.compute_availability_domain &&
        host_shape_name == other.host_shape_name &&
        host_ocpu_count == other.host_ocpu_count &&
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
      [id, display_name, sddc_id, compartment_id, compute_instance_id, time_created, time_updated, lifecycle_state, current_sku, next_sku, billing_contract_end_date, failed_esxi_host_id, replacement_esxi_host_id, grace_period_end_date, compute_availability_domain, host_shape_name, host_ocpu_count, freeform_tags, defined_tags].hash
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
