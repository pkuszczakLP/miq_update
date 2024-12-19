# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Oce::Models
    LIFECYCLE_DETAILS_ENUM = [
      LIFECYCLE_DETAILS_STANDBY = 'STANDBY'.freeze,
      LIFECYCLE_DETAILS_FAILOVER = 'FAILOVER'.freeze,
      LIFECYCLE_DETAILS_DOWN = 'DOWN'.freeze,
      LIFECYCLE_DETAILS_ACTIVE = 'ACTIVE'.freeze
    ].freeze
  end
end
