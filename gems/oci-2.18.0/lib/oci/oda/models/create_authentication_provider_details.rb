# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # Properties required to create a new Authentication Provider.
  class Oda::Models::CreateAuthenticationProviderDetails
    GRANT_TYPE_ENUM = [
      GRANT_TYPE_CLIENT_CREDENTIALS = 'CLIENT_CREDENTIALS'.freeze,
      GRANT_TYPE_AUTHORIZATION_CODE = 'AUTHORIZATION_CODE'.freeze
    ].freeze

    IDENTITY_PROVIDER_ENUM = [
      IDENTITY_PROVIDER_GENERIC = 'GENERIC'.freeze,
      IDENTITY_PROVIDER_OAM = 'OAM'.freeze,
      IDENTITY_PROVIDER_GOOGLE = 'GOOGLE'.freeze,
      IDENTITY_PROVIDER_MICROSOFT = 'MICROSOFT'.freeze
    ].freeze

    # **[Required]** The grant type for the Authentication Provider.
    # @return [String]
    attr_reader :grant_type

    # **[Required]** Which type of Identity Provider (IDP) you are using.
    # @return [String]
    attr_reader :identity_provider

    # **[Required]** A name to identify the Authentication Provider.
    # @return [String]
    attr_accessor :name

    # **[Required]** The IDPs URL for requesting access tokens.
    # @return [String]
    attr_accessor :token_endpoint_url

    # **[Required]** The IDPs URL for the page that users authenticate with by entering the user name and password.
    # @return [String]
    attr_accessor :authorization_endpoint_url

    # A shortened version of the authorization URL, which you can get from a URL shortener service (one that allows
    # you to send query parameters).  You might need this because the generated authorization-code-request URL
    # could be too long for SMS and older smart phones.
    #
    # @return [String]
    attr_accessor :short_authorization_code_request_url

    # If you want to revoke all the refresh tokens and access tokens of the logged-in user from a dialog flow, then
    # you need the IDP's revoke refresh token URL. If you provide this URL, then you can use the System.OAuth2ResetTokens
    # component to revoke the user's tokens for this service.
    #
    # @return [String]
    attr_accessor :revoke_token_endpoint_url

    # **[Required]** The client ID for the IDP application (OAuth Client) that was registered as described in Identity Provider Registration.
    # With Microsoft identity platform, use the application ID.
    #
    # @return [String]
    attr_accessor :client_id

    # **[Required]** The client secret for the IDP application (OAuth Client) that was registered as described in Identity Provider
    # Registration. With Microsoft identity platform, use the application secret.
    #
    # @return [String]
    attr_accessor :client_secret

    # **[Required]** A space-separated list of the scopes that must be included when Digital Assistant requests an access token from
    # the provider. Include all the scopes that are required to access the resources. If refresh tokens are enabled,
    # include the scope that\u2019s necessary to get the refresh token (typically offline_access).
    #
    # @return [String]
    attr_accessor :scopes

    # **[Required]** The access-token profile claim to use to identify the user.
    # @return [String]
    attr_accessor :subject_claim

    # The number of days to keep the refresh token in the Digital Assistant cache.
    # @return [Integer]
    attr_accessor :refresh_token_retention_period_in_days

    # The OAuth Redirect URL.
    # @return [String]
    attr_accessor :redirect_url

    # Whether this Authentication Provider is visible in the ODA UI.
    # @return [BOOLEAN]
    attr_accessor :is_visible

    # Simple key-value pair that is applied without any predefined name, type, or scope.
    # Example: `{\"bar-key\": \"value\"}`
    #
    # @return [Hash<String, String>]
    attr_accessor :freeform_tags

    # Usage of predefined tag keys. These predefined keys are scoped to namespaces.
    # Example: `{\"foo-namespace\": {\"bar-key\": \"value\"}}`
    #
    # @return [Hash<String, Hash<String, Object>>]
    attr_accessor :defined_tags

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'grant_type': :'grantType',
        'identity_provider': :'identityProvider',
        'name': :'name',
        'token_endpoint_url': :'tokenEndpointUrl',
        'authorization_endpoint_url': :'authorizationEndpointUrl',
        'short_authorization_code_request_url': :'shortAuthorizationCodeRequestUrl',
        'revoke_token_endpoint_url': :'revokeTokenEndpointUrl',
        'client_id': :'clientId',
        'client_secret': :'clientSecret',
        'scopes': :'scopes',
        'subject_claim': :'subjectClaim',
        'refresh_token_retention_period_in_days': :'refreshTokenRetentionPeriodInDays',
        'redirect_url': :'redirectUrl',
        'is_visible': :'isVisible',
        'freeform_tags': :'freeformTags',
        'defined_tags': :'definedTags'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'grant_type': :'String',
        'identity_provider': :'String',
        'name': :'String',
        'token_endpoint_url': :'String',
        'authorization_endpoint_url': :'String',
        'short_authorization_code_request_url': :'String',
        'revoke_token_endpoint_url': :'String',
        'client_id': :'String',
        'client_secret': :'String',
        'scopes': :'String',
        'subject_claim': :'String',
        'refresh_token_retention_period_in_days': :'Integer',
        'redirect_url': :'String',
        'is_visible': :'BOOLEAN',
        'freeform_tags': :'Hash<String, String>',
        'defined_tags': :'Hash<String, Hash<String, Object>>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :grant_type The value to assign to the {#grant_type} property
    # @option attributes [String] :identity_provider The value to assign to the {#identity_provider} property
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [String] :token_endpoint_url The value to assign to the {#token_endpoint_url} property
    # @option attributes [String] :authorization_endpoint_url The value to assign to the {#authorization_endpoint_url} property
    # @option attributes [String] :short_authorization_code_request_url The value to assign to the {#short_authorization_code_request_url} property
    # @option attributes [String] :revoke_token_endpoint_url The value to assign to the {#revoke_token_endpoint_url} property
    # @option attributes [String] :client_id The value to assign to the {#client_id} property
    # @option attributes [String] :client_secret The value to assign to the {#client_secret} property
    # @option attributes [String] :scopes The value to assign to the {#scopes} property
    # @option attributes [String] :subject_claim The value to assign to the {#subject_claim} property
    # @option attributes [Integer] :refresh_token_retention_period_in_days The value to assign to the {#refresh_token_retention_period_in_days} property
    # @option attributes [String] :redirect_url The value to assign to the {#redirect_url} property
    # @option attributes [BOOLEAN] :is_visible The value to assign to the {#is_visible} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.grant_type = attributes[:'grantType'] if attributes[:'grantType']

      raise 'You cannot provide both :grantType and :grant_type' if attributes.key?(:'grantType') && attributes.key?(:'grant_type')

      self.grant_type = attributes[:'grant_type'] if attributes[:'grant_type']

      self.identity_provider = attributes[:'identityProvider'] if attributes[:'identityProvider']

      raise 'You cannot provide both :identityProvider and :identity_provider' if attributes.key?(:'identityProvider') && attributes.key?(:'identity_provider')

      self.identity_provider = attributes[:'identity_provider'] if attributes[:'identity_provider']

      self.name = attributes[:'name'] if attributes[:'name']

      self.token_endpoint_url = attributes[:'tokenEndpointUrl'] if attributes[:'tokenEndpointUrl']

      raise 'You cannot provide both :tokenEndpointUrl and :token_endpoint_url' if attributes.key?(:'tokenEndpointUrl') && attributes.key?(:'token_endpoint_url')

      self.token_endpoint_url = attributes[:'token_endpoint_url'] if attributes[:'token_endpoint_url']

      self.authorization_endpoint_url = attributes[:'authorizationEndpointUrl'] if attributes[:'authorizationEndpointUrl']

      raise 'You cannot provide both :authorizationEndpointUrl and :authorization_endpoint_url' if attributes.key?(:'authorizationEndpointUrl') && attributes.key?(:'authorization_endpoint_url')

      self.authorization_endpoint_url = attributes[:'authorization_endpoint_url'] if attributes[:'authorization_endpoint_url']

      self.short_authorization_code_request_url = attributes[:'shortAuthorizationCodeRequestUrl'] if attributes[:'shortAuthorizationCodeRequestUrl']

      raise 'You cannot provide both :shortAuthorizationCodeRequestUrl and :short_authorization_code_request_url' if attributes.key?(:'shortAuthorizationCodeRequestUrl') && attributes.key?(:'short_authorization_code_request_url')

      self.short_authorization_code_request_url = attributes[:'short_authorization_code_request_url'] if attributes[:'short_authorization_code_request_url']

      self.revoke_token_endpoint_url = attributes[:'revokeTokenEndpointUrl'] if attributes[:'revokeTokenEndpointUrl']

      raise 'You cannot provide both :revokeTokenEndpointUrl and :revoke_token_endpoint_url' if attributes.key?(:'revokeTokenEndpointUrl') && attributes.key?(:'revoke_token_endpoint_url')

      self.revoke_token_endpoint_url = attributes[:'revoke_token_endpoint_url'] if attributes[:'revoke_token_endpoint_url']

      self.client_id = attributes[:'clientId'] if attributes[:'clientId']

      raise 'You cannot provide both :clientId and :client_id' if attributes.key?(:'clientId') && attributes.key?(:'client_id')

      self.client_id = attributes[:'client_id'] if attributes[:'client_id']

      self.client_secret = attributes[:'clientSecret'] if attributes[:'clientSecret']

      raise 'You cannot provide both :clientSecret and :client_secret' if attributes.key?(:'clientSecret') && attributes.key?(:'client_secret')

      self.client_secret = attributes[:'client_secret'] if attributes[:'client_secret']

      self.scopes = attributes[:'scopes'] if attributes[:'scopes']

      self.subject_claim = attributes[:'subjectClaim'] if attributes[:'subjectClaim']

      raise 'You cannot provide both :subjectClaim and :subject_claim' if attributes.key?(:'subjectClaim') && attributes.key?(:'subject_claim')

      self.subject_claim = attributes[:'subject_claim'] if attributes[:'subject_claim']

      self.refresh_token_retention_period_in_days = attributes[:'refreshTokenRetentionPeriodInDays'] if attributes[:'refreshTokenRetentionPeriodInDays']

      raise 'You cannot provide both :refreshTokenRetentionPeriodInDays and :refresh_token_retention_period_in_days' if attributes.key?(:'refreshTokenRetentionPeriodInDays') && attributes.key?(:'refresh_token_retention_period_in_days')

      self.refresh_token_retention_period_in_days = attributes[:'refresh_token_retention_period_in_days'] if attributes[:'refresh_token_retention_period_in_days']

      self.redirect_url = attributes[:'redirectUrl'] if attributes[:'redirectUrl']

      raise 'You cannot provide both :redirectUrl and :redirect_url' if attributes.key?(:'redirectUrl') && attributes.key?(:'redirect_url')

      self.redirect_url = attributes[:'redirect_url'] if attributes[:'redirect_url']

      self.is_visible = attributes[:'isVisible'] unless attributes[:'isVisible'].nil?
      self.is_visible = true if is_visible.nil? && !attributes.key?(:'isVisible') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :isVisible and :is_visible' if attributes.key?(:'isVisible') && attributes.key?(:'is_visible')

      self.is_visible = attributes[:'is_visible'] unless attributes[:'is_visible'].nil?
      self.is_visible = true if is_visible.nil? && !attributes.key?(:'isVisible') && !attributes.key?(:'is_visible') # rubocop:disable Style/StringLiterals

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
    # @param [Object] grant_type Object to be assigned
    def grant_type=(grant_type)
      raise "Invalid value for 'grant_type': this must be one of the values in GRANT_TYPE_ENUM." if grant_type && !GRANT_TYPE_ENUM.include?(grant_type)

      @grant_type = grant_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] identity_provider Object to be assigned
    def identity_provider=(identity_provider)
      raise "Invalid value for 'identity_provider': this must be one of the values in IDENTITY_PROVIDER_ENUM." if identity_provider && !IDENTITY_PROVIDER_ENUM.include?(identity_provider)

      @identity_provider = identity_provider
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        grant_type == other.grant_type &&
        identity_provider == other.identity_provider &&
        name == other.name &&
        token_endpoint_url == other.token_endpoint_url &&
        authorization_endpoint_url == other.authorization_endpoint_url &&
        short_authorization_code_request_url == other.short_authorization_code_request_url &&
        revoke_token_endpoint_url == other.revoke_token_endpoint_url &&
        client_id == other.client_id &&
        client_secret == other.client_secret &&
        scopes == other.scopes &&
        subject_claim == other.subject_claim &&
        refresh_token_retention_period_in_days == other.refresh_token_retention_period_in_days &&
        redirect_url == other.redirect_url &&
        is_visible == other.is_visible &&
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
      [grant_type, identity_provider, name, token_endpoint_url, authorization_endpoint_url, short_authorization_code_request_url, revoke_token_endpoint_url, client_id, client_secret, scopes, subject_claim, refresh_token_retention_period_in_days, redirect_url, is_visible, freeform_tags, defined_tags].hash
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
