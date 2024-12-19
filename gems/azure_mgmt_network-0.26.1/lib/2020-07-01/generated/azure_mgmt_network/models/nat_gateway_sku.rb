# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_07_01
  module Models
    #
    # SKU of nat gateway.
    #
    class NatGatewaySku

      include MsRestAzure

      # @return [NatGatewaySkuName] Name of Nat Gateway SKU. Possible values
      # include: 'Standard'
      attr_accessor :name


      #
      # Mapper for NatGatewaySku class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'NatGatewaySku',
          type: {
            name: 'Composite',
            class_name: 'NatGatewaySku',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
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
