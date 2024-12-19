# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module GovernanceRulesControlPlane
    # Module containing models for requests made to, and responses received from,
    # OCI GovernanceRulesControlPlane services
    module Models
    end
  end
end

# Require models
require 'oci/governance_rules_control_plane/models/action_type'
require 'oci/governance_rules_control_plane/models/allowed_regions_template'
require 'oci/governance_rules_control_plane/models/association'
require 'oci/governance_rules_control_plane/models/base_tag_definition_validator'
require 'oci/governance_rules_control_plane/models/create_governance_rule_details'
require 'oci/governance_rules_control_plane/models/create_inclusion_criterion_details'
require 'oci/governance_rules_control_plane/models/creation_option'
require 'oci/governance_rules_control_plane/models/default_tag_definition_validator'
require 'oci/governance_rules_control_plane/models/enforced_governance_rule'
require 'oci/governance_rules_control_plane/models/enforced_governance_rule_collection'
require 'oci/governance_rules_control_plane/models/enforced_governance_rule_summary'
require 'oci/governance_rules_control_plane/models/enum_tag_definition_validator'
require 'oci/governance_rules_control_plane/models/governance_rule'
require 'oci/governance_rules_control_plane/models/governance_rule_collection'
require 'oci/governance_rules_control_plane/models/governance_rule_lifecycle_state'
require 'oci/governance_rules_control_plane/models/governance_rule_summary'
require 'oci/governance_rules_control_plane/models/governance_rule_type'
require 'oci/governance_rules_control_plane/models/inclusion_criterion'
require 'oci/governance_rules_control_plane/models/inclusion_criterion_collection'
require 'oci/governance_rules_control_plane/models/inclusion_criterion_summary'
require 'oci/governance_rules_control_plane/models/operation_status'
require 'oci/governance_rules_control_plane/models/operation_type'
require 'oci/governance_rules_control_plane/models/quota_template'
require 'oci/governance_rules_control_plane/models/sort_order'
require 'oci/governance_rules_control_plane/models/tag'
require 'oci/governance_rules_control_plane/models/tag_default'
require 'oci/governance_rules_control_plane/models/tag_template'
require 'oci/governance_rules_control_plane/models/template'
require 'oci/governance_rules_control_plane/models/tenancy_association'
require 'oci/governance_rules_control_plane/models/tenancy_attachment'
require 'oci/governance_rules_control_plane/models/tenancy_attachment_collection'
require 'oci/governance_rules_control_plane/models/tenancy_attachment_summary'
require 'oci/governance_rules_control_plane/models/update_governance_rule_details'
require 'oci/governance_rules_control_plane/models/work_request'
require 'oci/governance_rules_control_plane/models/work_request_error'
require 'oci/governance_rules_control_plane/models/work_request_error_collection'
require 'oci/governance_rules_control_plane/models/work_request_log_entry'
require 'oci/governance_rules_control_plane/models/work_request_log_entry_collection'
require 'oci/governance_rules_control_plane/models/work_request_resource'
require 'oci/governance_rules_control_plane/models/work_request_resource_metadata_key'
require 'oci/governance_rules_control_plane/models/work_request_summary'
require 'oci/governance_rules_control_plane/models/work_request_summary_collection'

# Require generated clients
require 'oci/governance_rules_control_plane/governance_rule_client'
require 'oci/governance_rules_control_plane/governance_rule_client_composite_operations'
require 'oci/governance_rules_control_plane/work_request_client'

# Require service utilities
require 'oci/governance_rules_control_plane/util'
