# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2018_10_01
  module Models
    #
    # Probe of the application gateway.
    #
    class ApplicationGatewayProbe < SubResource

      include MsRestAzure

      # @return [ApplicationGatewayProtocol] The protocol used for the probe.
      # Possible values are 'Http' and 'Https'. Possible values include:
      # 'Http', 'Https'
      attr_accessor :protocol

      # @return [String] Host name to send the probe to.
      attr_accessor :host

      # @return [String] Relative path of probe. Valid path starts from '/'.
      # Probe is sent to <Protocol>://<host>:<port><path>
      attr_accessor :path

      # @return [Integer] The probing interval in seconds. This is the time
      # interval between two consecutive probes. Acceptable values are from 1
      # second to 86400 seconds.
      attr_accessor :interval

      # @return [Integer] the probe timeout in seconds. Probe marked as failed
      # if valid response is not received with this timeout period. Acceptable
      # values are from 1 second to 86400 seconds.
      attr_accessor :timeout

      # @return [Integer] The probe retry count. Backend server is marked down
      # after consecutive probe failure count reaches UnhealthyThreshold.
      # Acceptable values are from 1 second to 20.
      attr_accessor :unhealthy_threshold

      # @return [Boolean] Whether the host header should be picked from the
      # backend http settings. Default value is false.
      attr_accessor :pick_host_name_from_backend_http_settings

      # @return [Integer] Minimum number of servers that are always marked
      # healthy. Default value is 0.
      attr_accessor :min_servers

      # @return [ApplicationGatewayProbeHealthResponseMatch] Criterion for
      # classifying a healthy probe response.
      attr_accessor :match

      # @return [String] Provisioning state of the backend http settings
      # resource. Possible values are: 'Updating', 'Deleting', and 'Failed'.
      attr_accessor :provisioning_state

      # @return [String] Name of the probe that is unique within an Application
      # Gateway.
      attr_accessor :name

      # @return [String] A unique read-only string that changes whenever the
      # resource is updated.
      attr_accessor :etag

      # @return [String] Type of the resource.
      attr_accessor :type


      #
      # Mapper for ApplicationGatewayProbe class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ApplicationGatewayProbe',
          type: {
            name: 'Composite',
            class_name: 'ApplicationGatewayProbe',
            model_properties: {
              id: {
                client_side_validation: true,
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              protocol: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.protocol',
                type: {
                  name: 'String'
                }
              },
              host: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.host',
                type: {
                  name: 'String'
                }
              },
              path: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.path',
                type: {
                  name: 'String'
                }
              },
              interval: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.interval',
                type: {
                  name: 'Number'
                }
              },
              timeout: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.timeout',
                type: {
                  name: 'Number'
                }
              },
              unhealthy_threshold: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.unhealthyThreshold',
                type: {
                  name: 'Number'
                }
              },
              pick_host_name_from_backend_http_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.pickHostNameFromBackendHttpSettings',
                type: {
                  name: 'Boolean'
                }
              },
              min_servers: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.minServers',
                type: {
                  name: 'Number'
                }
              },
              match: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.match',
                type: {
                  name: 'Composite',
                  class_name: 'ApplicationGatewayProbeHealthResponseMatch'
                }
              },
              provisioning_state: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.provisioningState',
                type: {
                  name: 'String'
                }
              },
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              etag: {
                client_side_validation: true,
                required: false,
                serialized_name: 'etag',
                type: {
                  name: 'String'
                }
              },
              type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'type',
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
