# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Nosql
    # Module containing models for requests made to, and responses received from,
    # OCI Nosql services
    module Models
    end
  end
end

# Require models
require 'oci/nosql/models/change_table_compartment_details'
require 'oci/nosql/models/column'
require 'oci/nosql/models/create_index_details'
require 'oci/nosql/models/create_table_details'
require 'oci/nosql/models/delete_row_result'
require 'oci/nosql/models/index'
require 'oci/nosql/models/index_collection'
require 'oci/nosql/models/index_key'
require 'oci/nosql/models/index_summary'
require 'oci/nosql/models/prepared_statement'
require 'oci/nosql/models/query_details'
require 'oci/nosql/models/query_result_collection'
require 'oci/nosql/models/request_usage'
require 'oci/nosql/models/row'
require 'oci/nosql/models/schema'
require 'oci/nosql/models/statement_summary'
require 'oci/nosql/models/table'
require 'oci/nosql/models/table_collection'
require 'oci/nosql/models/table_limits'
require 'oci/nosql/models/table_summary'
require 'oci/nosql/models/table_usage_collection'
require 'oci/nosql/models/table_usage_summary'
require 'oci/nosql/models/update_row_details'
require 'oci/nosql/models/update_row_result'
require 'oci/nosql/models/update_table_details'
require 'oci/nosql/models/work_request'
require 'oci/nosql/models/work_request_collection'
require 'oci/nosql/models/work_request_error'
require 'oci/nosql/models/work_request_error_collection'
require 'oci/nosql/models/work_request_log_entry'
require 'oci/nosql/models/work_request_log_entry_collection'
require 'oci/nosql/models/work_request_resource'
require 'oci/nosql/models/work_request_summary'

# Require generated clients
require 'oci/nosql/nosql_client'
require 'oci/nosql/nosql_client_composite_operations'

# Require service utilities
require 'oci/nosql/util'
