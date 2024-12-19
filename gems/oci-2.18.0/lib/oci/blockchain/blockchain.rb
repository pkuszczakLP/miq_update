# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Blockchain
    # Module containing models for requests made to, and responses received from,
    # OCI Blockchain services
    module Models
    end
  end
end

# Require models
require 'oci/blockchain/models/availability_domain'
require 'oci/blockchain/models/blockchain_platform'
require 'oci/blockchain/models/blockchain_platform_by_hostname'
require 'oci/blockchain/models/blockchain_platform_collection'
require 'oci/blockchain/models/blockchain_platform_component_details'
require 'oci/blockchain/models/blockchain_platform_patch_collection'
require 'oci/blockchain/models/blockchain_platform_patch_summary'
require 'oci/blockchain/models/blockchain_platform_summary'
require 'oci/blockchain/models/change_blockchain_platform_compartment_details'
require 'oci/blockchain/models/create_blockchain_platform_details'
require 'oci/blockchain/models/create_osn_details'
require 'oci/blockchain/models/create_peer_details'
require 'oci/blockchain/models/metadata_details'
require 'oci/blockchain/models/modify_peer_details'
require 'oci/blockchain/models/ocpu_allocation_number_param'
require 'oci/blockchain/models/ocpu_utilization_info'
require 'oci/blockchain/models/osn'
require 'oci/blockchain/models/osn_collection'
require 'oci/blockchain/models/osn_summary'
require 'oci/blockchain/models/peer'
require 'oci/blockchain/models/peer_collection'
require 'oci/blockchain/models/peer_role'
require 'oci/blockchain/models/peer_summary'
require 'oci/blockchain/models/replica_details'
require 'oci/blockchain/models/scale_blockchain_platform_details'
require 'oci/blockchain/models/scale_storage_details'
require 'oci/blockchain/models/scaled_blockchain_platform_preview'
require 'oci/blockchain/models/scaled_platform_metering_preview'
require 'oci/blockchain/models/update_blockchain_platform_details'
require 'oci/blockchain/models/update_osn_details'
require 'oci/blockchain/models/update_peer_details'
require 'oci/blockchain/models/upgrade_blockchain_platform_details'
require 'oci/blockchain/models/work_request'
require 'oci/blockchain/models/work_request_collection'
require 'oci/blockchain/models/work_request_error'
require 'oci/blockchain/models/work_request_error_collection'
require 'oci/blockchain/models/work_request_log_entry'
require 'oci/blockchain/models/work_request_log_entry_collection'
require 'oci/blockchain/models/work_request_resource'
require 'oci/blockchain/models/work_request_resource_sub_type_detail'
require 'oci/blockchain/models/work_request_summary'

# Require generated clients
require 'oci/blockchain/blockchain_platform_client'
require 'oci/blockchain/blockchain_platform_client_composite_operations'

# Require service utilities
require 'oci/blockchain/util'