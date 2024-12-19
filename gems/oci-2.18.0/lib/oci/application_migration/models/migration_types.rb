# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ApplicationMigration::Models
    MIGRATION_TYPES_ENUM = [
      MIGRATION_TYPES_JCS = 'JCS'.freeze,
      MIGRATION_TYPES_SOACS = 'SOACS'.freeze,
      MIGRATION_TYPES_OIC = 'OIC'.freeze,
      MIGRATION_TYPES_OAC = 'OAC'.freeze,
      MIGRATION_TYPES_ICS = 'ICS'.freeze,
      MIGRATION_TYPES_PCS = 'PCS'.freeze
    ].freeze
  end
end
