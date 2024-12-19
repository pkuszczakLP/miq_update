# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2019_04_01
  module Models
    #
    # The serviceName of an AvailableDelegation indicates a possible delegation
    # for a subnet.
    #
    class AvailableDelegation

      include MsRestAzure

      # @return [String] The name of the AvailableDelegation resource.
      attr_accessor :name

      # @return [String] A unique identifier of the AvailableDelegation
      # resource.
      attr_accessor :id

      # @return [String] Resource type.
      attr_accessor :type

      # @return [String] The name of the service and resource.
      attr_accessor :service_name

      # @return [Array<String>] Describes the actions permitted to the service
      # upon delegation.
      attr_accessor :actions


      #
      # Mapper for AvailableDelegation class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'AvailableDelegation',
          type: {
            name: 'Composite',
            class_name: 'AvailableDelegation',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              service_name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'serviceName',
                type: {
                  name: 'String'
                }
              },
              actions: {
                client_side_validation: true,
                required: false,
                serialized_name: 'actions',
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
