# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseMigration::Models
    REASON_KEYWORDS_ENUM = [
      REASON_KEYWORDS_ORACLE_MAINTAINED = 'ORACLE_MAINTAINED'.freeze,
      REASON_KEYWORDS_GG_UNSUPPORTED = 'GG_UNSUPPORTED'.freeze,
      REASON_KEYWORDS_USER_EXCLUDED = 'USER_EXCLUDED'.freeze,
      REASON_KEYWORDS_MANDATORY_EXCLUDED = 'MANDATORY_EXCLUDED'.freeze,
      REASON_KEYWORDS_USER_EXCLUDED_TYPE = 'USER_EXCLUDED_TYPE'.freeze
    ].freeze
  end
end
