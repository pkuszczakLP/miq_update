# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ManagementAgent
    # Module containing models for requests made to, and responses received from,
    # OCI ManagementAgent services
    module Models
    end
  end
end

# Require models
require 'oci/management_agent/models/action_types'
require 'oci/management_agent/models/architecture_types'
require 'oci/management_agent/models/auto_upgradable_config'
require 'oci/management_agent/models/availability_history_summary'
require 'oci/management_agent/models/availability_status'
require 'oci/management_agent/models/create_management_agent_install_key_details'
require 'oci/management_agent/models/datatypes'
require 'oci/management_agent/models/deploy_plugins_details'
require 'oci/management_agent/models/edit_modes'
require 'oci/management_agent/models/install_types'
require 'oci/management_agent/models/lifecycle_states'
require 'oci/management_agent/models/management_agent'
require 'oci/management_agent/models/management_agent_aggregation'
require 'oci/management_agent/models/management_agent_aggregation_collection'
require 'oci/management_agent/models/management_agent_aggregation_dimensions'
require 'oci/management_agent/models/management_agent_error'
require 'oci/management_agent/models/management_agent_group_by'
require 'oci/management_agent/models/management_agent_image'
require 'oci/management_agent/models/management_agent_image_summary'
require 'oci/management_agent/models/management_agent_install_key'
require 'oci/management_agent/models/management_agent_install_key_summary'
require 'oci/management_agent/models/management_agent_plugin'
require 'oci/management_agent/models/management_agent_plugin_aggregation'
require 'oci/management_agent/models/management_agent_plugin_aggregation_collection'
require 'oci/management_agent/models/management_agent_plugin_aggregation_dimensions'
require 'oci/management_agent/models/management_agent_plugin_details'
require 'oci/management_agent/models/management_agent_plugin_group_by'
require 'oci/management_agent/models/management_agent_plugin_summary'
require 'oci/management_agent/models/management_agent_summary'
require 'oci/management_agent/models/operation_status'
require 'oci/management_agent/models/operation_types'
require 'oci/management_agent/models/package_types'
require 'oci/management_agent/models/platform_types'
require 'oci/management_agent/models/set_auto_upgradable_config_details'
require 'oci/management_agent/models/update_management_agent_details'
require 'oci/management_agent/models/update_management_agent_install_key_details'
require 'oci/management_agent/models/work_delivery_status'
require 'oci/management_agent/models/work_request'
require 'oci/management_agent/models/work_request_error'
require 'oci/management_agent/models/work_request_log_entry'
require 'oci/management_agent/models/work_request_resource'
require 'oci/management_agent/models/work_request_summary'
require 'oci/management_agent/models/work_submission_key'

# Require generated clients
require 'oci/management_agent/management_agent_client'
require 'oci/management_agent/management_agent_client_composite_operations'

# Require service utilities
require 'oci/management_agent/util'
