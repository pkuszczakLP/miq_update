# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'
require 'logger'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # A content access rule. An access rule specifies an action to take if a set of criteria is matched by a request.
  class Waas::Models::AccessRule
    ACTION_ENUM = [
      ACTION_ALLOW = 'ALLOW'.freeze,
      ACTION_DETECT = 'DETECT'.freeze,
      ACTION_BLOCK = 'BLOCK'.freeze,
      ACTION_BYPASS = 'BYPASS'.freeze,
      ACTION_REDIRECT = 'REDIRECT'.freeze,
      ACTION_SHOW_CAPTCHA = 'SHOW_CAPTCHA'.freeze,
      ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    BLOCK_ACTION_ENUM = [
      BLOCK_ACTION_SET_RESPONSE_CODE = 'SET_RESPONSE_CODE'.freeze,
      BLOCK_ACTION_SHOW_ERROR_PAGE = 'SHOW_ERROR_PAGE'.freeze,
      BLOCK_ACTION_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    BYPASS_CHALLENGES_ENUM = [
      BYPASS_CHALLENGES_JS_CHALLENGE = 'JS_CHALLENGE'.freeze,
      BYPASS_CHALLENGES_DEVICE_FINGERPRINT_CHALLENGE = 'DEVICE_FINGERPRINT_CHALLENGE'.freeze,
      BYPASS_CHALLENGES_HUMAN_INTERACTION_CHALLENGE = 'HUMAN_INTERACTION_CHALLENGE'.freeze,
      BYPASS_CHALLENGES_CAPTCHA = 'CAPTCHA'.freeze,
      BYPASS_CHALLENGES_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    REDIRECT_RESPONSE_CODE_ENUM = [
      REDIRECT_RESPONSE_CODE_MOVED_PERMANENTLY = 'MOVED_PERMANENTLY'.freeze,
      REDIRECT_RESPONSE_CODE_FOUND = 'FOUND'.freeze,
      REDIRECT_RESPONSE_CODE_UNKNOWN_ENUM_VALUE = 'UNKNOWN_ENUM_VALUE'.freeze
    ].freeze

    # **[Required]** The unique name of the access rule.
    # @return [String]
    attr_accessor :name

    # **[Required]** The list of access rule criteria. The rule would be applied only for the requests that matched all the listed conditions.
    # @return [Array<OCI::Waas::Models::AccessRuleCriteria>]
    attr_accessor :criteria

    # **[Required]** The action to take when the access criteria are met for a rule. If unspecified, defaults to `ALLOW`.
    #
    # - **ALLOW:** Takes no action, just logs the request.
    #
    # - **DETECT:** Takes no action, but creates an alert for the request.
    #
    # - **BLOCK:** Blocks the request by returning specified response code or showing error page.
    #
    # - **BYPASS:** Bypasses some or all challenges.
    #
    # - **REDIRECT:** Redirects the request to the specified URL. These fields are required when `REDIRECT` is selected: `redirectUrl`, `redirectResponseCode`.
    #
    # - **SHOW_CAPTCHA:** Show a CAPTCHA Challenge page instead of the requested page.
    #
    # Regardless of action, no further rules are processed once a rule is matched.
    # @return [String]
    attr_reader :action

    # The method used to block requests if `action` is set to `BLOCK` and the access criteria are met. If unspecified, defaults to `SET_RESPONSE_CODE`.
    # @return [String]
    attr_reader :block_action

    # The response status code to return when `action` is set to `BLOCK`, `blockAction` is set to `SET_RESPONSE_CODE`, and the access criteria are met. If unspecified, defaults to `403`. The list of available response codes: `200`, `201`, `202`, `204`, `206`, `300`, `301`, `302`, `303`, `304`, `307`, `400`, `401`, `403`, `404`, `405`, `408`, `409`, `411`, `412`, `413`, `414`, `415`, `416`, `422`, `444`, `494`, `495`, `496`, `497`, `499`, `500`, `501`, `502`, `503`, `504`, `507`.
    # @return [Integer]
    attr_accessor :block_response_code

    # The message to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the access criteria are met. If unspecified, defaults to 'Access to the website is blocked.'
    # @return [String]
    attr_accessor :block_error_page_message

    # The error code to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the access criteria are met. If unspecified, defaults to 'Access rules'.
    # @return [String]
    attr_accessor :block_error_page_code

    # The description text to show on the error page when `action` is set to `BLOCK`, `blockAction` is set to `SHOW_ERROR_PAGE`, and the access criteria are met. If unspecified, defaults to 'Access blocked by website owner. Please contact support.'
    # @return [String]
    attr_accessor :block_error_page_description

    # The list of challenges to bypass when `action` is set to `BYPASS`. If unspecified or empty, all challenges are bypassed.
    #
    # - **JS_CHALLENGE:** Bypasses JavaScript Challenge.
    #
    # - **DEVICE_FINGERPRINT_CHALLENGE:** Bypasses Device Fingerprint Challenge.
    #
    # - **HUMAN_INTERACTION_CHALLENGE:** Bypasses Human Interaction Challenge.
    #
    # - **CAPTCHA:** Bypasses CAPTCHA Challenge.
    # @return [Array<String>]
    attr_reader :bypass_challenges

    # The target to which the request should be redirected, represented as a URI reference. Required when `action` is `REDIRECT`.
    # @return [String]
    attr_accessor :redirect_url

    # The response status code to return when `action` is set to `REDIRECT`.
    #
    # - **MOVED_PERMANENTLY:** Used for designating the permanent movement of a page (numerical code - 301).
    #
    # - **FOUND:** Used for designating the temporary movement of a page (numerical code - 302).
    # @return [String]
    attr_reader :redirect_response_code

    # The title used when showing a CAPTCHA challenge when `action` is set to `SHOW_CAPTCHA` and the request is challenged.
    # @return [String]
    attr_accessor :captcha_title

    # The text to show in the header when showing a CAPTCHA challenge when `action` is set to `SHOW_CAPTCHA` and the request is challenged.
    # @return [String]
    attr_accessor :captcha_header

    # The text to show in the footer when showing a CAPTCHA challenge when `action` is set to `SHOW_CAPTCHA` and the request is challenged.
    # @return [String]
    attr_accessor :captcha_footer

    # The text to show on the label of the CAPTCHA challenge submit button when `action` is set to `SHOW_CAPTCHA` and the request is challenged.
    # @return [String]
    attr_accessor :captcha_submit_label

    # An object that represents an action to apply to an HTTP response headers if all rule criteria will be matched regardless of `action` value.
    # @return [Array<OCI::Waas::Models::HeaderManipulationAction>]
    attr_accessor :response_header_manipulation

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'name',
        'criteria': :'criteria',
        'action': :'action',
        'block_action': :'blockAction',
        'block_response_code': :'blockResponseCode',
        'block_error_page_message': :'blockErrorPageMessage',
        'block_error_page_code': :'blockErrorPageCode',
        'block_error_page_description': :'blockErrorPageDescription',
        'bypass_challenges': :'bypassChallenges',
        'redirect_url': :'redirectUrl',
        'redirect_response_code': :'redirectResponseCode',
        'captcha_title': :'captchaTitle',
        'captcha_header': :'captchaHeader',
        'captcha_footer': :'captchaFooter',
        'captcha_submit_label': :'captchaSubmitLabel',
        'response_header_manipulation': :'responseHeaderManipulation'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        # rubocop:disable Style/SymbolLiteral
        'name': :'String',
        'criteria': :'Array<OCI::Waas::Models::AccessRuleCriteria>',
        'action': :'String',
        'block_action': :'String',
        'block_response_code': :'Integer',
        'block_error_page_message': :'String',
        'block_error_page_code': :'String',
        'block_error_page_description': :'String',
        'bypass_challenges': :'Array<String>',
        'redirect_url': :'String',
        'redirect_response_code': :'String',
        'captcha_title': :'String',
        'captcha_header': :'String',
        'captcha_footer': :'String',
        'captcha_submit_label': :'String',
        'response_header_manipulation': :'Array<OCI::Waas::Models::HeaderManipulationAction>'
        # rubocop:enable Style/SymbolLiteral
      }
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:disable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral


    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    # @option attributes [String] :name The value to assign to the {#name} property
    # @option attributes [Array<OCI::Waas::Models::AccessRuleCriteria>] :criteria The value to assign to the {#criteria} property
    # @option attributes [String] :action The value to assign to the {#action} property
    # @option attributes [String] :block_action The value to assign to the {#block_action} property
    # @option attributes [Integer] :block_response_code The value to assign to the {#block_response_code} property
    # @option attributes [String] :block_error_page_message The value to assign to the {#block_error_page_message} property
    # @option attributes [String] :block_error_page_code The value to assign to the {#block_error_page_code} property
    # @option attributes [String] :block_error_page_description The value to assign to the {#block_error_page_description} property
    # @option attributes [Array<String>] :bypass_challenges The value to assign to the {#bypass_challenges} property
    # @option attributes [String] :redirect_url The value to assign to the {#redirect_url} property
    # @option attributes [String] :redirect_response_code The value to assign to the {#redirect_response_code} property
    # @option attributes [String] :captcha_title The value to assign to the {#captcha_title} property
    # @option attributes [String] :captcha_header The value to assign to the {#captcha_header} property
    # @option attributes [String] :captcha_footer The value to assign to the {#captcha_footer} property
    # @option attributes [String] :captcha_submit_label The value to assign to the {#captcha_submit_label} property
    # @option attributes [Array<OCI::Waas::Models::HeaderManipulationAction>] :response_header_manipulation The value to assign to the {#response_header_manipulation} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.name = attributes[:'name'] if attributes[:'name']

      self.criteria = attributes[:'criteria'] if attributes[:'criteria']

      self.action = attributes[:'action'] if attributes[:'action']

      self.block_action = attributes[:'blockAction'] if attributes[:'blockAction']

      raise 'You cannot provide both :blockAction and :block_action' if attributes.key?(:'blockAction') && attributes.key?(:'block_action')

      self.block_action = attributes[:'block_action'] if attributes[:'block_action']

      self.block_response_code = attributes[:'blockResponseCode'] if attributes[:'blockResponseCode']

      raise 'You cannot provide both :blockResponseCode and :block_response_code' if attributes.key?(:'blockResponseCode') && attributes.key?(:'block_response_code')

      self.block_response_code = attributes[:'block_response_code'] if attributes[:'block_response_code']

      self.block_error_page_message = attributes[:'blockErrorPageMessage'] if attributes[:'blockErrorPageMessage']

      raise 'You cannot provide both :blockErrorPageMessage and :block_error_page_message' if attributes.key?(:'blockErrorPageMessage') && attributes.key?(:'block_error_page_message')

      self.block_error_page_message = attributes[:'block_error_page_message'] if attributes[:'block_error_page_message']

      self.block_error_page_code = attributes[:'blockErrorPageCode'] if attributes[:'blockErrorPageCode']

      raise 'You cannot provide both :blockErrorPageCode and :block_error_page_code' if attributes.key?(:'blockErrorPageCode') && attributes.key?(:'block_error_page_code')

      self.block_error_page_code = attributes[:'block_error_page_code'] if attributes[:'block_error_page_code']

      self.block_error_page_description = attributes[:'blockErrorPageDescription'] if attributes[:'blockErrorPageDescription']

      raise 'You cannot provide both :blockErrorPageDescription and :block_error_page_description' if attributes.key?(:'blockErrorPageDescription') && attributes.key?(:'block_error_page_description')

      self.block_error_page_description = attributes[:'block_error_page_description'] if attributes[:'block_error_page_description']

      self.bypass_challenges = attributes[:'bypassChallenges'] if attributes[:'bypassChallenges']

      raise 'You cannot provide both :bypassChallenges and :bypass_challenges' if attributes.key?(:'bypassChallenges') && attributes.key?(:'bypass_challenges')

      self.bypass_challenges = attributes[:'bypass_challenges'] if attributes[:'bypass_challenges']

      self.redirect_url = attributes[:'redirectUrl'] if attributes[:'redirectUrl']

      raise 'You cannot provide both :redirectUrl and :redirect_url' if attributes.key?(:'redirectUrl') && attributes.key?(:'redirect_url')

      self.redirect_url = attributes[:'redirect_url'] if attributes[:'redirect_url']

      self.redirect_response_code = attributes[:'redirectResponseCode'] if attributes[:'redirectResponseCode']
      self.redirect_response_code = "MOVED_PERMANENTLY" if redirect_response_code.nil? && !attributes.key?(:'redirectResponseCode') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :redirectResponseCode and :redirect_response_code' if attributes.key?(:'redirectResponseCode') && attributes.key?(:'redirect_response_code')

      self.redirect_response_code = attributes[:'redirect_response_code'] if attributes[:'redirect_response_code']
      self.redirect_response_code = "MOVED_PERMANENTLY" if redirect_response_code.nil? && !attributes.key?(:'redirectResponseCode') && !attributes.key?(:'redirect_response_code') # rubocop:disable Style/StringLiterals

      self.captcha_title = attributes[:'captchaTitle'] if attributes[:'captchaTitle']
      self.captcha_title = "Are you human?" if captcha_title.nil? && !attributes.key?(:'captchaTitle') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :captchaTitle and :captcha_title' if attributes.key?(:'captchaTitle') && attributes.key?(:'captcha_title')

      self.captcha_title = attributes[:'captcha_title'] if attributes[:'captcha_title']
      self.captcha_title = "Are you human?" if captcha_title.nil? && !attributes.key?(:'captchaTitle') && !attributes.key?(:'captcha_title') # rubocop:disable Style/StringLiterals

      self.captcha_header = attributes[:'captchaHeader'] if attributes[:'captchaHeader']
      self.captcha_header = "We have detected an increased number of attempts to access this webapp. To help us keep this webapp secure, please let us know that you are not a robot by entering the text from captcha below." if captcha_header.nil? && !attributes.key?(:'captchaHeader') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :captchaHeader and :captcha_header' if attributes.key?(:'captchaHeader') && attributes.key?(:'captcha_header')

      self.captcha_header = attributes[:'captcha_header'] if attributes[:'captcha_header']
      self.captcha_header = "We have detected an increased number of attempts to access this webapp. To help us keep this webapp secure, please let us know that you are not a robot by entering the text from captcha below." if captcha_header.nil? && !attributes.key?(:'captchaHeader') && !attributes.key?(:'captcha_header') # rubocop:disable Style/StringLiterals

      self.captcha_footer = attributes[:'captchaFooter'] if attributes[:'captchaFooter']
      self.captcha_footer = "Enter the letters and numbers as they are shown in image above" if captcha_footer.nil? && !attributes.key?(:'captchaFooter') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :captchaFooter and :captcha_footer' if attributes.key?(:'captchaFooter') && attributes.key?(:'captcha_footer')

      self.captcha_footer = attributes[:'captcha_footer'] if attributes[:'captcha_footer']
      self.captcha_footer = "Enter the letters and numbers as they are shown in image above" if captcha_footer.nil? && !attributes.key?(:'captchaFooter') && !attributes.key?(:'captcha_footer') # rubocop:disable Style/StringLiterals

      self.captcha_submit_label = attributes[:'captchaSubmitLabel'] if attributes[:'captchaSubmitLabel']
      self.captcha_submit_label = "Yes, I am human" if captcha_submit_label.nil? && !attributes.key?(:'captchaSubmitLabel') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :captchaSubmitLabel and :captcha_submit_label' if attributes.key?(:'captchaSubmitLabel') && attributes.key?(:'captcha_submit_label')

      self.captcha_submit_label = attributes[:'captcha_submit_label'] if attributes[:'captcha_submit_label']
      self.captcha_submit_label = "Yes, I am human" if captcha_submit_label.nil? && !attributes.key?(:'captchaSubmitLabel') && !attributes.key?(:'captcha_submit_label') # rubocop:disable Style/StringLiterals

      self.response_header_manipulation = attributes[:'responseHeaderManipulation'] if attributes[:'responseHeaderManipulation']

      raise 'You cannot provide both :responseHeaderManipulation and :response_header_manipulation' if attributes.key?(:'responseHeaderManipulation') && attributes.key?(:'response_header_manipulation')

      self.response_header_manipulation = attributes[:'response_header_manipulation'] if attributes[:'response_header_manipulation']
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity
    # rubocop:enable Metrics/MethodLength, Layout/EmptyLines, Style/SymbolLiteral

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] action Object to be assigned
    def action=(action)
      # rubocop:disable Style/ConditionalAssignment
      if action && !ACTION_ENUM.include?(action)
        OCI.logger.debug("Unknown value for 'action' [" + action + "]. Mapping to 'ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @action = ACTION_UNKNOWN_ENUM_VALUE
      else
        @action = action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] block_action Object to be assigned
    def block_action=(block_action)
      # rubocop:disable Style/ConditionalAssignment
      if block_action && !BLOCK_ACTION_ENUM.include?(block_action)
        OCI.logger.debug("Unknown value for 'block_action' [" + block_action + "]. Mapping to 'BLOCK_ACTION_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @block_action = BLOCK_ACTION_UNKNOWN_ENUM_VALUE
      else
        @block_action = block_action
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] bypass_challenges Object to be assigned
    def bypass_challenges=(bypass_challenges)
      # rubocop:disable Style/ConditionalAssignment
      if bypass_challenges.nil?
        @bypass_challenges = nil
      else
        @bypass_challenges =
          bypass_challenges.collect do |item|
            if BYPASS_CHALLENGES_ENUM.include?(item)
              item
            else
              OCI.logger.debug("Unknown value for 'bypass_challenges' [#{item}]. Mapping to 'BYPASS_CHALLENGES_UNKNOWN_ENUM_VALUE'") if OCI.logger
              BYPASS_CHALLENGES_UNKNOWN_ENUM_VALUE
            end
          end
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] redirect_response_code Object to be assigned
    def redirect_response_code=(redirect_response_code)
      # rubocop:disable Style/ConditionalAssignment
      if redirect_response_code && !REDIRECT_RESPONSE_CODE_ENUM.include?(redirect_response_code)
        OCI.logger.debug("Unknown value for 'redirect_response_code' [" + redirect_response_code + "]. Mapping to 'REDIRECT_RESPONSE_CODE_UNKNOWN_ENUM_VALUE'") if OCI.logger
        @redirect_response_code = REDIRECT_RESPONSE_CODE_UNKNOWN_ENUM_VALUE
      else
        @redirect_response_code = redirect_response_code
      end
      # rubocop:enable Style/ConditionalAssignment
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        name == other.name &&
        criteria == other.criteria &&
        action == other.action &&
        block_action == other.block_action &&
        block_response_code == other.block_response_code &&
        block_error_page_message == other.block_error_page_message &&
        block_error_page_code == other.block_error_page_code &&
        block_error_page_description == other.block_error_page_description &&
        bypass_challenges == other.bypass_challenges &&
        redirect_url == other.redirect_url &&
        redirect_response_code == other.redirect_response_code &&
        captcha_title == other.captcha_title &&
        captcha_header == other.captcha_header &&
        captcha_footer == other.captcha_footer &&
        captcha_submit_label == other.captcha_submit_label &&
        response_header_manipulation == other.response_header_manipulation
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
      [name, criteria, action, block_action, block_response_code, block_error_page_message, block_error_page_code, block_error_page_description, bypass_challenges, redirect_url, redirect_response_code, captcha_title, captcha_header, captcha_footer, captcha_submit_label, response_header_manipulation].hash
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
