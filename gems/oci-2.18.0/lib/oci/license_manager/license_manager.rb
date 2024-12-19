# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module LicenseManager
    # Module containing models for requests made to, and responses received from,
    # OCI LicenseManager services
    module Models
    end
  end
end

# Require models
require 'oci/license_manager/models/bulk_upload_cell_info'
require 'oci/license_manager/models/bulk_upload_failed_record_info'
require 'oci/license_manager/models/bulk_upload_license_records_details'
require 'oci/license_manager/models/bulk_upload_response'
require 'oci/license_manager/models/bulk_upload_template'
require 'oci/license_manager/models/bulk_upload_validation_error_info'
require 'oci/license_manager/models/configuration'
require 'oci/license_manager/models/create_license_record_details'
require 'oci/license_manager/models/create_product_license_details'
require 'oci/license_manager/models/image_details'
require 'oci/license_manager/models/image_response'
require 'oci/license_manager/models/license_metric'
require 'oci/license_manager/models/license_record'
require 'oci/license_manager/models/license_record_collection'
require 'oci/license_manager/models/license_record_summary'
require 'oci/license_manager/models/license_unit'
require 'oci/license_manager/models/life_cycle_state'
require 'oci/license_manager/models/product'
require 'oci/license_manager/models/product_category'
require 'oci/license_manager/models/product_license'
require 'oci/license_manager/models/product_license_collection'
require 'oci/license_manager/models/product_license_consumer_collection'
require 'oci/license_manager/models/product_license_consumer_summary'
require 'oci/license_manager/models/product_license_summary'
require 'oci/license_manager/models/resource_unit'
require 'oci/license_manager/models/status'
require 'oci/license_manager/models/top_utilized_product_license_collection'
require 'oci/license_manager/models/top_utilized_product_license_summary'
require 'oci/license_manager/models/top_utilized_resource_collection'
require 'oci/license_manager/models/top_utilized_resource_summary'
require 'oci/license_manager/models/update_configuration_details'
require 'oci/license_manager/models/update_license_record_details'
require 'oci/license_manager/models/update_product_license_details'

# Require generated clients
require 'oci/license_manager/license_manager_client'
require 'oci/license_manager/license_manager_client_composite_operations'

# Require service utilities
require 'oci/license_manager/util'
