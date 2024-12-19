# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_06_01
  module Models
    #
    # The customer name to be printed on a letter of authorization.
    #
    class GenerateExpressRoutePortsLOARequest

      include MsRestAzure

      # @return [String] The customer name.
      attr_accessor :customer_name


      #
      # Mapper for GenerateExpressRoutePortsLOARequest class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'GenerateExpressRoutePortsLOARequest',
          type: {
            name: 'Composite',
            class_name: 'GenerateExpressRoutePortsLOARequest',
            model_properties: {
              customer_name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'customerName',
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
