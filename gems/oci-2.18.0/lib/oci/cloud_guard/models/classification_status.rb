# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module CloudGuard::Models
    CLASSIFICATION_STATUS_ENUM = [
      CLASSIFICATION_STATUS_FALSE_POSITIVE = 'FALSE_POSITIVE'.freeze,
      CLASSIFICATION_STATUS_FALSE_NEGATIVE = 'FALSE_NEGATIVE'.freeze,
      CLASSIFICATION_STATUS_TRUE_POSITIVE = 'TRUE_POSITIVE'.freeze,
      CLASSIFICATION_STATUS_TRUE_NEGATIVE = 'TRUE_NEGATIVE'.freeze,
      CLASSIFICATION_STATUS_NOT_CLASSIFIED = 'NOT_CLASSIFIED'.freeze
    ].freeze
  end
end
