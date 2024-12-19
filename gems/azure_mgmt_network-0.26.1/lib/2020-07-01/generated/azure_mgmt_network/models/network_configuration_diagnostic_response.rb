# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_07_01
  module Models
    #
    # Results of network configuration diagnostic on the target resource.
    #
    class NetworkConfigurationDiagnosticResponse

      include MsRestAzure

      # @return [Array<NetworkConfigurationDiagnosticResult>] List of network
      # configuration diagnostic results.
      attr_accessor :results


      #
      # Mapper for NetworkConfigurationDiagnosticResponse class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'NetworkConfigurationDiagnosticResponse',
          type: {
            name: 'Composite',
            class_name: 'NetworkConfigurationDiagnosticResponse',
            model_properties: {
              results: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'results',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'NetworkConfigurationDiagnosticResultElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'NetworkConfigurationDiagnosticResult'
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
