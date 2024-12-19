# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OsubSubscription
    # Module containing models for requests made to, and responses received from,
    # OCI OsubSubscription services
    module Models
    end
  end
end

# Require models
require 'oci/osub_subscription/models/commitment'
require 'oci/osub_subscription/models/commitment_detail'
require 'oci/osub_subscription/models/commitment_summary'
require 'oci/osub_subscription/models/currency'
require 'oci/osub_subscription/models/product'
require 'oci/osub_subscription/models/rate_card_summary'
require 'oci/osub_subscription/models/rate_card_tier'
require 'oci/osub_subscription/models/subscribed_service_summary'
require 'oci/osub_subscription/models/subscription_product'
require 'oci/osub_subscription/models/subscription_summary'

# Require generated clients
require 'oci/osub_subscription/commitment_client'
require 'oci/osub_subscription/ratecard_client'
require 'oci/osub_subscription/subscription_client'

# Require service utilities
require 'oci/osub_subscription/util'
