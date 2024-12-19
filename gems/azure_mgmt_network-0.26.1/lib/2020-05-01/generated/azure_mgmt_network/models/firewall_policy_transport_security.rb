# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Configuration needed to perform TLS termination & initiation.
    #
    class FirewallPolicyTransportSecurity

      include MsRestAzure

      # @return [FirewallPolicyCertificateAuthority] The CA used for
      # intermediate CA generation.
      attr_accessor :certificate_authority

      # @return [Array<String>] List of domains which are excluded from TLS
      # termination.
      attr_accessor :excluded_domains

      # @return [Array<FirewallPolicyTrustedRootCertificate>] Certificates
      # which are to be trusted by the firewall.
      attr_accessor :trusted_root_certificates


      #
      # Mapper for FirewallPolicyTransportSecurity class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'FirewallPolicyTransportSecurity',
          type: {
            name: 'Composite',
            class_name: 'FirewallPolicyTransportSecurity',
            model_properties: {
              certificate_authority: {
                client_side_validation: true,
                required: false,
                serialized_name: 'certificateAuthority',
                type: {
                  name: 'Composite',
                  class_name: 'FirewallPolicyCertificateAuthority'
                }
              },
              excluded_domains: {
                client_side_validation: true,
                required: false,
                serialized_name: 'excludedDomains',
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
              trusted_root_certificates: {
                client_side_validation: true,
                required: false,
                serialized_name: 'trustedRootCertificates',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'FirewallPolicyTrustedRootCertificateElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'FirewallPolicyTrustedRootCertificate'
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
