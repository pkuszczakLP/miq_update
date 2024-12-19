# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Virtual Appliance Site resource.
    #
    class BgpConnection < SubResource

      include MsRestAzure

      # @return [Integer] Peer ASN.
      attr_accessor :peer_asn

      # @return [String] Peer IP.
      attr_accessor :peer_ip

      # @return [ProvisioningState] The provisioning state of the resource.
      # Possible values include: 'Succeeded', 'Updating', 'Deleting', 'Failed'
      attr_accessor :provisioning_state

      # @return [HubBgpConnectionStatus] The current state of the VirtualHub to
      # Peer. Possible values include: 'Unknown', 'Connecting', 'Connected',
      # 'NotConnected'
      attr_accessor :connection_state

      # @return [String] Name of the connection.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag

      # @return [String] Connection type.
      attr_accessor :type


      #
      # Mapper for BgpConnection class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'BgpConnection',
          type: {
            name: 'Composite',
            class_name: 'BgpConnection',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              peer_asn: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.peerAsn',
                constraints: {
                  InclusiveMaximum: 4294967295,
                  InclusiveMinimum: 0
                },
                type: {
                  name: 'Number'
                }
              },
              peer_ip: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.peerIp',
                type: {
                  name: 'String'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              connection_state: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.connectionState',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'etag',
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
              }
            }
          }
        }
      end
    end
  end
end
