# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Vault
    # Module containing models for requests made to, and responses received from,
    # OCI Vault services
    module Models
    end
  end
end

# Require models
require 'oci/vault/models/base64_secret_content_details'
require 'oci/vault/models/change_secret_compartment_details'
require 'oci/vault/models/create_secret_details'
require 'oci/vault/models/schedule_secret_deletion_details'
require 'oci/vault/models/schedule_secret_version_deletion_details'
require 'oci/vault/models/secret'
require 'oci/vault/models/secret_content_details'
require 'oci/vault/models/secret_expiry_rule'
require 'oci/vault/models/secret_reuse_rule'
require 'oci/vault/models/secret_rule'
require 'oci/vault/models/secret_summary'
require 'oci/vault/models/secret_version'
require 'oci/vault/models/secret_version_summary'
require 'oci/vault/models/update_secret_details'

# Require generated clients
require 'oci/vault/vaults_client'
require 'oci/vault/vaults_client_composite_operations'

# Require service utilities
require 'oci/vault/util'
