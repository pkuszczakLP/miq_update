# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module TenantManagerControlPlane::Models
    SENDER_INVITATION_STATUS_ENUM = [
      SENDER_INVITATION_STATUS_PENDING = 'PENDING'.freeze,
      SENDER_INVITATION_STATUS_CANCELED = 'CANCELED'.freeze,
      SENDER_INVITATION_STATUS_ACCEPTED = 'ACCEPTED'.freeze,
      SENDER_INVITATION_STATUS_EXPIRED = 'EXPIRED'.freeze,
      SENDER_INVITATION_STATUS_FAILED = 'FAILED'.freeze
    ].freeze
  end
end
