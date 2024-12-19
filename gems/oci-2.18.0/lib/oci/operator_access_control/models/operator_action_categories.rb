# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module OperatorAccessControl::Models
    OPERATOR_ACTION_CATEGORIES_ENUM = [
      OPERATOR_ACTION_CATEGORIES_SERVICEDIAGNOSTICS = 'SERVICEDIAGNOSTICS'.freeze,
      OPERATOR_ACTION_CATEGORIES_SERVICEMANAGEMENT = 'SERVICEMANAGEMENT'.freeze,
      OPERATOR_ACTION_CATEGORIES_SYSTEMMANAGEMENT = 'SYSTEMMANAGEMENT'.freeze,
      OPERATOR_ACTION_CATEGORIES_FULLADMINISTRATION = 'FULLADMINISTRATION'.freeze,
      OPERATOR_ACTION_CATEGORIES_CELLMANAGEMENT = 'CELLMANAGEMENT'.freeze
    ].freeze
  end
end
