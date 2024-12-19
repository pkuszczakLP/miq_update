# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_08_01
  module Models
    #
    # Result of the request to list all P2SVpnServerConfigurations associated
    # to a VirtualWan. It contains a list of P2SVpnServerConfigurations and a
    # URL nextLink to get the next set of results.
    #
    class ListP2SVpnServerConfigurationsResult

      include MsRestAzure

      include MsRest::JSONable
      # @return [Array<P2SVpnServerConfiguration>] List of
      # P2SVpnServerConfigurations.
      attr_accessor :value

      # @return [String] URL to get the next set of operation list results if
      # there are any.
      attr_accessor :next_link

      # return [Proc] with next page method call.
      attr_accessor :next_method

      #
      # Gets the rest of the items for the request, enabling auto-pagination.
      #
      # @return [Array<P2SVpnServerConfiguration>] operation results.
      #
      def get_all_items
        items = @value
        page = self
        while page.next_link != nil && !page.next_link.strip.empty? do
          page = page.get_next_page
          items.concat(page.value)
        end
        items
      end

      #
      # Gets the next page of results.
      #
      # @return [ListP2SVpnServerConfigurationsResult] with next page content.
      #
      def get_next_page
        response = @next_method.call(@next_link).value! unless @next_method.nil?
        unless response.nil?
          @next_link = response.body.next_link
          @value = response.body.value
          self
        end
      end

      #
      # Mapper for ListP2SVpnServerConfigurationsResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ListP2SVpnServerConfigurationsResult',
          type: {
            name: 'Composite',
            class_name: 'ListP2SVpnServerConfigurationsResult',
            model_properties: {
              value: {
                client_side_validation: true,
                required: false,
                serialized_name: 'value',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'P2SVpnServerConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'P2SVpnServerConfiguration'
                      }
                  }
                }
              },
              next_link: {
                client_side_validation: true,
                required: false,
                serialized_name: 'nextLink',
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
