# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Ons
    # Module containing models for requests made to, and responses received from,
    # OCI Ons services
    module Models
    end
  end
end

# Require models
require 'oci/ons/models/backoff_retry_policy'
require 'oci/ons/models/change_compartment_details'
require 'oci/ons/models/confirmation_result'
require 'oci/ons/models/create_subscription_details'
require 'oci/ons/models/create_topic_details'
require 'oci/ons/models/delivery_policy'
require 'oci/ons/models/message_details'
require 'oci/ons/models/notification_topic'
require 'oci/ons/models/notification_topic_summary'
require 'oci/ons/models/publish_result'
require 'oci/ons/models/subscription'
require 'oci/ons/models/subscription_summary'
require 'oci/ons/models/topic_attributes_details'
require 'oci/ons/models/update_subscription_details'

# Require generated clients
require 'oci/ons/notification_control_plane_client'
require 'oci/ons/notification_data_plane_client'
require 'oci/ons/notification_data_plane_client_composite_operations'

# Require service utilities
require 'oci/ons/util'
