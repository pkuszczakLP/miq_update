# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

require 'date'

# rubocop:disable Lint/UnneededCopDisableDirective, Metrics/LineLength
module OCI
  # The information required to create a RoverNode.
  class Rover::Models::CreateRoverNodeDetails
    SHIPPING_PREFERENCE_ENUM = [
      SHIPPING_PREFERENCE_ORACLE_SHIPPED = 'ORACLE_SHIPPED'.freeze,
      SHIPPING_PREFERENCE_CUSTOMER_PICKUP = 'CUSTOMER_PICKUP'.freeze
    ].freeze

    LIFECYCLE_STATE_ENUM = [
      LIFECYCLE_STATE_CREATING = 'CREATING'.freeze,
      LIFECYCLE_STATE_UPDATING = 'UPDATING'.freeze,
      LIFECYCLE_STATE_ACTIVE = 'ACTIVE'.freeze,
      LIFECYCLE_STATE_DELETING = 'DELETING'.freeze,
      LIFECYCLE_STATE_DELETED = 'DELETED'.freeze,
      LIFECYCLE_STATE_FAILED = 'FAILED'.freeze
    ].freeze

    ENCLOSURE_TYPE_ENUM = [
      ENCLOSURE_TYPE_RUGGADIZED = 'RUGGADIZED'.freeze,
      ENCLOSURE_TYPE_NON_RUGGADIZED = 'NON_RUGGADIZED'.freeze
    ].freeze

    # **[Required]** A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information.
    # @return [String]
    attr_accessor :display_name

    # **[Required]** The OCID of the compartment containing the RoverNode.
    # @return [String]
    attr_accessor :compartment_id

    # The shape of the node.
    # @return [String]
    attr_accessor :shape

    # @return [OCI::Rover::Models::ShippingAddress]
    attr_accessor :customer_shipping_address

    # List of existing workloads that should be provisioned on the node.
    # @return [Array<OCI::Rover::Models::RoverWorkload>]
    attr_accessor :node_workloads

    # Root password for the rover node.
    # @return [String]
    attr_accessor :super_user_password

    # Passphrase to unlock the rover node.
    # @return [String]
    attr_accessor :unlock_passphrase

    # Name of point of contact for this order if customer is picking up.
    # @return [String]
    attr_accessor :point_of_contact

    # Phone number of point of contact for this order if customer is picking up.
    # @return [String]
    attr_accessor :point_of_contact_phone_number

    # Preference for device delivery.
    # @return [String]
    attr_reader :shipping_preference

    # Shipping vendor of choice for orace to customer shipping.
    # @return [String]
    attr_accessor :shipping_vendor

    # Expected date when customer wants to pickup the device if they chose customer pickup.
    # @return [DateTime]
    attr_accessor :time_pickup_expected

    # The public key of the resource principal
    # @return [String]
    attr_accessor :public_key

    # Start time for the window to pickup the device from customer.
    # @return [DateTime]
    attr_accessor :time_return_window_starts

    # End time for the window to pickup the device from customer.
    # @return [DateTime]
    attr_accessor :time_return_window_ends

    # The current state of the RoverNode.
    # @return [String]
    attr_reader :lifecycle_state

    # The type of enclosure rover nodes in this cluster are shipped in.
    # @return [String]
    attr_reader :enclosure_type

    # A property that can contain details on the lifecycle.
    # @return [String]
    attr_accessor :lifecycle_state_details

    # Serial number of the node.
    # @return [String]
    attr_accessor :serial_number

    # Tracking Url for the shipped FmsRoverNode.
    # @return [String]
    attr_accessor :oracle_shipping_tracking_url

    # The flag indicating that customer requests data to be imported to OCI upon Rover node return.
    # @return [BOOLEAN]
    attr_accessor :is_import_requested

    # An OCID of a compartment where data will be imported to upon Rover node return.
    # @return [String]
    attr_accessor :import_compartment_id

    # Name of a bucket where files from NFS share will be imported to upon Rover node return.
    # @return [String]
    attr_accessor :import_file_bucket

    # Validation code returned by data validation tool. Required for return shipping label generation if data import was requested.
    # @return [String]
    attr_accessor :data_validation_code

    # Customer provided master key ID to encrypt secret information. If not provided, Rover's master key will be used for encryption.
    # @return [String]
    attr_accessor :master_key_id

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
        'display_name': :'displayName',
        'compartment_id': :'compartmentId',
        'shape': :'shape',
        'customer_shipping_address': :'customerShippingAddress',
        'node_workloads': :'nodeWorkloads',
        'super_user_password': :'superUserPassword',
        'unlock_passphrase': :'unlockPassphrase',
        'point_of_contact': :'pointOfContact',
        'point_of_contact_phone_number': :'pointOfContactPhoneNumber',
        'shipping_preference': :'shippingPreference',
        'shipping_vendor': :'shippingVendor',
        'time_pickup_expected': :'timePickupExpected',
        'public_key': :'publicKey',
        'time_return_window_starts': :'timeReturnWindowStarts',
        'time_return_window_ends': :'timeReturnWindowEnds',
        'lifecycle_state': :'lifecycleState',
        'enclosure_type': :'enclosureType',
        'lifecycle_state_details': :'lifecycleStateDetails',
        'serial_number': :'serialNumber',
        'oracle_shipping_tracking_url': :'oracleShippingTrackingUrl',
        'is_import_requested': :'isImportRequested',
        'import_compartment_id': :'importCompartmentId',
        'import_file_bucket': :'importFileBucket',
        'data_validation_code': :'dataValidationCode',
        'master_key_id': :'masterKeyId',
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
        'display_name': :'String',
        'compartment_id': :'String',
        'shape': :'String',
        'customer_shipping_address': :'OCI::Rover::Models::ShippingAddress',
        'node_workloads': :'Array<OCI::Rover::Models::RoverWorkload>',
        'super_user_password': :'String',
        'unlock_passphrase': :'String',
        'point_of_contact': :'String',
        'point_of_contact_phone_number': :'String',
        'shipping_preference': :'String',
        'shipping_vendor': :'String',
        'time_pickup_expected': :'DateTime',
        'public_key': :'String',
        'time_return_window_starts': :'DateTime',
        'time_return_window_ends': :'DateTime',
        'lifecycle_state': :'String',
        'enclosure_type': :'String',
        'lifecycle_state_details': :'String',
        'serial_number': :'String',
        'oracle_shipping_tracking_url': :'String',
        'is_import_requested': :'BOOLEAN',
        'import_compartment_id': :'String',
        'import_file_bucket': :'String',
        'data_validation_code': :'String',
        'master_key_id': :'String',
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
    # @option attributes [String] :display_name The value to assign to the {#display_name} property
    # @option attributes [String] :compartment_id The value to assign to the {#compartment_id} property
    # @option attributes [String] :shape The value to assign to the {#shape} property
    # @option attributes [OCI::Rover::Models::ShippingAddress] :customer_shipping_address The value to assign to the {#customer_shipping_address} property
    # @option attributes [Array<OCI::Rover::Models::RoverWorkload>] :node_workloads The value to assign to the {#node_workloads} property
    # @option attributes [String] :super_user_password The value to assign to the {#super_user_password} property
    # @option attributes [String] :unlock_passphrase The value to assign to the {#unlock_passphrase} property
    # @option attributes [String] :point_of_contact The value to assign to the {#point_of_contact} property
    # @option attributes [String] :point_of_contact_phone_number The value to assign to the {#point_of_contact_phone_number} property
    # @option attributes [String] :shipping_preference The value to assign to the {#shipping_preference} property
    # @option attributes [String] :shipping_vendor The value to assign to the {#shipping_vendor} property
    # @option attributes [DateTime] :time_pickup_expected The value to assign to the {#time_pickup_expected} property
    # @option attributes [String] :public_key The value to assign to the {#public_key} property
    # @option attributes [DateTime] :time_return_window_starts The value to assign to the {#time_return_window_starts} property
    # @option attributes [DateTime] :time_return_window_ends The value to assign to the {#time_return_window_ends} property
    # @option attributes [String] :lifecycle_state The value to assign to the {#lifecycle_state} property
    # @option attributes [String] :enclosure_type The value to assign to the {#enclosure_type} property
    # @option attributes [String] :lifecycle_state_details The value to assign to the {#lifecycle_state_details} property
    # @option attributes [String] :serial_number The value to assign to the {#serial_number} property
    # @option attributes [String] :oracle_shipping_tracking_url The value to assign to the {#oracle_shipping_tracking_url} property
    # @option attributes [BOOLEAN] :is_import_requested The value to assign to the {#is_import_requested} property
    # @option attributes [String] :import_compartment_id The value to assign to the {#import_compartment_id} property
    # @option attributes [String] :import_file_bucket The value to assign to the {#import_file_bucket} property
    # @option attributes [String] :data_validation_code The value to assign to the {#data_validation_code} property
    # @option attributes [String] :master_key_id The value to assign to the {#master_key_id} property
    # @option attributes [Hash<String, String>] :freeform_tags The value to assign to the {#freeform_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :defined_tags The value to assign to the {#defined_tags} property
    # @option attributes [Hash<String, Hash<String, Object>>] :system_tags The value to assign to the {#system_tags} property
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      self.display_name = attributes[:'displayName'] if attributes[:'displayName']

      raise 'You cannot provide both :displayName and :display_name' if attributes.key?(:'displayName') && attributes.key?(:'display_name')

      self.display_name = attributes[:'display_name'] if attributes[:'display_name']

      self.compartment_id = attributes[:'compartmentId'] if attributes[:'compartmentId']

      raise 'You cannot provide both :compartmentId and :compartment_id' if attributes.key?(:'compartmentId') && attributes.key?(:'compartment_id')

      self.compartment_id = attributes[:'compartment_id'] if attributes[:'compartment_id']

      self.shape = attributes[:'shape'] if attributes[:'shape']

      self.customer_shipping_address = attributes[:'customerShippingAddress'] if attributes[:'customerShippingAddress']

      raise 'You cannot provide both :customerShippingAddress and :customer_shipping_address' if attributes.key?(:'customerShippingAddress') && attributes.key?(:'customer_shipping_address')

      self.customer_shipping_address = attributes[:'customer_shipping_address'] if attributes[:'customer_shipping_address']

      self.node_workloads = attributes[:'nodeWorkloads'] if attributes[:'nodeWorkloads']

      raise 'You cannot provide both :nodeWorkloads and :node_workloads' if attributes.key?(:'nodeWorkloads') && attributes.key?(:'node_workloads')

      self.node_workloads = attributes[:'node_workloads'] if attributes[:'node_workloads']

      self.super_user_password = attributes[:'superUserPassword'] if attributes[:'superUserPassword']

      raise 'You cannot provide both :superUserPassword and :super_user_password' if attributes.key?(:'superUserPassword') && attributes.key?(:'super_user_password')

      self.super_user_password = attributes[:'super_user_password'] if attributes[:'super_user_password']

      self.unlock_passphrase = attributes[:'unlockPassphrase'] if attributes[:'unlockPassphrase']

      raise 'You cannot provide both :unlockPassphrase and :unlock_passphrase' if attributes.key?(:'unlockPassphrase') && attributes.key?(:'unlock_passphrase')

      self.unlock_passphrase = attributes[:'unlock_passphrase'] if attributes[:'unlock_passphrase']

      self.point_of_contact = attributes[:'pointOfContact'] if attributes[:'pointOfContact']

      raise 'You cannot provide both :pointOfContact and :point_of_contact' if attributes.key?(:'pointOfContact') && attributes.key?(:'point_of_contact')

      self.point_of_contact = attributes[:'point_of_contact'] if attributes[:'point_of_contact']

      self.point_of_contact_phone_number = attributes[:'pointOfContactPhoneNumber'] if attributes[:'pointOfContactPhoneNumber']

      raise 'You cannot provide both :pointOfContactPhoneNumber and :point_of_contact_phone_number' if attributes.key?(:'pointOfContactPhoneNumber') && attributes.key?(:'point_of_contact_phone_number')

      self.point_of_contact_phone_number = attributes[:'point_of_contact_phone_number'] if attributes[:'point_of_contact_phone_number']

      self.shipping_preference = attributes[:'shippingPreference'] if attributes[:'shippingPreference']
      self.shipping_preference = "ORACLE_SHIPPED" if shipping_preference.nil? && !attributes.key?(:'shippingPreference') # rubocop:disable Style/StringLiterals

      raise 'You cannot provide both :shippingPreference and :shipping_preference' if attributes.key?(:'shippingPreference') && attributes.key?(:'shipping_preference')

      self.shipping_preference = attributes[:'shipping_preference'] if attributes[:'shipping_preference']
      self.shipping_preference = "ORACLE_SHIPPED" if shipping_preference.nil? && !attributes.key?(:'shippingPreference') && !attributes.key?(:'shipping_preference') # rubocop:disable Style/StringLiterals

      self.shipping_vendor = attributes[:'shippingVendor'] if attributes[:'shippingVendor']

      raise 'You cannot provide both :shippingVendor and :shipping_vendor' if attributes.key?(:'shippingVendor') && attributes.key?(:'shipping_vendor')

      self.shipping_vendor = attributes[:'shipping_vendor'] if attributes[:'shipping_vendor']

      self.time_pickup_expected = attributes[:'timePickupExpected'] if attributes[:'timePickupExpected']

      raise 'You cannot provide both :timePickupExpected and :time_pickup_expected' if attributes.key?(:'timePickupExpected') && attributes.key?(:'time_pickup_expected')

      self.time_pickup_expected = attributes[:'time_pickup_expected'] if attributes[:'time_pickup_expected']

      self.public_key = attributes[:'publicKey'] if attributes[:'publicKey']

      raise 'You cannot provide both :publicKey and :public_key' if attributes.key?(:'publicKey') && attributes.key?(:'public_key')

      self.public_key = attributes[:'public_key'] if attributes[:'public_key']

      self.time_return_window_starts = attributes[:'timeReturnWindowStarts'] if attributes[:'timeReturnWindowStarts']

      raise 'You cannot provide both :timeReturnWindowStarts and :time_return_window_starts' if attributes.key?(:'timeReturnWindowStarts') && attributes.key?(:'time_return_window_starts')

      self.time_return_window_starts = attributes[:'time_return_window_starts'] if attributes[:'time_return_window_starts']

      self.time_return_window_ends = attributes[:'timeReturnWindowEnds'] if attributes[:'timeReturnWindowEnds']

      raise 'You cannot provide both :timeReturnWindowEnds and :time_return_window_ends' if attributes.key?(:'timeReturnWindowEnds') && attributes.key?(:'time_return_window_ends')

      self.time_return_window_ends = attributes[:'time_return_window_ends'] if attributes[:'time_return_window_ends']

      self.lifecycle_state = attributes[:'lifecycleState'] if attributes[:'lifecycleState']

      raise 'You cannot provide both :lifecycleState and :lifecycle_state' if attributes.key?(:'lifecycleState') && attributes.key?(:'lifecycle_state')

      self.lifecycle_state = attributes[:'lifecycle_state'] if attributes[:'lifecycle_state']

      self.enclosure_type = attributes[:'enclosureType'] if attributes[:'enclosureType']

      raise 'You cannot provide both :enclosureType and :enclosure_type' if attributes.key?(:'enclosureType') && attributes.key?(:'enclosure_type')

      self.enclosure_type = attributes[:'enclosure_type'] if attributes[:'enclosure_type']

      self.lifecycle_state_details = attributes[:'lifecycleStateDetails'] if attributes[:'lifecycleStateDetails']

      raise 'You cannot provide both :lifecycleStateDetails and :lifecycle_state_details' if attributes.key?(:'lifecycleStateDetails') && attributes.key?(:'lifecycle_state_details')

      self.lifecycle_state_details = attributes[:'lifecycle_state_details'] if attributes[:'lifecycle_state_details']

      self.serial_number = attributes[:'serialNumber'] if attributes[:'serialNumber']

      raise 'You cannot provide both :serialNumber and :serial_number' if attributes.key?(:'serialNumber') && attributes.key?(:'serial_number')

      self.serial_number = attributes[:'serial_number'] if attributes[:'serial_number']

      self.oracle_shipping_tracking_url = attributes[:'oracleShippingTrackingUrl'] if attributes[:'oracleShippingTrackingUrl']

      raise 'You cannot provide both :oracleShippingTrackingUrl and :oracle_shipping_tracking_url' if attributes.key?(:'oracleShippingTrackingUrl') && attributes.key?(:'oracle_shipping_tracking_url')

      self.oracle_shipping_tracking_url = attributes[:'oracle_shipping_tracking_url'] if attributes[:'oracle_shipping_tracking_url']

      self.is_import_requested = attributes[:'isImportRequested'] unless attributes[:'isImportRequested'].nil?

      raise 'You cannot provide both :isImportRequested and :is_import_requested' if attributes.key?(:'isImportRequested') && attributes.key?(:'is_import_requested')

      self.is_import_requested = attributes[:'is_import_requested'] unless attributes[:'is_import_requested'].nil?

      self.import_compartment_id = attributes[:'importCompartmentId'] if attributes[:'importCompartmentId']

      raise 'You cannot provide both :importCompartmentId and :import_compartment_id' if attributes.key?(:'importCompartmentId') && attributes.key?(:'import_compartment_id')

      self.import_compartment_id = attributes[:'import_compartment_id'] if attributes[:'import_compartment_id']

      self.import_file_bucket = attributes[:'importFileBucket'] if attributes[:'importFileBucket']

      raise 'You cannot provide both :importFileBucket and :import_file_bucket' if attributes.key?(:'importFileBucket') && attributes.key?(:'import_file_bucket')

      self.import_file_bucket = attributes[:'import_file_bucket'] if attributes[:'import_file_bucket']

      self.data_validation_code = attributes[:'dataValidationCode'] if attributes[:'dataValidationCode']

      raise 'You cannot provide both :dataValidationCode and :data_validation_code' if attributes.key?(:'dataValidationCode') && attributes.key?(:'data_validation_code')

      self.data_validation_code = attributes[:'data_validation_code'] if attributes[:'data_validation_code']

      self.master_key_id = attributes[:'masterKeyId'] if attributes[:'masterKeyId']

      raise 'You cannot provide both :masterKeyId and :master_key_id' if attributes.key?(:'masterKeyId') && attributes.key?(:'master_key_id')

      self.master_key_id = attributes[:'master_key_id'] if attributes[:'master_key_id']

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

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] shipping_preference Object to be assigned
    def shipping_preference=(shipping_preference)
      raise "Invalid value for 'shipping_preference': this must be one of the values in SHIPPING_PREFERENCE_ENUM." if shipping_preference && !SHIPPING_PREFERENCE_ENUM.include?(shipping_preference)

      @shipping_preference = shipping_preference
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] lifecycle_state Object to be assigned
    def lifecycle_state=(lifecycle_state)
      raise "Invalid value for 'lifecycle_state': this must be one of the values in LIFECYCLE_STATE_ENUM." if lifecycle_state && !LIFECYCLE_STATE_ENUM.include?(lifecycle_state)

      @lifecycle_state = lifecycle_state
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] enclosure_type Object to be assigned
    def enclosure_type=(enclosure_type)
      raise "Invalid value for 'enclosure_type': this must be one of the values in ENCLOSURE_TYPE_ENUM." if enclosure_type && !ENCLOSURE_TYPE_ENUM.include?(enclosure_type)

      @enclosure_type = enclosure_type
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize, Metrics/PerceivedComplexity, Layout/EmptyLines


    # Checks equality by comparing each attribute.
    # @param [Object] other the other object to be compared
    def ==(other)
      return true if equal?(other)

      self.class == other.class &&
        display_name == other.display_name &&
        compartment_id == other.compartment_id &&
        shape == other.shape &&
        customer_shipping_address == other.customer_shipping_address &&
        node_workloads == other.node_workloads &&
        super_user_password == other.super_user_password &&
        unlock_passphrase == other.unlock_passphrase &&
        point_of_contact == other.point_of_contact &&
        point_of_contact_phone_number == other.point_of_contact_phone_number &&
        shipping_preference == other.shipping_preference &&
        shipping_vendor == other.shipping_vendor &&
        time_pickup_expected == other.time_pickup_expected &&
        public_key == other.public_key &&
        time_return_window_starts == other.time_return_window_starts &&
        time_return_window_ends == other.time_return_window_ends &&
        lifecycle_state == other.lifecycle_state &&
        enclosure_type == other.enclosure_type &&
        lifecycle_state_details == other.lifecycle_state_details &&
        serial_number == other.serial_number &&
        oracle_shipping_tracking_url == other.oracle_shipping_tracking_url &&
        is_import_requested == other.is_import_requested &&
        import_compartment_id == other.import_compartment_id &&
        import_file_bucket == other.import_file_bucket &&
        data_validation_code == other.data_validation_code &&
        master_key_id == other.master_key_id &&
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
      [display_name, compartment_id, shape, customer_shipping_address, node_workloads, super_user_password, unlock_passphrase, point_of_contact, point_of_contact_phone_number, shipping_preference, shipping_vendor, time_pickup_expected, public_key, time_return_window_starts, time_return_window_ends, lifecycle_state, enclosure_type, lifecycle_state_details, serial_number, oracle_shipping_tracking_url, is_import_requested, import_compartment_id, import_file_bucket, data_validation_code, master_key_id, freeform_tags, defined_tags, system_tags].hash
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
