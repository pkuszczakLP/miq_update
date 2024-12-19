# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_11_01
  module Models
    #
    # Parameters that determine how the connectivity check will be performed.
    #
    class ConnectivityParameters

      include MsRestAzure

      # @return [ConnectivitySource]
      attr_accessor :source

      # @return [ConnectivityDestination]
      attr_accessor :destination

      # @return [Protocol] Network protocol. Possible values include: 'Tcp',
      # 'Http', 'Https', 'Icmp'
      attr_accessor :protocol

      # @return [ProtocolConfiguration]
      attr_accessor :protocol_configuration


      #
      # Mapper for ConnectivityParameters class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ConnectivityParameters',
          type: {
            name: 'Composite',
            class_name: 'ConnectivityParameters',
            model_properties: {
              source: {
                client_side_validation: true,
                required: true,
                serialized_name: 'source',
                type: {
                  name: 'Composite',
                  class_name: 'ConnectivitySource'
                }
              },
              destination: {
                client_side_validation: true,
                required: true,
                serialized_name: 'destination',
                type: {
                  name: 'Composite',
                  class_name: 'ConnectivityDestination'
                }
              },
              protocol: {
                client_side_validation: true,
                required: false,
                serialized_name: 'protocol',
                type: {
                  name: 'String'
                }
              },
              protocol_configuration: {
                client_side_validation: true,
                required: false,
                serialized_name: 'protocolConfiguration',
                type: {
                  name: 'Composite',
                  class_name: 'ProtocolConfiguration'
                }
              }
            }
          }
        }
      end
    end
  end
end
