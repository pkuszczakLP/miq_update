# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Waf
    # Module containing models for requests made to, and responses received from,
    # OCI Waf services
    module Models
    end
  end
end

# Require models
require 'oci/waf/models/access_control_rule'
require 'oci/waf/models/action'
require 'oci/waf/models/allow_action'
require 'oci/waf/models/backend_type'
require 'oci/waf/models/change_network_address_list_compartment_details'
require 'oci/waf/models/change_resource_compartment_details'
require 'oci/waf/models/change_web_app_firewall_compartment_details'
require 'oci/waf/models/change_web_app_firewall_policy_compartment_details'
require 'oci/waf/models/check_action'
require 'oci/waf/models/collaborative_capability_weight'
require 'oci/waf/models/collaborative_capability_weight_override'
require 'oci/waf/models/create_network_address_list_addresses_details'
require 'oci/waf/models/create_network_address_list_details'
require 'oci/waf/models/create_network_address_list_vcn_addresses_details'
require 'oci/waf/models/create_web_app_firewall_details'
require 'oci/waf/models/create_web_app_firewall_load_balancer_details'
require 'oci/waf/models/create_web_app_firewall_policy_details'
require 'oci/waf/models/http_response_body'
require 'oci/waf/models/network_address_list'
require 'oci/waf/models/network_address_list_addresses'
require 'oci/waf/models/network_address_list_addresses_summary'
require 'oci/waf/models/network_address_list_collection'
require 'oci/waf/models/network_address_list_summary'
require 'oci/waf/models/network_address_list_vcn_addresses'
require 'oci/waf/models/network_address_list_vcn_addresses_summary'
require 'oci/waf/models/private_addresses'
require 'oci/waf/models/protection_capability'
require 'oci/waf/models/protection_capability_collection'
require 'oci/waf/models/protection_capability_exclusions'
require 'oci/waf/models/protection_capability_group_tag_collection'
require 'oci/waf/models/protection_capability_group_tag_summary'
require 'oci/waf/models/protection_capability_settings'
require 'oci/waf/models/protection_capability_summary'
require 'oci/waf/models/protection_rule'
require 'oci/waf/models/request_access_control'
require 'oci/waf/models/request_protection'
require 'oci/waf/models/request_rate_limiting'
require 'oci/waf/models/request_rate_limiting_configuration'
require 'oci/waf/models/request_rate_limiting_rule'
require 'oci/waf/models/response_access_control'
require 'oci/waf/models/response_header'
require 'oci/waf/models/response_protection'
require 'oci/waf/models/return_http_response_action'
require 'oci/waf/models/sort_order'
require 'oci/waf/models/static_text_http_response_body'
require 'oci/waf/models/update_network_address_list_addresses_details'
require 'oci/waf/models/update_network_address_list_details'
require 'oci/waf/models/update_network_address_list_vcn_addresses_details'
require 'oci/waf/models/update_web_app_firewall_details'
require 'oci/waf/models/update_web_app_firewall_policy_details'
require 'oci/waf/models/web_app_firewall'
require 'oci/waf/models/web_app_firewall_collection'
require 'oci/waf/models/web_app_firewall_load_balancer'
require 'oci/waf/models/web_app_firewall_load_balancer_summary'
require 'oci/waf/models/web_app_firewall_policy'
require 'oci/waf/models/web_app_firewall_policy_collection'
require 'oci/waf/models/web_app_firewall_policy_rule'
require 'oci/waf/models/web_app_firewall_policy_summary'
require 'oci/waf/models/web_app_firewall_summary'
require 'oci/waf/models/work_request'
require 'oci/waf/models/work_request_collection'
require 'oci/waf/models/work_request_error'
require 'oci/waf/models/work_request_error_collection'
require 'oci/waf/models/work_request_log_entry'
require 'oci/waf/models/work_request_log_entry_collection'
require 'oci/waf/models/work_request_resource'

# Require generated clients
require 'oci/waf/waf_client'
require 'oci/waf/waf_client_composite_operations'

# Require service utilities
require 'oci/waf/util'
