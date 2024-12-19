# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties to update an application.
  #
  class Functions::Models::UpdateApplicationDetails
    # Application configuration. These values are passed on to the function as environment variables, functions may override application configuration.
    # Keys must be ASCII strings consisting solely of letters, digits, and the '_' (underscore) character, and must not begin with a digit. Values should be limited to printable unicode characters.
    #
    # Example: `{\"MY_FUNCTION_CONFIG\": \"ConfVal\"}`
    #
    # The maximum size for all configuration keys and values is limited to 4KB. This is measured as the sum of octets necessary to represent each key and value in UTF-8.
    #
    # @return [Hash<String, String>]
    attr_accessor :config

    # The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm)s of the Network Security Groups to add the application to.
    #
    # @return [Array<String>]
    attr_accessor :network_security_group_ids

    # A syslog URL to which to send all function logs. Supports tcp, udp, and tcp+tls.
    # The syslog URL must be reachable from all of the subnets configured for the application.
    # Note: If you enable the OCI Logging service for this application, the syslogUrl value is ignored. Function logs are sent to the OCI Logging service, and not to the syslog URL.
    #
    # Example: `tcp://logserver.myserver:1234`
    #
    # @return [String]
    attr_accessor :syslog_url

    # @return [OCI::Functions::Models::ApplicationTraceConfig]
    attr_accessor :trace_config

    # Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcetags.htm).
    #
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # @return [OCI::Functions::Models::ImagePolicyConfig]
    attr_accessor :image_policy_config

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'config': :'config',
        'network_security_group_ids': :'networkSecurityGroupIds',
        'syslog_url': :'syslogUrl',
        'trace_config': :'traceConfig',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags',
        'image_policy_config': :'imagePolicyConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'config': :'Hash<String, String>',
        'network_security_group_ids': :'Array<String>',
        'syslog_url': :'String',
        'trace_config': :'OCI::Functions::Models::ApplicationTraceConfig',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>',
        'image_policy_config': :'OCI::Functions::Models::ImagePolicyConfig'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [Hash<String, String>] :config The value to assign to the {#config} property
    # @option attributes [Array<String>] :network_security_group_ids The value to assign to the {#network_security_group_ids} property
    # @option attributes [String] :syslog_url The value to assign to the {#syslog_url} property
    # @option attributes [OCI::Functions::Models::ApplicationTraceConfig] :trace_config The value to assign to the {#trace_config} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [OCI::Functions::Models::ImagePolicyConfig] :image_policy_config The value to assign to the {#image_policy_config} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.config = attributes[:'config'] if attributes[:'config']

      self.network_security_group_ids = attributes[:'networkSecurityGroupIds'] if attributes[:'networkSecurityGroupIds']

      raise 'You cannot provide both :networkSecurityGroupIds and :network_security_group_ids' if attributes.key?(:'networkSecurityGroupIds') && attributes.key?(:'network_security_group_ids')

      self.network_security_group_ids = attributes[:'network_security_group_ids'] if attributes[:'network_security_group_ids']

      self.syslog_url = attributes[:'syslogUrl'] if attributes[:'syslogUrl']

      raise 'You cannot provide both :syslogUrl and :syslog_url' if attributes.key?(:'syslogUrl') && attributes.key?(:'syslog_url')

      self.syslog_url = attributes[:'syslog_url'] if attributes[:'syslog_url']

      self.trace_config = attributes[:'traceConfig'] if attributes[:'traceConfig']

      raise 'You cannot provide both :traceConfig and :trace_config' if attributes.key?(:'traceConfig') && attributes.key?(:'trace_config')

      self.trace_config = attributes[:'trace_config'] if attributes[:'trace_config']

      self.freeform_tags = attributes[:'freeformTags'] if attributes[:'freeformTags']

      raise 'You cannot provide both :freeformTags and :freeform_tags' if attributes.key?(:'freeformTags') && attributes.key?(:'freeform_tags')

      self.freeform_tags = attributes[:'freeform_tags'] if attributes[:'freeform_tags']

      self.defined_tags = attributes[:'definedTags'] if attributes[:'definedTags']

      raise 'You cannot provide both :definedTags and :defined_tags' if attributes.key?(:'definedTags') && attributes.key?(:'defined_tags')

      self.defined_tags = attributes[:'defined_tags'] if attributes[:'defined_tags']

      self.image_policy_config = attributes[:'imagePolicyConfig'] if attributes[:'imagePolicyConfig']

      raise 'You cannot provide both :imagePolicyConfig and :image_policy_config' if attributes.key?(:'imagePolicyConfig') && attributes.key?(:'image_policy_config')

      self.image_policy_config = attributes[:'image_policy_config'] if attributes[:'image_policy_config']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        config == other.config &&
        network_security_group_ids == other.network_security_group_ids &&
        syslog_url == other.syslog_url &&
        trace_config == other.trace_config &&
        freeform_tags == other.freeform_tags &&
        defined_tags == other.defined_tags &&
        image_policy_config == other.image_policy_config
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
      [config, network_security_group_ids, syslog_url, trace_config, freeform_tags, defined_tags, image_policy_config].hash
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
