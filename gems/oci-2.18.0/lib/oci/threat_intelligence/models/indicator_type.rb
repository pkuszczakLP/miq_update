# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ThreatIntelligence::Models
    INDICATOR_TYPE_ENUM = [
      INDICATOR_TYPE_DOMAIN_NAME = 'DOMAIN_NAME'.freeze,
      INDICATOR_TYPE_FILE_NAME = 'FILE_NAME'.freeze,
      INDICATOR_TYPE_MD5_HASH = 'MD5_HASH'.freeze,
      INDICATOR_TYPE_SHA1_HASH = 'SHA1_HASH'.freeze,
      INDICATOR_TYPE_SHA256_HASH = 'SHA256_HASH'.freeze,
      INDICATOR_TYPE_IP_ADDRESS = 'IP_ADDRESS'.freeze,
      INDICATOR_TYPE_URL = 'URL'.freeze
    ].freeze
  end
end
