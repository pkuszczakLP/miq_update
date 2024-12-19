# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Secrets
    # Module containing models for requests made to, and responses received from,
    # OCI Secrets services
    module Models
    end
  end
end

# Require models
require 'oci/secrets/models/base64_secret_bundle_content_details'
require 'oci/secrets/models/secret_bundle'
require 'oci/secrets/models/secret_bundle_content_details'
require 'oci/secrets/models/secret_bundle_version_summary'

# Require generated clients
require 'oci/secrets/secrets_client'

# Require service utilities
require 'oci/secrets/util'
