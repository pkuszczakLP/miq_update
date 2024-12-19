# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_08_01
  module Models
    #
    # Country details.
    #
    class AvailableProvidersListCountry

      include MsRestAzure

      # @return [String] The country name.
      attr_accessor :country_name

      # @return [Array<String>] A list of Internet service providers.
      attr_accessor :providers

      # @return [Array<AvailableProvidersListState>] List of available states
      # in the country.
      attr_accessor :states


      #
      # Mapper for AvailableProvidersListCountry class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'AvailableProvidersListCountry',
          type: {
            name: 'Composite',
            class_name: 'AvailableProvidersListCountry',
            model_properties: {
              country_name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'countryName',
                type: {
                  name: 'String'
                }
              },
              providers: {
                client_side_validation: true,
                required: false,
                serialized_name: 'providers',
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
              },
              states: {
                client_side_validation: true,
                required: false,
                serialized_name: 'states',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'AvailableProvidersListStateElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'AvailableProvidersListState'
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
