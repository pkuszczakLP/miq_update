# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module TenantManagerControlPlane::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_SENDER_INVITATION = 'CREATE_SENDER_INVITATION'.freeze,
      OPERATION_TYPE_ACCEPT_RECIPIENT_INVITATION = 'ACCEPT_RECIPIENT_INVITATION'.freeze,
      OPERATION_TYPE_CANCEL_SENDER_INVITATION = 'CANCEL_SENDER_INVITATION'.freeze,
      OPERATION_TYPE_COMPLETE_ORDER_ACTIVATION = 'COMPLETE_ORDER_ACTIVATION'.freeze,
      OPERATION_TYPE_ACTIVATE_ORDER_EXISTING_TENANCY = 'ACTIVATE_ORDER_EXISTING_TENANCY'.freeze,
      OPERATION_TYPE_REGISTER_DOMAIN = 'REGISTER_DOMAIN'.freeze,
      OPERATION_TYPE_RELEASE_DOMAIN = 'RELEASE_DOMAIN'.freeze,
      OPERATION_TYPE_CREATE_CHILD_TENANCY = 'CREATE_CHILD_TENANCY'.freeze,
      OPERATION_TYPE_ASSIGN_DEFAULT_SUBSCRIPTION = 'ASSIGN_DEFAULT_SUBSCRIPTION'.freeze,
      OPERATION_TYPE_MANUAL_LINK_CREATION = 'MANUAL_LINK_CREATION'.freeze,
      OPERATION_TYPE_TERMINATE_ORGANIZATION_TENANCY = 'TERMINATE_ORGANIZATION_TENANCY'.freeze,
      OPERATION_TYPE_UPDATE_SAAS_CAPABILITY = 'UPDATE_SAAS_CAPABILITY'.freeze,
      OPERATION_TYPE_SOFT_TERMINATE_TENANCY = 'SOFT_TERMINATE_TENANCY'.freeze,
      OPERATION_TYPE_HARD_TERMINATE_TENANCY = 'HARD_TERMINATE_TENANCY'.freeze,
      OPERATION_TYPE_RESTORE_TENANCY = 'RESTORE_TENANCY'.freeze,
      OPERATION_TYPE_LOG_TENANCY_TERMINATION_REQUEST = 'LOG_TENANCY_TERMINATION_REQUEST'.freeze,
      OPERATION_TYPE_SELF_OPT_IN = 'SELF_OPT_IN'.freeze,
      OPERATION_TYPE_SELF_OPT_OUT = 'SELF_OPT_OUT'.freeze
    ].freeze
  end
end