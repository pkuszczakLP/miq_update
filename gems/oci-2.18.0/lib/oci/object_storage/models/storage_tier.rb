# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ObjectStorage::Models
    STORAGE_TIER_ENUM = [
      STORAGE_TIER_STANDARD = 'Standard'.freeze,
      STORAGE_TIER_INFREQUENT_ACCESS = 'InfrequentAccess'.freeze,
      STORAGE_TIER_ARCHIVE = 'Archive'.freeze
    ].freeze
  end
end
