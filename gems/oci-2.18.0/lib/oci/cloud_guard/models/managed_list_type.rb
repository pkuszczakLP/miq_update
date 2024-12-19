# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CloudGuard::Models
    MANAGED_LIST_TYPE_ENUM = [
      MANAGED_LIST_TYPE_CIDR_BLOCK = 'CIDR_BLOCK'.freeze,
      MANAGED_LIST_TYPE_USERS = 'USERS'.freeze,
      MANAGED_LIST_TYPE_GROUPS = 'GROUPS'.freeze,
      MANAGED_LIST_TYPE_IPV4_ADDRESS = 'IPV4ADDRESS'.freeze,
      MANAGED_LIST_TYPE_IPV6_ADDRESS = 'IPV6ADDRESS'.freeze,
      MANAGED_LIST_TYPE_RESOURCE_OCID = 'RESOURCE_OCID'.freeze,
      MANAGED_LIST_TYPE_REGION = 'REGION'.freeze,
      MANAGED_LIST_TYPE_COUNTRY = 'COUNTRY'.freeze,
      MANAGED_LIST_TYPE_STATE = 'STATE'.freeze,
      MANAGED_LIST_TYPE_CITY = 'CITY'.freeze,
      MANAGED_LIST_TYPE_TAGS = 'TAGS'.freeze,
      MANAGED_LIST_TYPE_GENERIC = 'GENERIC'.freeze
    ].freeze
  end
end
