# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Onesubscription
    # Module containing models for requests made to, and responses received from,
    # OCI Onesubscription services
    module Models
    end
  end
end

# Require models
require 'oci/onesubscription/models/aggregated_computed_usage_summary'
require 'oci/onesubscription/models/billing_schedule_product'
require 'oci/onesubscription/models/billing_schedule_summary'
require 'oci/onesubscription/models/commitment'
require 'oci/onesubscription/models/commitment_service'
require 'oci/onesubscription/models/commitment_summary'
require 'oci/onesubscription/models/computed_usage'
require 'oci/onesubscription/models/computed_usage_aggregation'
require 'oci/onesubscription/models/computed_usage_product'
require 'oci/onesubscription/models/computed_usage_summary'
require 'oci/onesubscription/models/invoice_line_summary'
require 'oci/onesubscription/models/invoice_summary'
require 'oci/onesubscription/models/invoiceline_computed_usage_summary'
require 'oci/onesubscription/models/invoicing_address'
require 'oci/onesubscription/models/invoicing_business_partner'
require 'oci/onesubscription/models/invoicing_currency'
require 'oci/onesubscription/models/invoicing_location'
require 'oci/onesubscription/models/invoicing_organization'
require 'oci/onesubscription/models/invoicing_payment_term'
require 'oci/onesubscription/models/invoicing_product'
require 'oci/onesubscription/models/invoicing_user'
require 'oci/onesubscription/models/organization_subscription_summary'
require 'oci/onesubscription/models/orgnization_subs_currency'
require 'oci/onesubscription/models/rate_card_product'
require 'oci/onesubscription/models/rate_card_summary'
require 'oci/onesubscription/models/rate_card_tier'
require 'oci/onesubscription/models/subscribed_service'
require 'oci/onesubscription/models/subscribed_service_address'
require 'oci/onesubscription/models/subscribed_service_business_partner'
require 'oci/onesubscription/models/subscribed_service_location'
require 'oci/onesubscription/models/subscribed_service_payment_term'
require 'oci/onesubscription/models/subscribed_service_summary'
require 'oci/onesubscription/models/subscribed_service_user'
require 'oci/onesubscription/models/subscription_currency'
require 'oci/onesubscription/models/subscription_product'
require 'oci/onesubscription/models/subscription_subscribed_service'
require 'oci/onesubscription/models/subscription_summary'

# Require generated clients
require 'oci/onesubscription/billing_schedule_client'
require 'oci/onesubscription/commitment_client'
require 'oci/onesubscription/computed_usage_client'
require 'oci/onesubscription/invoice_summary_client'
require 'oci/onesubscription/organization_subscription_client'
require 'oci/onesubscription/ratecard_client'
require 'oci/onesubscription/subscribed_service_client'
require 'oci/onesubscription/subscription_client'

# Require service utilities
require 'oci/onesubscription/util'
