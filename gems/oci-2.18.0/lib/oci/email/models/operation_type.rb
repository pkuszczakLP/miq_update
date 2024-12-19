# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Email::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_DKIM = 'CREATE_DKIM'.freeze,
      OPERATION_TYPE_DELETE_DKIM = 'DELETE_DKIM'.freeze,
      OPERATION_TYPE_MOVE_DKIM = 'MOVE_DKIM'.freeze,
      OPERATION_TYPE_UPDATE_DKIM = 'UPDATE_DKIM'.freeze,
      OPERATION_TYPE_CREATE_EMAIL_DOMAIN = 'CREATE_EMAIL_DOMAIN'.freeze,
      OPERATION_TYPE_DELETE_EMAIL_DOMAIN = 'DELETE_EMAIL_DOMAIN'.freeze,
      OPERATION_TYPE_MOVE_EMAIL_DOMAIN = 'MOVE_EMAIL_DOMAIN'.freeze,
      OPERATION_TYPE_UPDATE_EMAIL_DOMAIN = 'UPDATE_EMAIL_DOMAIN'.freeze
    ].freeze
  end
end
