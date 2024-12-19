# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CertificatesManagement
    # Module containing models for requests made to, and responses received from,
    # OCI CertificatesManagement services
    module Models
    end
  end
end

# Require models
require 'oci/certificates_management/models/association'
require 'oci/certificates_management/models/association_collection'
require 'oci/certificates_management/models/association_lifecycle_state'
require 'oci/certificates_management/models/association_summary'
require 'oci/certificates_management/models/association_type'
require 'oci/certificates_management/models/ca_bundle'
require 'oci/certificates_management/models/ca_bundle_collection'
require 'oci/certificates_management/models/ca_bundle_lifecycle_state'
require 'oci/certificates_management/models/ca_bundle_summary'
require 'oci/certificates_management/models/certificate'
require 'oci/certificates_management/models/certificate_authority'
require 'oci/certificates_management/models/certificate_authority_collection'
require 'oci/certificates_management/models/certificate_authority_config_type'
require 'oci/certificates_management/models/certificate_authority_issuance_expiry_rule'
require 'oci/certificates_management/models/certificate_authority_lifecycle_state'
require 'oci/certificates_management/models/certificate_authority_rule'
require 'oci/certificates_management/models/certificate_authority_summary'
require 'oci/certificates_management/models/certificate_authority_version'
require 'oci/certificates_management/models/certificate_authority_version_collection'
require 'oci/certificates_management/models/certificate_authority_version_summary'
require 'oci/certificates_management/models/certificate_collection'
require 'oci/certificates_management/models/certificate_config_type'
require 'oci/certificates_management/models/certificate_lifecycle_state'
require 'oci/certificates_management/models/certificate_profile_type'
require 'oci/certificates_management/models/certificate_renewal_rule'
require 'oci/certificates_management/models/certificate_revocation_list_details'
require 'oci/certificates_management/models/certificate_rule'
require 'oci/certificates_management/models/certificate_subject'
require 'oci/certificates_management/models/certificate_subject_alternative_name'
require 'oci/certificates_management/models/certificate_summary'
require 'oci/certificates_management/models/certificate_version'
require 'oci/certificates_management/models/certificate_version_collection'
require 'oci/certificates_management/models/certificate_version_summary'
require 'oci/certificates_management/models/change_ca_bundle_compartment_details'
require 'oci/certificates_management/models/change_certificate_authority_compartment_details'
require 'oci/certificates_management/models/change_certificate_compartment_details'
require 'oci/certificates_management/models/create_ca_bundle_details'
require 'oci/certificates_management/models/create_certificate_authority_config_details'
require 'oci/certificates_management/models/create_certificate_authority_details'
require 'oci/certificates_management/models/create_certificate_by_importing_config_details'
require 'oci/certificates_management/models/create_certificate_config_details'
require 'oci/certificates_management/models/create_certificate_details'
require 'oci/certificates_management/models/create_certificate_issued_by_internal_ca_config_details'
require 'oci/certificates_management/models/create_certificate_managed_externally_issued_by_internal_ca_config_details'
require 'oci/certificates_management/models/create_root_ca_by_generating_internally_config_details'
require 'oci/certificates_management/models/create_subordinate_ca_issued_by_internal_ca_config_details'
require 'oci/certificates_management/models/key_algorithm'
require 'oci/certificates_management/models/object_storage_bucket_config_details'
require 'oci/certificates_management/models/revocation_reason'
require 'oci/certificates_management/models/revocation_status'
require 'oci/certificates_management/models/revoke_certificate_authority_version_details'
require 'oci/certificates_management/models/revoke_certificate_version_details'
require 'oci/certificates_management/models/schedule_certificate_authority_deletion_details'
require 'oci/certificates_management/models/schedule_certificate_authority_version_deletion_details'
require 'oci/certificates_management/models/schedule_certificate_deletion_details'
require 'oci/certificates_management/models/schedule_certificate_version_deletion_details'
require 'oci/certificates_management/models/signature_algorithm'
require 'oci/certificates_management/models/update_ca_bundle_details'
require 'oci/certificates_management/models/update_certificate_authority_config_details'
require 'oci/certificates_management/models/update_certificate_authority_details'
require 'oci/certificates_management/models/update_certificate_by_importing_config_details'
require 'oci/certificates_management/models/update_certificate_config_details'
require 'oci/certificates_management/models/update_certificate_details'
require 'oci/certificates_management/models/update_certificate_issued_by_internal_ca_config_details'
require 'oci/certificates_management/models/update_certificate_managed_externally_issued_by_internal_ca_config_details'
require 'oci/certificates_management/models/update_root_ca_by_generating_internally_config_details'
require 'oci/certificates_management/models/update_subordinate_ca_issued_by_internal_ca_config_details'
require 'oci/certificates_management/models/validity'
require 'oci/certificates_management/models/version_stage'

# Require generated clients
require 'oci/certificates_management/certificates_management_client'
require 'oci/certificates_management/certificates_management_client_composite_operations'

# Require service utilities
require 'oci/certificates_management/util'
