# Copyright (c) 2016, 2022, Oracle and/or its affiliates.  All rights reserved.
# This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

module OCI
  module ThreatIntelligence
    # Module containing models for requests made to, and responses received from,
    # OCI ThreatIntelligence services
    module Models
    end
  end
end

# Require models
require 'oci/threat_intelligence/models/data_attribution'
require 'oci/threat_intelligence/models/data_visibility'
require 'oci/threat_intelligence/models/entity_reference'
require 'oci/threat_intelligence/models/indicator'
require 'oci/threat_intelligence/models/indicator_attribute'
require 'oci/threat_intelligence/models/indicator_count_collection'
require 'oci/threat_intelligence/models/indicator_count_dimensions'
require 'oci/threat_intelligence/models/indicator_count_summary'
require 'oci/threat_intelligence/models/indicator_reference'
require 'oci/threat_intelligence/models/indicator_relationship'
require 'oci/threat_intelligence/models/indicator_source_summary'
require 'oci/threat_intelligence/models/indicator_summary'
require 'oci/threat_intelligence/models/indicator_summary_collection'
require 'oci/threat_intelligence/models/indicator_type'
require 'oci/threat_intelligence/models/lifecycle_state'
require 'oci/threat_intelligence/models/sort_order'
require 'oci/threat_intelligence/models/threat_type'
require 'oci/threat_intelligence/models/threat_type_summary'
require 'oci/threat_intelligence/models/threat_types_collection'

# Require generated clients
require 'oci/threat_intelligence/threatintel_client'

# Require service utilities
require 'oci/threat_intelligence/util'
