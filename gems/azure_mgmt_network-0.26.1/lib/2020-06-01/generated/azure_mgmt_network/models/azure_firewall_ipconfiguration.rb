# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_06_01
  module Models
    #
    # IP configuration of an Azure Firewall.
    #
    class AzureFirewallIPConfiguration < SubResource

      include MsRestAzure

      # @return [String] The Firewall Internal Load Balancer IP to be used as
      # the next hop in User Defined Routes.
      attr_accessor :private_ipaddress

      # @return [SubResource] Reference to the subnet resource. This resource
      # must be named 'AzureFirewallSubnet' or 'AzureFirewallManagementSubnet'.
      attr_accessor :subnet

      # @return [SubResource] Reference to the PublicIP resource. This field is
      # a mandatory input if subnet is not null.
      attr_accessor :public_ipaddress

      # @return [ProvisioningState] The provisioning state of the Azure
      # firewall IP configuration resource. Possible values include:
      # 'Succeeded', 'Updating', 'Deleting', 'Failed'
      attr_accessor :provisioning_state

      # @return [String] Name of the resource that is unique within a resource
      # group. This name can be used to access the resource.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag

      # @return [String] Type of the resource.
      attr_accessor :type


      #
      # Mapper for AzureFirewallIPConfiguration class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'AzureFirewallIPConfiguration',
          type: {
            name: 'Composite',
            class_name: 'AzureFirewallIPConfiguration',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              private_ipaddress: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'properties.privateIPAddress',
                type: {
                  name: 'String'
                }
              },
              subnet: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.subnet',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
                }
              },
              public_ipaddress: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.publicIPAddress',
                type: {
                  name: 'Composite',
                  class_name: 'SubResource'
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
