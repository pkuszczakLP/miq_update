# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_12_01
  module Models
    #
    # Response from generation of an SSH key pair.
    #
    class SshPublicKeyGenerateKeyPairResult

      include MsRestAzure

      # @return [String] Private key portion of the key pair used to
      # authenticate to a virtual machine through ssh. The private key is
      # returned in RFC3447 format and should be treated as a secret.
      attr_accessor :private_key

      # @return [String] Public key portion of the key pair used to
      # authenticate to a virtual machine through ssh. The public key is in
      # ssh-rsa format.
      attr_accessor :public_key

      # @return [String] The ARM resource id in the form of
      # /subscriptions/{SubscriptionId}/resourceGroups/{ResourceGroupName}/providers/Microsoft.Compute/sshPublicKeys/{SshPublicKeyName}
      attr_accessor :id


      #
      # Mapper for SshPublicKeyGenerateKeyPairResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'SshPublicKeyGenerateKeyPairResult',
          type: {
            name: 'Composite',
            class_name: 'SshPublicKeyGenerateKeyPairResult',
            model_properties: {
              private_key: {
                client_side_validation: true,
                required: true,
                serialized_name: 'privateKey',
                type: {
                  name: 'String'
                }
              },
              public_key: {
                client_side_validation: true,
                required: true,
                serialized_name: 'publicKey',
                type: {
                  name: 'String'
                }
              },
              id: {
                client_side_validation: true,
                required: true,
                serialized_name: 'id',
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
