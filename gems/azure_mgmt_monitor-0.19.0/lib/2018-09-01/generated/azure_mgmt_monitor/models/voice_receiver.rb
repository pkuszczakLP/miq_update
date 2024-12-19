# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Monitor::Mgmt::V2018_09_01
  module Models
    #
    # A voice receiver.
    #
    class VoiceReceiver

      include MsRestAzure

      # @return [String] The name of the voice receiver. Names must be unique
      # across all receivers within an action group.
      attr_accessor :name

      # @return [String] The country code of the voice receiver.
      attr_accessor :country_code

      # @return [String] The phone number of the voice receiver.
      attr_accessor :phone_number


      #
      # Mapper for VoiceReceiver class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VoiceReceiver',
          type: {
            name: 'Composite',
            class_name: 'VoiceReceiver',
            model_properties: {
              name: {
                client_side_validation: true,
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              country_code: {
                client_side_validation: true,
                required: true,
                serialized_name: 'countryCode',
                type: {
                  name: 'String'
                }
              },
              phone_number: {
                client_side_validation: true,
                required: true,
                serialized_name: 'phoneNumber',
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
