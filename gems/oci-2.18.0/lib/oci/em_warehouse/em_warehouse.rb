# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module EmWarehouse
    # Module containing models for requests made to, and responses received from,
    # OCI EmWarehouse services
    module Models
    end
  end
end

# Require models
require 'oci/em_warehouse/models/action_type'
require 'oci/em_warehouse/models/change_em_warehouse_compartment_details'
require 'oci/em_warehouse/models/create_em_warehouse_details'
require 'oci/em_warehouse/models/em_instances_details'
require 'oci/em_warehouse/models/em_warehouse'
require 'oci/em_warehouse/models/em_warehouse_collection'
require 'oci/em_warehouse/models/em_warehouse_summary'
require 'oci/em_warehouse/models/etl_run_collection'
require 'oci/em_warehouse/models/etl_run_summary'
require 'oci/em_warehouse/models/operation_status'
require 'oci/em_warehouse/models/operation_type'
require 'oci/em_warehouse/models/resource_usage'
require 'oci/em_warehouse/models/sort_order'
require 'oci/em_warehouse/models/update_em_warehouse_details'
require 'oci/em_warehouse/models/work_request'
require 'oci/em_warehouse/models/work_request_error'
require 'oci/em_warehouse/models/work_request_error_collection'
require 'oci/em_warehouse/models/work_request_log_entry'
require 'oci/em_warehouse/models/work_request_log_entry_collection'
require 'oci/em_warehouse/models/work_request_resource'
require 'oci/em_warehouse/models/work_request_resource_metadata_key'
require 'oci/em_warehouse/models/work_request_summary'
require 'oci/em_warehouse/models/work_request_summary_collection'

# Require generated clients
require 'oci/em_warehouse/em_data_lake_client'
require 'oci/em_warehouse/em_data_lake_client_composite_operations'

# Require service utilities
require 'oci/em_warehouse/util'
