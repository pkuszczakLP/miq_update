# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_04_01
  module Models
    #
    # Contains custom Dns resolution configuration from customer.
    #
    class CustomDnsConfigPropertiesFormat

      include MsRestAzure

      # @return [String] Fqdn that resolves to private endpoint ip address.
      attr_accessor :fqdn

      # @return [Array<String>] A list of private ip addresses of the private
      # endpoint.
      attr_accessor :ip_addresses


      #
      # Mapper for CustomDnsConfigPropertiesFormat class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'CustomDnsConfigPropertiesFormat',
          type: {
            name: 'Composite',
            class_name: 'CustomDnsConfigPropertiesFormat',
            model_properties: {
              fqdn: {
                client_side_validation: true,
                required: false,
                serialized_name: 'fqdn',
                type: {
                  name: 'String'
                }
              },
              ip_addresses: {
                client_side_validation: true,
                required: false,
                serialized_name: 'ipAddresses',
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
