# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_06_01
  module Models
    #
    # IP addresses associated with azure firewall.
    #
    class HubIPAddresses

      include MsRestAzure

      # @return [HubPublicIPAddresses] Public IP addresses associated with
      # azure firewall.
      attr_accessor :public_ips

      # @return [String] Private IP Address associated with azure firewall.
      attr_accessor :private_ipaddress


      #
      # Mapper for HubIPAddresses class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'HubIPAddresses',
          type: {
            name: 'Composite',
            class_name: 'HubIPAddresses',
            model_properties: {
              public_ips: {
                client_side_validation: true,
                required: false,
                serialized_name: 'publicIPs',
                type: {
                  name: 'Composite',
                  class_name: 'HubPublicIPAddresses'
                }
              },
              private_ipaddress: {
                client_side_validation: true,
                required: false,
                serialized_name: 'privateIPAddress',
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
