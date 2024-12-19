# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module LicenseManager::Models
    STATUS_ENUM = [
      STATUS_INCOMPLETE = 'INCOMPLETE'.freeze,
      STATUS_ISSUES_FOUND = 'ISSUES_FOUND'.freeze,
      STATUS_WARNING = 'WARNING'.freeze,
      STATUS_OK = 'OK'.freeze
    ].freeze
  end
end
