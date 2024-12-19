# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Waa
    # Module containing models for requests made to, and responses received from,
    # OCI Waa services
    module Models
    end
  end
end

# Require models
require 'oci/waa/models/backend_type'
require 'oci/waa/models/change_resource_compartment_details'
require 'oci/waa/models/change_web_app_acceleration_compartment_details'
require 'oci/waa/models/change_web_app_acceleration_policy_compartment_details'
require 'oci/waa/models/create_web_app_acceleration_details'
require 'oci/waa/models/create_web_app_acceleration_load_balancer_details'
require 'oci/waa/models/create_web_app_acceleration_policy_details'
require 'oci/waa/models/gzip_compression_policy'
require 'oci/waa/models/purge_entire_web_app_acceleration_cache_details'
require 'oci/waa/models/purge_web_app_acceleration_cache_details'
require 'oci/waa/models/response_caching_policy'
require 'oci/waa/models/response_compression_policy'
require 'oci/waa/models/sort_order'
require 'oci/waa/models/update_web_app_acceleration_details'
require 'oci/waa/models/update_web_app_acceleration_policy_details'
require 'oci/waa/models/web_app_acceleration'
require 'oci/waa/models/web_app_acceleration_collection'
require 'oci/waa/models/web_app_acceleration_load_balancer'
require 'oci/waa/models/web_app_acceleration_load_balancer_summary'
require 'oci/waa/models/web_app_acceleration_policy'
require 'oci/waa/models/web_app_acceleration_policy_collection'
require 'oci/waa/models/web_app_acceleration_policy_summary'
require 'oci/waa/models/web_app_acceleration_summary'
require 'oci/waa/models/work_request'
require 'oci/waa/models/work_request_collection'
require 'oci/waa/models/work_request_error'
require 'oci/waa/models/work_request_error_collection'
require 'oci/waa/models/work_request_log_entry'
require 'oci/waa/models/work_request_log_entry_collection'
require 'oci/waa/models/work_request_resource'

# Require generated clients
require 'oci/waa/waa_client'
require 'oci/waa/waa_client_composite_operations'
require 'oci/waa/work_request_client'

# Require service utilities
require 'oci/waa/util'
