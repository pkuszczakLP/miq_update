# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_06_01
  module Models
    #
    # Model object.
    #
    #
    class DedicatedHostGroupInstanceView

      include MsRestAzure

      # @return [Array<DedicatedHostInstanceViewWithName>] List of instance
      # view of the dedicated hosts under the dedicated host group.
      attr_accessor :hosts


      #
      # Mapper for DedicatedHostGroupInstanceView class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'DedicatedHostGroupInstanceView',
          type: {
            name: 'Composite',
            class_name: 'DedicatedHostGroupInstanceView',
            model_properties: {
              hosts: {
                client_side_validation: true,
                required: false,
                serialized_name: 'hosts',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'DedicatedHostInstanceViewWithNameElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'DedicatedHostInstanceViewWithName'
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
