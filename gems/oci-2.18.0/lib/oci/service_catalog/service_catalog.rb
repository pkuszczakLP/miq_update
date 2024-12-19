# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ServiceCatalog
    # Module containing models for requests made to, and responses received from,
    # OCI ServiceCatalog services
    module Models
    end
  end
end

# Require models
require 'oci/service_catalog/models/action_type'
require 'oci/service_catalog/models/application_collection'
require 'oci/service_catalog/models/application_summary'
require 'oci/service_catalog/models/bulk_replace_service_catalog_associations_details'
require 'oci/service_catalog/models/change_private_application_compartment_details'
require 'oci/service_catalog/models/change_service_catalog_compartment_details'
require 'oci/service_catalog/models/create_private_application_details'
require 'oci/service_catalog/models/create_private_application_package'
require 'oci/service_catalog/models/create_private_application_stack_package'
require 'oci/service_catalog/models/create_service_catalog_association_details'
require 'oci/service_catalog/models/create_service_catalog_details'
require 'oci/service_catalog/models/error_entity'
require 'oci/service_catalog/models/operation_status'
require 'oci/service_catalog/models/operation_type'
require 'oci/service_catalog/models/package_type_enum'
require 'oci/service_catalog/models/pricing_type_enum'
require 'oci/service_catalog/models/private_application'
require 'oci/service_catalog/models/private_application_collection'
require 'oci/service_catalog/models/private_application_package'
require 'oci/service_catalog/models/private_application_package_collection'
require 'oci/service_catalog/models/private_application_package_summary'
require 'oci/service_catalog/models/private_application_stack_package'
require 'oci/service_catalog/models/private_application_summary'
require 'oci/service_catalog/models/publisher_summary'
require 'oci/service_catalog/models/service_catalog'
require 'oci/service_catalog/models/service_catalog_association'
require 'oci/service_catalog/models/service_catalog_association_collection'
require 'oci/service_catalog/models/service_catalog_association_summary'
require 'oci/service_catalog/models/service_catalog_collection'
require 'oci/service_catalog/models/service_catalog_summary'
require 'oci/service_catalog/models/update_private_application_details'
require 'oci/service_catalog/models/update_service_catalog_details'
require 'oci/service_catalog/models/upload_data'
require 'oci/service_catalog/models/work_request'
require 'oci/service_catalog/models/work_request_error'
require 'oci/service_catalog/models/work_request_error_collection'
require 'oci/service_catalog/models/work_request_log_entry'
require 'oci/service_catalog/models/work_request_log_entry_collection'
require 'oci/service_catalog/models/work_request_resource'
require 'oci/service_catalog/models/work_request_summary'
require 'oci/service_catalog/models/work_request_summary_collection'

# Require generated clients
require 'oci/service_catalog/service_catalog_client'
require 'oci/service_catalog/service_catalog_client_composite_operations'

# Require service utilities
require 'oci/service_catalog/util'
