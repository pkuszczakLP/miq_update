# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Jms::Models
    JRE_SORT_BY_ENUM = [
      JRE_SORT_BY_DISTRIBUTION = 'distribution'.freeze,
      JRE_SORT_BY_TIME_FIRST_SEEN = 'timeFirstSeen'.freeze,
      JRE_SORT_BY_TIME_LAST_SEEN = 'timeLastSeen'.freeze,
      JRE_SORT_BY_VENDOR = 'vendor'.freeze,
      JRE_SORT_BY_VERSION = 'version'.freeze,
      JRE_SORT_BY_APPROXIMATE_INSTALLATION_COUNT = 'approximateInstallationCount'.freeze,
      JRE_SORT_BY_APPROXIMATE_APPLICATION_COUNT = 'approximateApplicationCount'.freeze,
      JRE_SORT_BY_APPROXIMATE_MANAGED_INSTANCE_COUNT = 'approximateManagedInstanceCount'.freeze,
      JRE_SORT_BY_OS_NAME = 'osName'.freeze,
      JRE_SORT_BY_SECURITY_STATUS = 'securityStatus'.freeze
    ].freeze
  end
end
