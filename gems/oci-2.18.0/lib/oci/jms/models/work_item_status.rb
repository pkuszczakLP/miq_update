# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Jms::Models
    WORK_ITEM_STATUS_ENUM = [
      WORK_ITEM_STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      WORK_ITEM_STATUS_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      WORK_ITEM_STATUS_CANCELING = 'CANCELING'.freeze,
      WORK_ITEM_STATUS_CANCELED = 'CANCELED'.freeze,
      WORK_ITEM_STATUS_SUCCEEDED = 'SUCCEEDED'.freeze,
      WORK_ITEM_STATUS_NEEDS_ATTENTION = 'NEEDS_ATTENTION'.freeze,
      WORK_ITEM_STATUS_RETRYING = 'RETRYING'.freeze
    ].freeze
  end
end
