# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseManagement::Models
    WORK_REQUEST_RESOURCE_ACTION_TYPE_ENUM = [
      WORK_REQUEST_RESOURCE_ACTION_TYPE_CREATED = 'CREATED'.freeze,
      WORK_REQUEST_RESOURCE_ACTION_TYPE_UPDATED = 'UPDATED'.freeze,
      WORK_REQUEST_RESOURCE_ACTION_TYPE_DELETED = 'DELETED'.freeze,
      WORK_REQUEST_RESOURCE_ACTION_TYPE_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      WORK_REQUEST_RESOURCE_ACTION_TYPE_RELATED = 'RELATED'.freeze,
      WORK_REQUEST_RESOURCE_ACTION_TYPE_FAILED = 'FAILED'.freeze
    ].freeze
  end
end
