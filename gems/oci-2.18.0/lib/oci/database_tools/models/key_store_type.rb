# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module DatabaseTools::Models
    KEY_STORE_TYPE_ENUM = [
      KEY_STORE_TYPE_JAVA_KEY_STORE = 'JAVA_KEY_STORE'.freeze,
      KEY_STORE_TYPE_JAVA_TRUST_STORE = 'JAVA_TRUST_STORE'.freeze,
      KEY_STORE_TYPE_PKCS12 = 'PKCS12'.freeze,
      KEY_STORE_TYPE_SSO = 'SSO'.freeze
    ].freeze
  end
end
