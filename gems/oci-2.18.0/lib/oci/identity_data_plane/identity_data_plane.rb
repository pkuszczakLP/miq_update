# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module IdentityDataPlane
    # Module containing models for requests made to, and responses received from,
    # OCI IdentityDataPlane services
    module Models
    end
  end
end

# Require models
require 'oci/identity_data_plane/models/accessible_compartment_request'
require 'oci/identity_data_plane/models/accessible_compartment_response'
require 'oci/identity_data_plane/models/association_authorization_request'
require 'oci/identity_data_plane/models/auth_service_user'
require 'oci/identity_data_plane/models/authenticate_client_details'
require 'oci/identity_data_plane/models/authenticate_client_result'
require 'oci/identity_data_plane/models/authenticate_user_result'
require 'oci/identity_data_plane/models/authentication_policy'
require 'oci/identity_data_plane/models/authentication_principal'
require 'oci/identity_data_plane/models/authentication_request'
require 'oci/identity_data_plane/models/authorization_request'
require 'oci/identity_data_plane/models/bad_user_state_authenticate_user_result'
require 'oci/identity_data_plane/models/claim'
require 'oci/identity_data_plane/models/client_credentials_response'
require 'oci/identity_data_plane/models/common_principal'
require 'oci/identity_data_plane/models/compartment'
require 'oci/identity_data_plane/models/compartment_metadata'
require 'oci/identity_data_plane/models/context_variable'
require 'oci/identity_data_plane/models/cost_tracking_tag'
require 'oci/identity_data_plane/models/credential_authenticator_info'
require 'oci/identity_data_plane/models/derived_key_response'
require 'oci/identity_data_plane/models/entity_status'
require 'oci/identity_data_plane/models/filter_group_membership_details'
require 'oci/identity_data_plane/models/filter_group_membership_result'
require 'oci/identity_data_plane/models/generate_scoped_access_token_details'
require 'oci/identity_data_plane/models/identity_provider'
require 'oci/identity_data_plane/models/jwk'
require 'oci/identity_data_plane/models/on_behalf_of_request'
require 'oci/identity_data_plane/models/password_policy'
require 'oci/identity_data_plane/models/password_reset_authentication_request'
require 'oci/identity_data_plane/models/permission'
require 'oci/identity_data_plane/models/permission_context'
require 'oci/identity_data_plane/models/principal'
require 'oci/identity_data_plane/models/refresh_request'
require 'oci/identity_data_plane/models/resource_principal_session_token_request'
require 'oci/identity_data_plane/models/security_token'
require 'oci/identity_data_plane/models/tenant'
require 'oci/identity_data_plane/models/tenant_not_found_authenticate_user_result'
require 'oci/identity_data_plane/models/thick_authorization_response'
require 'oci/identity_data_plane/models/thin_association_authorization_response'
require 'oci/identity_data_plane/models/thin_authorization_response'
require 'oci/identity_data_plane/models/user'
require 'oci/identity_data_plane/models/user_not_found_authenticate_user_result'
require 'oci/identity_data_plane/models/valid_authenticate_user_result'
require 'oci/identity_data_plane/models/x509_federation_request'

# Require generated clients
require 'oci/identity_data_plane/dataplane_client'

# Require service utilities
require 'oci/identity_data_plane/util'
