# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Optimizer
    # Module containing models for requests made to, and responses received from,
    # OCI Optimizer services
    module Models
    end
  end
end

# Require models
require 'oci/optimizer/models/action'
require 'oci/optimizer/models/action_type'
require 'oci/optimizer/models/bulk_apply_recommendations_details'
require 'oci/optimizer/models/bulk_apply_resource_action'
require 'oci/optimizer/models/category'
require 'oci/optimizer/models/category_collection'
require 'oci/optimizer/models/category_summary'
require 'oci/optimizer/models/create_profile_details'
require 'oci/optimizer/models/enrollment_status'
require 'oci/optimizer/models/enrollment_status_collection'
require 'oci/optimizer/models/enrollment_status_summary'
require 'oci/optimizer/models/evaluated_metric'
require 'oci/optimizer/models/history_collection'
require 'oci/optimizer/models/history_summary'
require 'oci/optimizer/models/importance'
require 'oci/optimizer/models/level_configuration'
require 'oci/optimizer/models/levels_configuration'
require 'oci/optimizer/models/lifecycle_state'
require 'oci/optimizer/models/operation_status'
require 'oci/optimizer/models/operation_type'
require 'oci/optimizer/models/optimizer_enrollment_status'
require 'oci/optimizer/models/profile'
require 'oci/optimizer/models/profile_collection'
require 'oci/optimizer/models/profile_level_collection'
require 'oci/optimizer/models/profile_level_summary'
require 'oci/optimizer/models/profile_summary'
require 'oci/optimizer/models/query_details'
require 'oci/optimizer/models/queryable_field_collection'
require 'oci/optimizer/models/queryable_field_summary'
require 'oci/optimizer/models/recommendation'
require 'oci/optimizer/models/recommendation_collection'
require 'oci/optimizer/models/recommendation_count'
require 'oci/optimizer/models/recommendation_strategy_collection'
require 'oci/optimizer/models/recommendation_strategy_summary'
require 'oci/optimizer/models/recommendation_summary'
require 'oci/optimizer/models/resource_action'
require 'oci/optimizer/models/resource_action_collection'
require 'oci/optimizer/models/resource_action_summary'
require 'oci/optimizer/models/resource_count'
require 'oci/optimizer/models/sort_order'
require 'oci/optimizer/models/status'
require 'oci/optimizer/models/strategy'
require 'oci/optimizer/models/strategy_parameter'
require 'oci/optimizer/models/strategy_parameter_type'
require 'oci/optimizer/models/supported_level'
require 'oci/optimizer/models/supported_levels'
require 'oci/optimizer/models/tag_value_type'
require 'oci/optimizer/models/target_compartments'
require 'oci/optimizer/models/target_tag'
require 'oci/optimizer/models/target_tags'
require 'oci/optimizer/models/update_enrollment_status_details'
require 'oci/optimizer/models/update_profile_details'
require 'oci/optimizer/models/update_recommendation_details'
require 'oci/optimizer/models/update_resource_action_details'
require 'oci/optimizer/models/work_request'
require 'oci/optimizer/models/work_request_action_type'
require 'oci/optimizer/models/work_request_collection'
require 'oci/optimizer/models/work_request_error'
require 'oci/optimizer/models/work_request_error_collection'
require 'oci/optimizer/models/work_request_log_entry'
require 'oci/optimizer/models/work_request_log_entry_collection'
require 'oci/optimizer/models/work_request_resource'
require 'oci/optimizer/models/work_request_resource_metadata_key'

# Require generated clients
require 'oci/optimizer/optimizer_client'
require 'oci/optimizer/optimizer_client_composite_operations'

# Require service utilities
require 'oci/optimizer/util'
