# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OsubUsage
    # Module containing models for requests made to, and responses received from,
    # OCI OsubUsage services
    module Models
    end
  end
end

# Require models
require 'oci/osub_usage/models/computed_usage'
require 'oci/osub_usage/models/computed_usage_aggregated_summary'
require 'oci/osub_usage/models/computed_usage_aggregation'
require 'oci/osub_usage/models/computed_usage_summary'
require 'oci/osub_usage/models/product'

# Require generated clients
require 'oci/osub_usage/computed_usage_client'

# Require service utilities
require 'oci/osub_usage/util'
