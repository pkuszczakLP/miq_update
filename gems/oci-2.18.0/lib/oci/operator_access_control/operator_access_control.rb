# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OperatorAccessControl
    # Module containing models for requests made to, and responses received from,
    # OCI OperatorAccessControl services
    module Models
    end
  end
end

# Require models
require 'oci/operator_access_control/models/access_request'
require 'oci/operator_access_control/models/access_request_collection'
require 'oci/operator_access_control/models/access_request_history_collection'
require 'oci/operator_access_control/models/access_request_history_summary'
require 'oci/operator_access_control/models/access_request_lifecycle_states'
require 'oci/operator_access_control/models/access_request_severities'
require 'oci/operator_access_control/models/access_request_summary'
require 'oci/operator_access_control/models/approve_access_request_details'
require 'oci/operator_access_control/models/change_operator_control_assignment_compartment_details'
require 'oci/operator_access_control/models/change_operator_control_compartment_details'
require 'oci/operator_access_control/models/create_operator_control_assignment_details'
require 'oci/operator_access_control/models/create_operator_control_details'
require 'oci/operator_access_control/models/infrastrcuture_layers'
require 'oci/operator_access_control/models/interaction_collection'
require 'oci/operator_access_control/models/interaction_request_details'
require 'oci/operator_access_control/models/interaction_summary'
require 'oci/operator_access_control/models/operator_action'
require 'oci/operator_access_control/models/operator_action_categories'
require 'oci/operator_access_control/models/operator_action_collection'
require 'oci/operator_access_control/models/operator_action_lifecycle_states'
require 'oci/operator_access_control/models/operator_action_properties'
require 'oci/operator_access_control/models/operator_action_summary'
require 'oci/operator_access_control/models/operator_control'
require 'oci/operator_access_control/models/operator_control_assignment'
require 'oci/operator_access_control/models/operator_control_assignment_collection'
require 'oci/operator_access_control/models/operator_control_assignment_lifecycle_states'
require 'oci/operator_access_control/models/operator_control_assignment_summary'
require 'oci/operator_access_control/models/operator_control_collection'
require 'oci/operator_access_control/models/operator_control_lifecycle_states'
require 'oci/operator_access_control/models/operator_control_summary'
require 'oci/operator_access_control/models/reject_access_request_details'
require 'oci/operator_access_control/models/resource_types'
require 'oci/operator_access_control/models/review_access_request_details'
require 'oci/operator_access_control/models/revoke_access_request_details'
require 'oci/operator_access_control/models/sort_orders'
require 'oci/operator_access_control/models/update_operator_control_assignment_details'
require 'oci/operator_access_control/models/update_operator_control_details'

# Require generated clients
require 'oci/operator_access_control/access_requests_client'
require 'oci/operator_access_control/access_requests_client_composite_operations'
require 'oci/operator_access_control/operator_actions_client'
require 'oci/operator_access_control/operator_control_client'
require 'oci/operator_access_control/operator_control_client_composite_operations'
require 'oci/operator_access_control/operator_control_assignment_client'
require 'oci/operator_access_control/operator_control_assignment_client_composite_operations'

# Require service utilities
require 'oci/operator_access_control/util'
