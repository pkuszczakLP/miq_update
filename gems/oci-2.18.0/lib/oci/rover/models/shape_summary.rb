# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A shape of a node on a Rover device.
  class Rover::Models::ShapeSummary
    # A short description of the graphics processing unit (GPU) available for this shape.
    # @return [String]
    attr_accessor :gpu_description

    # The number of GPUs available for this shape.
    # @return [Integer]
    attr_accessor :gpus

    # The default amount of memory available for this shape, in gigabytes.
    # @return [Float]
    attr_accessor :memory_in_gbs

    # The networking bandwidth available for this shape, in gigabits per second.
    # @return [Float]
    attr_accessor :networking_bandwidth_in_gbps

    # The default number of OCPUs available for this shape.
    # @return [Integer]
    attr_accessor :ocpus

    # A short description of the shape's processor (CPU).
    # @return [String]
    attr_accessor :processor_description

    # **[Required]** The name of the shape.
    # @return [String]
    attr_accessor :shape

    # A short description of the USB controller available for this shape.
    # @return [String]
    attr_accessor :usb_controller_description

    # The number of USB controllers available for this shape.
    # @return [Integer]
    attr_accessor :number_of_usb_controllers

    # The tags associated with tagSlug.
    #
    # @return [String]
    attr_accessor :tags

    # The freeform tags associated with this resource, if any. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # The defined tags associated with this resource, if any. Each key is predefined and scoped to namespaces.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # The system tags associated with this resource, if any. The system tags are set by Oracle cloud infrastructure services. Each key is predefined and scoped to namespaces.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    # Example: `{orcl-cloud: {free-tier-retain: true}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :system_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'gpu_description': :'gpuDescription',
        'gpus': :'gpus',
        'memory_in_gbs': :'memoryInGBs',
        'networking_bandwidth_in_gbps': :'networkingBandwidthInGbps',
        'ocpus': :'ocpus',
        'processor_description': :'processorDescription',
        'shape': :'shape',
        'usb_controller_description': :'usbControllerDescription',
        'number_of_usb_controllers': :'numberOfUsbControllers',
        'tags': :'tags',
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
        'gpu_description': :'String',
        'gpus': :'Integer',
        'memory_in_gbs': :'Float',
        'networking_bandwidth_in_gbps': :'Float',
        'ocpus': :'Integer',
        'processor_description': :'String',
        'shape': :'String',
        'usb_controller_description': :'String',
        'number_of_usb_controllers': :'Integer',
        'tags': :'String',
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
    # @option attributes [String] :gpu_description The value to assign to the {#gpu_description} property
    # @option attributes [Integer] :gpus The value to assign to the {#gpus} property
    # @option attributes [Float] :memory_in_gbs The value to assign to the {#memory_in_gbs} property
    # @option attributes [Float] :networking_bandwidth_in_gbps The value to assign to the {#networking_bandwidth_in_gbps} property
    # @option attributes [Integer] :ocpus The value to assign to the {#ocpus} property
    # @option attributes [String] :processor_description The value to assign to the {#processor_description} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [String] :usb_controller_description The value to assign to the {#usb_controller_description} property
    # @option attributes [Integer] :number_of_usb_controllers The value to assign to the {#number_of_usb_controllers} property
    # @option attributes [String] :tags The value to assign to the {#tags} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.gpu_description = attributes[:'gpuDescription'] if attributes[:'gpuDescription']
      self.gpu_description = "null" if gpu_description.nil? && !attributes.key?(:'gpuDescription') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :gpuDescription and :gpu_description' if attributes.key?(:'gpuDescription') && attributes.key?(:'gpu_description')

      self.gpu_description = attributes[:'gpu_description'] if attributes[:'gpu_description']
      self.gpu_description = "null" if gpu_description.nil? && !attributes.key?(:'gpuDescription') && !attributes.key?(:'gpu_description') # rubocop:disable Style/StringLiterals

      self.gpus = attributes[:'gpus'] if attributes[:'gpus']

      self.memory_in_gbs = attributes[:'memoryInGBs'] if attributes[:'memoryInGBs']

      raise 'You cannot provide both :memoryInGBs and :memory_in_gbs' if attributes.key?(:'memoryInGBs') && attributes.key?(:'memory_in_gbs')

      self.memory_in_gbs = attributes[:'memory_in_gbs'] if attributes[:'memory_in_gbs']

      self.networking_bandwidth_in_gbps = attributes[:'networkingBandwidthInGbps'] if attributes[:'networkingBandwidthInGbps']

      raise 'You cannot provide both :networkingBandwidthInGbps and :networking_bandwidth_in_gbps' if attributes.key?(:'networkingBandwidthInGbps') && attributes.key?(:'networking_bandwidth_in_gbps')

      self.networking_bandwidth_in_gbps = attributes[:'networking_bandwidth_in_gbps'] if attributes[:'networking_bandwidth_in_gbps']

      self.ocpus = attributes[:'ocpus'] if attributes[:'ocpus']

      self.processor_description = attributes[:'processorDescription'] if attributes[:'processorDescription']

      raise 'You cannot provide both :processorDescription and :processor_description' if attributes.key?(:'processorDescription') && attributes.key?(:'processor_description')

      self.processor_description = attributes[:'processor_description'] if attributes[:'processor_description']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.usb_controller_description = attributes[:'usbControllerDescription'] if attributes[:'usbControllerDescription']
      self.usb_controller_description = "null" if usb_controller_description.nil? && !attributes.key?(:'usbControllerDescription') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :usbControllerDescription and :usb_controller_description' if attributes.key?(:'usbControllerDescription') && attributes.key?(:'usb_controller_description')

      self.usb_controller_description = attributes[:'usb_controller_description'] if attributes[:'usb_controller_description']
      self.usb_controller_description = "null" if usb_controller_description.nil? && !attributes.key?(:'usbControllerDescription') && !attributes.key?(:'usb_controller_description') # rubocop:disable Style/StringLiterals

      self.number_of_usb_controllers = attributes[:'numberOfUsbControllers'] if attributes[:'numberOfUsbControllers']

      raise 'You cannot provide both :numberOfUsbControllers and :number_of_usb_controllers' if attributes.key?(:'numberOfUsbControllers') && attributes.key?(:'number_of_usb_controllers')

      self.number_of_usb_controllers = attributes[:'number_of_usb_controllers'] if attributes[:'number_of_usb_controllers']

      self.tags = attributes[:'tags'] if attributes[:'tags']

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

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        gpu_description == other.gpu_description &&
        gpus == other.gpus &&
        memory_in_gbs == other.memory_in_gbs &&
        networking_bandwidth_in_gbps == other.networking_bandwidth_in_gbps &&
        ocpus == other.ocpus &&
        processor_description == other.processor_description &&
        shape == other.shape &&
        usb_controller_description == other.usb_controller_description &&
        number_of_usb_controllers == other.number_of_usb_controllers &&
        tags == other.tags &&
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
      [gpu_description, gpus, memory_in_gbs, networking_bandwidth_in_gbps, ocpus, processor_description, shape, usb_controller_description, number_of_usb_controllers, tags, freeform_tags, defined_tags, system_tags].hash
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
