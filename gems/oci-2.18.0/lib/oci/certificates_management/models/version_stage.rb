# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CertificatesManagement::Models
    VERSION_STAGE_ENUM = [
      VERSION_STAGE_CURRENT = 'CURRENT'.freeze,
      VERSION_STAGE_PENDING = 'PENDING'.freeze,
      VERSION_STAGE_LATEST = 'LATEST'.freeze,
      VERSION_STAGE_PREVIOUS = 'PREVIOUS'.freeze,
      VERSION_STAGE_DEPRECATED = 'DEPRECATED'.freeze,
      VERSION_STAGE_FAILED = 'FAILED'.freeze
    ].freeze
  end
end
