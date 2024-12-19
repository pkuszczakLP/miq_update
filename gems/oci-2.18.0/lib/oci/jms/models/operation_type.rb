# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module Jms::Models
    OPERATION_TYPE_ENUM = [
      OPERATION_TYPE_CREATE_FLEET = 'CREATE_FLEET'.freeze,
      OPERATION_TYPE_DELETE_FLEET = 'DELETE_FLEET'.freeze,
      OPERATION_TYPE_MOVE_FLEET = 'MOVE_FLEET'.freeze,
      OPERATION_TYPE_UPDATE_FLEET = 'UPDATE_FLEET'.freeze,
      OPERATION_TYPE_UPDATE_FLEET_AGENT_CONFIGURATION = 'UPDATE_FLEET_AGENT_CONFIGURATION'.freeze,
      OPERATION_TYPE_DELETE_JAVA_INSTALLATION = 'DELETE_JAVA_INSTALLATION'.freeze
    ].freeze
  end
end
