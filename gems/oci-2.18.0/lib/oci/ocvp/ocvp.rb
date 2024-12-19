# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Ocvp
    # Module containing models for requests made to, and responses received from,
    # OCI Ocvp services
    module Models
    end
  end
end

# Require models
require 'oci/ocvp/models/action_types'
require 'oci/ocvp/models/change_sddc_compartment_details'
require 'oci/ocvp/models/create_esxi_host_details'
require 'oci/ocvp/models/create_sddc_details'
require 'oci/ocvp/models/downgrade_hcx_details'
require 'oci/ocvp/models/esxi_host'
require 'oci/ocvp/models/esxi_host_collection'
require 'oci/ocvp/models/esxi_host_summary'
require 'oci/ocvp/models/hcx_license_status'
require 'oci/ocvp/models/hcx_license_summary'
require 'oci/ocvp/models/lifecycle_states'
require 'oci/ocvp/models/operation_status'
require 'oci/ocvp/models/operation_types'
require 'oci/ocvp/models/sddc'
require 'oci/ocvp/models/sddc_collection'
require 'oci/ocvp/models/sddc_summary'
require 'oci/ocvp/models/sddc_types'
require 'oci/ocvp/models/sku'
require 'oci/ocvp/models/sort_orders'
require 'oci/ocvp/models/supported_host_shape_collection'
require 'oci/ocvp/models/supported_host_shape_summary'
require 'oci/ocvp/models/supported_sku_summary'
require 'oci/ocvp/models/supported_sku_summary_collection'
require 'oci/ocvp/models/supported_vmware_software_version_collection'
require 'oci/ocvp/models/supported_vmware_software_version_summary'
require 'oci/ocvp/models/update_esxi_host_details'
require 'oci/ocvp/models/update_sddc_details'
require 'oci/ocvp/models/work_request'
require 'oci/ocvp/models/work_request_collection'
require 'oci/ocvp/models/work_request_error'
require 'oci/ocvp/models/work_request_error_collection'
require 'oci/ocvp/models/work_request_log_entry'
require 'oci/ocvp/models/work_request_log_entry_collection'
require 'oci/ocvp/models/work_request_resource'

# Require generated clients
require 'oci/ocvp/esxi_host_client'
require 'oci/ocvp/esxi_host_client_composite_operations'
require 'oci/ocvp/sddc_client'
require 'oci/ocvp/sddc_client_composite_operations'
require 'oci/ocvp/work_request_client'

# Require service utilities
require 'oci/ocvp/util'
