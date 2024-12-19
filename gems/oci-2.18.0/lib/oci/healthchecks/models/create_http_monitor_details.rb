# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The request body used to create an HTTP monitor.
  class Healthchecks::Models::CreateHttpMonitorDetails
    PROTOCOL_ENUM = [
      PROTOCOL_HTTP = 'HTTP'.freeze,
      PROTOCOL_HTTPS = 'HTTPS'.freeze
    ].freeze

    METHOD_ENUM = [
      METHOD_GET = 'GET'.freeze,
      METHOD_HEAD = 'HEAD'.freeze
    ].freeze

    # **[Required]** The OCID of the compartment.
    # @return [String]
    attr_accessor :compartment_id

    # **[Required]** A list of targets (hostnames or IP addresses) of the probe.
    # @return [Array<String>]
    attr_accessor :targets

    # A list of names of vantage points from which to execute the probe.
    # @return [Array<String>]
    attr_accessor :vantage_point_names

    # The port on which to probe endpoints. If unspecified, probes will use the
    # default port of their protocol.
    #
    # @return [Integer]
    attr_accessor :port

    # The probe timeout in seconds. Valid values: 10, 20, 30, and 60.
    # The probe timeout must be less than or equal to `intervalInSeconds` for monitors.
    #
    # @return [Integer]
    attr_accessor :timeout_in_seconds

    # This attribute is required.
    # @return [String]
    attr_reader :protocol

    # @return [String]
    attr_reader :method

    # The optional URL path to probe, including query parameters.
    # @return [String]
    attr_accessor :path

    # A dictionary of HTTP request headers.
    #
    # *Note:* Monitors and probes do not support the use of the `Authorization` HTTP header.
    #
    # @return [Hash<String, String>]
    attr_accessor :headers

    # **[Required]** A user-friendly and mutable name suitable for display in a user interface.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The monitor interval in seconds. Valid values: 10, 30, and 60.
    #
    # @return [Integer]
    attr_accessor :interval_in_seconds

    # Enables or disables the monitor. Set to 'true' to launch monitoring.
    #
    # @return [BOOLEAN]
    attr_accessor :is_enabled

    # Free-form tags for this resource. Each tag is a simple key-value pair with no
    # predefined name, type, or namespace.  For more information,
    # see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Department\": \"Finance\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Defined tags for this resource. Each key is predefined and scoped to a namespace.
    # For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
    # Example: `{\"Operations\": {\"CostCenter\": \"42\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'compartmentId',
        'targets': :'targets',
        'vantage_point_names': :'vantagePointNames',
        'port': :'port',
        'timeout_in_seconds': :'timeoutInSeconds',
        'protocol': :'protocol',
        'method': :'method',
        'path': :'path',
        'headers': :'headers',
        'display_name': :'displayName',
        'interval_in_seconds': :'intervalInSeconds',
        'is_enabled': :'isEnabled',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'compartment_id': :'String',
        'targets': :'Array<String>',
        'vantage_point_names': :'Array<String>',
        'port': :'Integer',
        'timeout_in_seconds': :'Integer',
        'protocol': :'String',
        'method': :'String',
        'path': :'String',
        'headers': :'Hash<String, String>',
        'display_name': :'String',
        'interval_in_seconds': :'Integer',
        'is_enabled': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [Array<String>] :targets The value to assign to the {#targets} property
    # @option attributes [Array<String>] :vantage_point_names The value to assign to the {#vantage_point_names} property
    # @option attributes [Integer] :port The value to assign to the {#port} property
    # @option attributes [Integer] :timeout_in_seconds The value to assign to the {#timeout_in_seconds} property
    # @option attributes [String] :protocol The value to assign to the {#protocol} property
    # @option attributes [String] :method The value to assign to the {#method} property
    # @option attributes [String] :path The value to assign to the {#path} property
    # @option attributes [Hash<String, String>] :headers The value to assign to the {#headers} property
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [Integer] :interval_in_seconds The value to assign to the {#interval_in_seconds} property
    # @option attributes [BOOLEAN] :is_enabled The value to assign to the {#is_enabled} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.targets = attributes[:'targets'] if attributes[:'targets']

      self.vantage_point_names = attributes[:'vantagePointNames'] if attributes[:'vantagePointNames']

      raise 'You cannot provide both :vantagePointNames and :vantage_point_names' if attributes.key?(:'vantagePointNames') && attributes.key?(:'vantage_point_names')

      self.vantage_point_names = attributes[:'vantage_point_names'] if attributes[:'vantage_point_names']

      self.port = attributes[:'port'] if attributes[:'port']

      self.timeout_in_seconds = attributes[:'timeoutInSeconds'] if attributes[:'timeoutInSeconds']

      raise 'You cannot provide both :timeoutInSeconds and :timeout_in_seconds' if attributes.key?(:'timeoutInSeconds') && attributes.key?(:'timeout_in_seconds')

      self.timeout_in_seconds = attributes[:'timeout_in_seconds'] if attributes[:'timeout_in_seconds']

      self.protocol = attributes[:'protocol'] if attributes[:'protocol']

      self.method = attributes[:'method'] if attributes[:'method']
      self.method = "HEAD" if method.nil? && !attributes.key?(:'method') # rubocop:disable Style/StringLiterals

      self.path = attributes[:'path'] if attributes[:'path']
      self.path = "/" if path.nil? && !attributes.key?(:'path') # rubocop:disable Style/StringLiterals

      self.headers = attributes[:'headers'] if attributes[:'headers']

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.interval_in_seconds = attributes[:'intervalInSeconds'] if attributes[:'intervalInSeconds']

      raise 'You cannot provide both :intervalInSeconds and :interval_in_seconds' if attributes.key?(:'intervalInSeconds') && attributes.key?(:'interval_in_seconds')

      self.interval_in_seconds = attributes[:'interval_in_seconds'] if attributes[:'interval_in_seconds']

      self.is_enabled = attributes[:'isEnabled'] unless attributes[:'isEnabled'].nil?
      self.is_enabled = true if is_enabled.nil? && !attributes.key?(:'isEnabled') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isEnabled and :is_enabled' if attributes.key?(:'isEnabled') && attributes.key?(:'is_enabled')

      self.is_enabled = attributes[:'is_enabled'] unless attributes[:'is_enabled'].nil?
      self.is_enabled = true if is_enabled.nil? && !attributes.key?(:'isEnabled') && !attributes.key?(:'is_enabled') # rubocop:disable Style/StringLiterals

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
    # @param [Object] protocol Object to be assigned
    def protocol=(protocol)
      raise "Invalid value for 'protocol': this must be one of the values in PROTOCOL_ENUM." if protocol && !PROTOCOL_ENUM.include?(protocol)

      @protocol = protocol
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] method Object to be assigned
    def method=(method)
      raise "Invalid value for 'method': this must be one of the values in METHOD_ENUM." if method && !METHOD_ENUM.include?(method)

      @method = method
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        compartment_id == other.compartment_id &&
        targets == other.targets &&
        vantage_point_names == other.vantage_point_names &&
        port == other.port &&
        timeout_in_seconds == other.timeout_in_seconds &&
        protocol == other.protocol &&
        method == other.method &&
        path == other.path &&
        headers == other.headers &&
        display_name == other.display_name &&
        interval_in_seconds == other.interval_in_seconds &&
        is_enabled == other.is_enabled &&
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
      [compartment_id, targets, vantage_point_names, port, timeout_in_seconds, protocol, method, path, headers, display_name, interval_in_seconds, is_enabled, freeform_tags, defined_tags].hash
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
