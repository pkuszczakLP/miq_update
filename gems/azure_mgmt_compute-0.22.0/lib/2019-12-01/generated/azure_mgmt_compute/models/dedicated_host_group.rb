# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2019_12_01
  module Models
    #
    # Specifies information about the dedicated host group that the dedicated
    # hosts should be assigned to. <br><br> Currently, a dedicated host can
    # only be added to a dedicated host group at creation time. An existing
    # dedicated host cannot be added to another dedicated host group.
    #
    class DedicatedHostGroup < Resource

      include MsRestAzure

      # @return [Integer] Number of fault domains that the host group can span.
      attr_accessor :platform_fault_domain_count

      # @return [Array<SubResourceReadOnly>] A list of references to all
      # dedicated hosts in the dedicated host group.
      attr_accessor :hosts

      # @return [Array<String>] Availability Zone to use for this host group.
      # Only single zone is supported. The zone can be assigned only during
      # creation. If not provided, the group supports all zones in the region.
      # If provided, enforces each host in the group to be in the same zone.
      attr_accessor :zones


      #
      # Mapper for DedicatedHostGroup class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'DedicatedHostGroup',
          type: {
            name: 'Composite',
            class_name: 'DedicatedHostGroup',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              location: {
                client_side_validation: true,
                required: true,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              platform_fault_domain_count: {
                client_side_validation: true,
                required: true,
                serialized_name: 'properties.platformFaultDomainCount',
                constraints: {
                  InclusiveMaximum: 3,
                  InclusiveMinimum: 1
                },
                type: {
                  name: 'Number'
                }
              },
              hosts: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.hosts',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'SubResourceReadOnlyElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'SubResourceReadOnly'
                      }
                  }
                }
              },
              zones: {
                client_side_validation: true,
                required: false,
                serialized_name: 'zones',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              }
            }
          }
        }
      end
    end
  end
end
