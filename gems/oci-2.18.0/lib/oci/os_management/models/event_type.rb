# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OsManagement::Models
    EVENT_TYPE_ENUM = [
      EVENT_TYPE_KERNEL_OOPS = 'KERNEL_OOPS'.freeze,
      EVENT_TYPE_KERNEL_CRASH = 'KERNEL_CRASH'.freeze,
      EVENT_TYPE_CRASH = 'CRASH'.freeze,
      EVENT_TYPE_EXPLOIT_ATTEMPT = 'EXPLOIT_ATTEMPT'.freeze,
      EVENT_TYPE_COMPLIANCE = 'COMPLIANCE'.freeze,
      EVENT_TYPE_TUNING_SUGGESTION = 'TUNING_SUGGESTION'.freeze,
      EVENT_TYPE_TUNING_APPLIED = 'TUNING_APPLIED'.freeze,
      EVENT_TYPE_SECURITY = 'SECURITY'.freeze,
      EVENT_TYPE_ERROR = 'ERROR'.freeze,
      EVENT_TYPE_WARNING = 'WARNING'.freeze
    ].freeze
  end
end
