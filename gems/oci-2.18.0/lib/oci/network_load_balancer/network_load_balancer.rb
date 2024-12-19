# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module NetworkLoadBalancer
    # Module containing models for requests made to, and responses received from,
    # OCI NetworkLoadBalancer services
    module Models
    end
  end
end

# Require models
require 'oci/network_load_balancer/models/action_type'
require 'oci/network_load_balancer/models/backend'
require 'oci/network_load_balancer/models/backend_collection'
require 'oci/network_load_balancer/models/backend_details'
require 'oci/network_load_balancer/models/backend_health'
require 'oci/network_load_balancer/models/backend_set'
require 'oci/network_load_balancer/models/backend_set_collection'
require 'oci/network_load_balancer/models/backend_set_details'
require 'oci/network_load_balancer/models/backend_set_health'
require 'oci/network_load_balancer/models/backend_set_summary'
require 'oci/network_load_balancer/models/backend_summary'
require 'oci/network_load_balancer/models/change_network_load_balancer_compartment_details'
require 'oci/network_load_balancer/models/create_backend_details'
require 'oci/network_load_balancer/models/create_backend_set_details'
require 'oci/network_load_balancer/models/create_listener_details'
require 'oci/network_load_balancer/models/create_network_load_balancer_details'
require 'oci/network_load_balancer/models/hcs_infra_ip_version'
require 'oci/network_load_balancer/models/health_check_protocols'
require 'oci/network_load_balancer/models/health_check_result'
require 'oci/network_load_balancer/models/health_checker'
require 'oci/network_load_balancer/models/health_checker_details'
require 'oci/network_load_balancer/models/ip_address'
require 'oci/network_load_balancer/models/ip_version'
require 'oci/network_load_balancer/models/lifecycle_state'
require 'oci/network_load_balancer/models/listener'
require 'oci/network_load_balancer/models/listener_collection'
require 'oci/network_load_balancer/models/listener_details'
require 'oci/network_load_balancer/models/listener_protocols'
require 'oci/network_load_balancer/models/listener_summary'
require 'oci/network_load_balancer/models/network_load_balancer'
require 'oci/network_load_balancer/models/network_load_balancer_collection'
require 'oci/network_load_balancer/models/network_load_balancer_health'
require 'oci/network_load_balancer/models/network_load_balancer_health_collection'
require 'oci/network_load_balancer/models/network_load_balancer_health_summary'
require 'oci/network_load_balancer/models/network_load_balancer_summary'
require 'oci/network_load_balancer/models/network_load_balancers_policy_collection'
require 'oci/network_load_balancer/models/network_load_balancers_policy_summary'
require 'oci/network_load_balancer/models/network_load_balancers_protocol_collection'
require 'oci/network_load_balancer/models/network_load_balancers_protocol_summary'
require 'oci/network_load_balancer/models/network_load_balancing_policy'
require 'oci/network_load_balancer/models/nlb_ip_version'
require 'oci/network_load_balancer/models/operation_status'
require 'oci/network_load_balancer/models/operation_type'
require 'oci/network_load_balancer/models/reserved_ip'
require 'oci/network_load_balancer/models/sort_order'
require 'oci/network_load_balancer/models/update_backend_details'
require 'oci/network_load_balancer/models/update_backend_set_details'
require 'oci/network_load_balancer/models/update_health_checker_details'
require 'oci/network_load_balancer/models/update_listener_details'
require 'oci/network_load_balancer/models/update_network_load_balancer_details'
require 'oci/network_load_balancer/models/update_network_security_groups_details'
require 'oci/network_load_balancer/models/work_request'
require 'oci/network_load_balancer/models/work_request_collection'
require 'oci/network_load_balancer/models/work_request_error'
require 'oci/network_load_balancer/models/work_request_error_collection'
require 'oci/network_load_balancer/models/work_request_log_entry'
require 'oci/network_load_balancer/models/work_request_log_entry_collection'
require 'oci/network_load_balancer/models/work_request_resource'
require 'oci/network_load_balancer/models/work_request_summary'

# Require generated clients
require 'oci/network_load_balancer/network_load_balancer_client'
require 'oci/network_load_balancer/network_load_balancer_client_composite_operations'

# Require service utilities
require 'oci/network_load_balancer/util'
