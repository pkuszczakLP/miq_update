=begin
#Cisco Intersight

#Cisco Intersight is a management platform delivered as a service with embedded analytics for your Cisco and 3rd party IT infrastructure. This platform offers an intelligent level of management that enables IT organizations to analyze, simplify, and automate their environments in more advanced ways than the prior generations of tools. Cisco Intersight provides an integrated and intuitive management experience for resources in the traditional data center as well as at the edge. With flexible deployment options to address complex security needs, getting started with Intersight is quick and easy. Cisco Intersight has deep integration with Cisco UCS and HyperFlex systems allowing for remote deployment, configuration, and ongoing maintenance. The model-based deployment works for a single system in a remote location or hundreds of systems in a data center and enables rapid, standardized configuration and deployment. It also streamlines maintaining those systems whether you are working with small or very large configurations. The Intersight OpenAPI document defines the complete set of properties that are returned in the HTTP response. From that perspective, a client can expect that no additional properties are returned, unless these properties are explicitly defined in the OpenAPI document. However, when a client uses an older version of the Intersight OpenAPI document, the server may send additional properties because the software is more recent than the client. In that case, the client may receive properties that it does not know about. Some generated SDKs perform a strict validation of the HTTP response body against the OpenAPI document. This document was created on 2021-10-20T11:22:53Z.

The version of the OpenAPI document: 1.0.9-4870
Contact: intersight@cisco.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.1

=end

require 'date'
require 'time'

module IntersightClient
  # Definition of the list of properties defined in 'tam.SecurityAdvisory', excluding properties defined in parent classes.
  class TamSecurityAdvisoryAllOf
    # The fully-qualified name of the instantiated, concrete type. This property is used as a discriminator to identify the type of the payload when marshaling and unmarshaling data.
    attr_accessor :class_id

    # The fully-qualified name of the instantiated, concrete type. The value should be the same as the 'ClassId' property.
    attr_accessor :object_type

    attr_accessor :actions

    # Cisco generated identifier for the published security advisory.
    attr_accessor :advisory_id

    attr_accessor :api_data_sources

    # CVSS version 3 base score for the security Advisory.
    attr_accessor :base_score

    attr_accessor :cve_ids

    # Date when the security advisory was first published by Cisco.
    attr_accessor :date_published

    # Date when the security advisory was last updated by Cisco.
    attr_accessor :date_updated

    # CVSS version 3 environmental score for the security Advisory.
    attr_accessor :environmental_score

    # A link to an external URL describing security Advisory in more details.
    attr_accessor :external_url

    # Recommended action to resolve the security advisory.
    attr_accessor :recommendation

    # Cisco assigned status of the published advisory based on whether the investigation is complete or on-going. * `interim` - The Cisco investigation for the advisory is ongoing. Cisco will issue revisions to the advisory when additional information, including fixed software release data, becomes available. * `final` - Cisco has completed its evaluation of the vulnerability described in the advisory. There will be no further updates unless there is a material change in the nature of the vulnerability.
    attr_accessor :status

    # CVSS version 3 temporal score for the security Advisory.
    attr_accessor :temporal_score

    # Cisco assigned advisory version after latest revision.
    attr_accessor :version

    # Workarounds available for the advisory.
    attr_accessor :workaround

    attr_accessor :organization

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'class_id' => :'ClassId',
        :'object_type' => :'ObjectType',
        :'actions' => :'Actions',
        :'advisory_id' => :'AdvisoryId',
        :'api_data_sources' => :'ApiDataSources',
        :'base_score' => :'BaseScore',
        :'cve_ids' => :'CveIds',
        :'date_published' => :'DatePublished',
        :'date_updated' => :'DateUpdated',
        :'environmental_score' => :'EnvironmentalScore',
        :'external_url' => :'ExternalUrl',
        :'recommendation' => :'Recommendation',
        :'status' => :'Status',
        :'temporal_score' => :'TemporalScore',
        :'version' => :'Version',
        :'workaround' => :'Workaround',
        :'organization' => :'Organization'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Returns the key-value map of all the JSON attributes this model knows about
    def self.acceptable_attribute_map
      attribute_map
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'class_id' => :'String',
        :'object_type' => :'String',
        :'actions' => :'Array<TamAction>',
        :'advisory_id' => :'String',
        :'api_data_sources' => :'Array<TamApiDataSource>',
        :'base_score' => :'Float',
        :'cve_ids' => :'Array<String>',
        :'date_published' => :'Time',
        :'date_updated' => :'Time',
        :'environmental_score' => :'Float',
        :'external_url' => :'String',
        :'recommendation' => :'String',
        :'status' => :'String',
        :'temporal_score' => :'Float',
        :'version' => :'String',
        :'workaround' => :'String',
        :'organization' => :'OrganizationOrganizationRelationship'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'actions',
        :'api_data_sources',
        :'cve_ids',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `IntersightClient::TamSecurityAdvisoryAllOf` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `#{self.class.name}`. Please check the name to make sure it's valid. List of attributes: " + self.class.acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'class_id')
        self.class_id = attributes[:'class_id']
      else
        self.class_id = 'tam.SecurityAdvisory'
      end

      if attributes.key?(:'object_type')
        self.object_type = attributes[:'object_type']
      else
        self.object_type = 'tam.SecurityAdvisory'
      end

      if attributes.key?(:'actions')
        if (value = attributes[:'actions']).is_a?(Array)
          self.actions = value
        end
      end

      if attributes.key?(:'advisory_id')
        self.advisory_id = attributes[:'advisory_id']
      end

      if attributes.key?(:'api_data_sources')
        if (value = attributes[:'api_data_sources']).is_a?(Array)
          self.api_data_sources = value
        end
      end

      if attributes.key?(:'base_score')
        self.base_score = attributes[:'base_score']
      end

      if attributes.key?(:'cve_ids')
        if (value = attributes[:'cve_ids']).is_a?(Array)
          self.cve_ids = value
        end
      end

      if attributes.key?(:'date_published')
        self.date_published = attributes[:'date_published']
      end

      if attributes.key?(:'date_updated')
        self.date_updated = attributes[:'date_updated']
      end

      if attributes.key?(:'environmental_score')
        self.environmental_score = attributes[:'environmental_score']
      end

      if attributes.key?(:'external_url')
        self.external_url = attributes[:'external_url']
      end

      if attributes.key?(:'recommendation')
        self.recommendation = attributes[:'recommendation']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      else
        self.status = 'interim'
      end

      if attributes.key?(:'temporal_score')
        self.temporal_score = attributes[:'temporal_score']
      end

      if attributes.key?(:'version')
        self.version = attributes[:'version']
      end

      if attributes.key?(:'workaround')
        self.workaround = attributes[:'workaround']
      end

      if attributes.key?(:'organization')
        self.organization = attributes[:'organization']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @class_id.nil?
        invalid_properties.push('invalid value for "class_id", class_id cannot be nil.')
      end

      if @object_type.nil?
        invalid_properties.push('invalid value for "object_type", object_type cannot be nil.')
      end

      if !@base_score.nil? && @base_score > 10.0
        invalid_properties.push('invalid value for "base_score", must be smaller than or equal to 10.0.')
      end

      if !@base_score.nil? && @base_score < 0.0
        invalid_properties.push('invalid value for "base_score", must be greater than or equal to 0.0.')
      end

      if !@environmental_score.nil? && @environmental_score > 10.0
        invalid_properties.push('invalid value for "environmental_score", must be smaller than or equal to 10.0.')
      end

      if !@environmental_score.nil? && @environmental_score < 0.0
        invalid_properties.push('invalid value for "environmental_score", must be greater than or equal to 0.0.')
      end

      pattern = Regexp.new(/^$|^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:\/?#\[\]@!\$&'\(\)\*\+,;=.]+$/)
      if !@external_url.nil? && @external_url !~ pattern
        invalid_properties.push("invalid value for \"external_url\", must conform to the pattern #{pattern}.")
      end

      if !@temporal_score.nil? && @temporal_score > 10.0
        invalid_properties.push('invalid value for "temporal_score", must be smaller than or equal to 10.0.')
      end

      if !@temporal_score.nil? && @temporal_score < 0.0
        invalid_properties.push('invalid value for "temporal_score", must be greater than or equal to 0.0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @class_id.nil?
      class_id_validator = EnumAttributeValidator.new('String', ["tam.SecurityAdvisory"])
      return false unless class_id_validator.valid?(@class_id)
      return false if @object_type.nil?
      object_type_validator = EnumAttributeValidator.new('String', ["tam.SecurityAdvisory"])
      return false unless object_type_validator.valid?(@object_type)
      return false if !@base_score.nil? && @base_score > 10.0
      return false if !@base_score.nil? && @base_score < 0.0
      return false if !@environmental_score.nil? && @environmental_score > 10.0
      return false if !@environmental_score.nil? && @environmental_score < 0.0
      return false if !@external_url.nil? && @external_url !~ Regexp.new(/^$|^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:\/?#\[\]@!\$&'\(\)\*\+,;=.]+$/)
      status_validator = EnumAttributeValidator.new('String', ["interim", "final"])
      return false unless status_validator.valid?(@status)
      return false if !@temporal_score.nil? && @temporal_score > 10.0
      return false if !@temporal_score.nil? && @temporal_score < 0.0
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] class_id Object to be assigned
    def class_id=(class_id)
      validator = EnumAttributeValidator.new('String', ["tam.SecurityAdvisory"])
      unless validator.valid?(class_id)
        fail ArgumentError, "invalid value for \"class_id\", must be one of #{validator.allowable_values}."
      end
      @class_id = class_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object_type Object to be assigned
    def object_type=(object_type)
      validator = EnumAttributeValidator.new('String', ["tam.SecurityAdvisory"])
      unless validator.valid?(object_type)
        fail ArgumentError, "invalid value for \"object_type\", must be one of #{validator.allowable_values}."
      end
      @object_type = object_type
    end

    # Custom attribute writer method with validation
    # @param [Object] base_score Value to be assigned
    def base_score=(base_score)
      if !base_score.nil? && base_score > 10.0
        fail ArgumentError, 'invalid value for "base_score", must be smaller than or equal to 10.0.'
      end

      if !base_score.nil? && base_score < 0.0
        fail ArgumentError, 'invalid value for "base_score", must be greater than or equal to 0.0.'
      end

      @base_score = base_score
    end

    # Custom attribute writer method with validation
    # @param [Object] environmental_score Value to be assigned
    def environmental_score=(environmental_score)
      if !environmental_score.nil? && environmental_score > 10.0
        fail ArgumentError, 'invalid value for "environmental_score", must be smaller than or equal to 10.0.'
      end

      if !environmental_score.nil? && environmental_score < 0.0
        fail ArgumentError, 'invalid value for "environmental_score", must be greater than or equal to 0.0.'
      end

      @environmental_score = environmental_score
    end

    # Custom attribute writer method with validation
    # @param [Object] external_url Value to be assigned
    def external_url=(external_url)
      pattern = Regexp.new(/^$|^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:\/?#\[\]@!\$&'\(\)\*\+,;=.]+$/)
      if !external_url.nil? && external_url !~ pattern
        fail ArgumentError, "invalid value for \"external_url\", must conform to the pattern #{pattern}."
      end

      @external_url = external_url
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ["interim", "final"])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Custom attribute writer method with validation
    # @param [Object] temporal_score Value to be assigned
    def temporal_score=(temporal_score)
      if !temporal_score.nil? && temporal_score > 10.0
        fail ArgumentError, 'invalid value for "temporal_score", must be smaller than or equal to 10.0.'
      end

      if !temporal_score.nil? && temporal_score < 0.0
        fail ArgumentError, 'invalid value for "temporal_score", must be greater than or equal to 0.0.'
      end

      @temporal_score = temporal_score
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          class_id == o.class_id &&
          object_type == o.object_type &&
          actions == o.actions &&
          advisory_id == o.advisory_id &&
          api_data_sources == o.api_data_sources &&
          base_score == o.base_score &&
          cve_ids == o.cve_ids &&
          date_published == o.date_published &&
          date_updated == o.date_updated &&
          environmental_score == o.environmental_score &&
          external_url == o.external_url &&
          recommendation == o.recommendation &&
          status == o.status &&
          temporal_score == o.temporal_score &&
          version == o.version &&
          workaround == o.workaround &&
          organization == o.organization
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [class_id, object_type, actions, advisory_id, api_data_sources, base_score, cve_ids, date_published, date_updated, environmental_score, external_url, recommendation, status, temporal_score, version, workaround, organization].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      TamSecurityAdvisoryAllOf.openapi_types.each_pair do |key, type|
        if attributes[TamSecurityAdvisoryAllOf.attribute_map[key]].nil? && TamSecurityAdvisoryAllOf.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[TamSecurityAdvisoryAllOf.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[TamSecurityAdvisoryAllOf.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[TamSecurityAdvisoryAllOf.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[TamSecurityAdvisoryAllOf.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = IntersightClient.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      TamSecurityAdvisoryAllOf.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = TamSecurityAdvisoryAllOf.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

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
