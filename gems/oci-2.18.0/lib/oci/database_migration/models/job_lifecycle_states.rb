# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    JOB_LIFECYCLE_STATES_ENUM = [
      JOB_LIFECYCLE_STATES_ACCEPTED = 'ACCEPTED'.freeze,
      JOB_LIFECYCLE_STATES_IN_PROGRESS = 'IN_PROGRESS'.freeze,
      JOB_LIFECYCLE_STATES_UNKNOWN = 'UNKNOWN'.freeze,
      JOB_LIFECYCLE_STATES_TERMINATED = 'TERMINATED'.freeze,
      JOB_LIFECYCLE_STATES_FAILED = 'FAILED'.freeze,
      JOB_LIFECYCLE_STATES_SUCCEEDED = 'SUCCEEDED'.freeze,
      JOB_LIFECYCLE_STATES_WAITING = 'WAITING'.freeze,
      JOB_LIFECYCLE_STATES_CANCELING = 'CANCELING'.freeze,
      JOB_LIFECYCLE_STATES_CANCELED = 'CANCELED'.freeze
    ].freeze
  end
end
