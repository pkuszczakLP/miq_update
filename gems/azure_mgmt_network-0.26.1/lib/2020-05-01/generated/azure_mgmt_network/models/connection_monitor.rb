# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Network::Mgmt::V2020_05_01
  module Models
    #
    # Parameters that define the operation to create a connection monitor.
    #
    class ConnectionMonitor

      include MsRestAzure

      # @return [String] Connection monitor location.
      attr_accessor :location

      # @return [Hash{String => String}] Connection monitor tags.
      attr_accessor :tags

      # @return [ConnectionMonitorSource] Describes the source of connection
      # monitor.
      attr_accessor :source

      # @return [ConnectionMonitorDestination] Describes the destination of
      # connection monitor.
      attr_accessor :destination

      # @return [Boolean] Determines if the connection monitor will start
      # automatically once created. Default value: true .
      attr_accessor :auto_start

      # @return [Integer] Monitoring interval in seconds. Default value: 60 .
      attr_accessor :monitoring_interval_in_seconds

      # @return [Array<ConnectionMonitorEndpoint>] List of connection monitor
      # endpoints.
      attr_accessor :endpoints

      # @return [Array<ConnectionMonitorTestConfiguration>] List of connection
      # monitor test configurations.
      attr_accessor :test_configurations

      # @return [Array<ConnectionMonitorTestGroup>] List of connection monitor
      # test groups.
      attr_accessor :test_groups

      # @return [Array<ConnectionMonitorOutput>] List of connection monitor
      # outputs.
      attr_accessor :outputs

      # @return [String] Optional notes to be associated with the connection
      # monitor.
      attr_accessor :notes


      #
      # Mapper for ConnectionMonitor class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'ConnectionMonitor',
          type: {
            name: 'Composite',
            class_name: 'ConnectionMonitor',
            model_properties: {
              location: {
                client_side_validation: true,
                required: false,
                serialized_name: 'location',
                type: {
                  name: 'String'
                }
              },
              tags: {
                client_side_validation: true,
                required: false,
                serialized_name: 'tags',
                type: {
                  name: 'Dictionary',
                  value: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'StringElementType',
                      type: {
                        name: 'String'
                      }
                  }
                }
              },
              source: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.source',
                type: {
                  name: 'Composite',
                  class_name: 'ConnectionMonitorSource'
                }
              },
              destination: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.destination',
                type: {
                  name: 'Composite',
                  class_name: 'ConnectionMonitorDestination'
                }
              },
              auto_start: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.autoStart',
                default_value: true,
                type: {
                  name: 'Boolean'
                }
              },
              monitoring_interval_in_seconds: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.monitoringIntervalInSeconds',
                default_value: 60,
                type: {
                  name: 'Number'
                }
              },
              endpoints: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.endpoints',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ConnectionMonitorEndpointElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ConnectionMonitorEndpoint'
                      }
                  }
                }
              },
              test_configurations: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.testConfigurations',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ConnectionMonitorTestConfigurationElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ConnectionMonitorTestConfiguration'
                      }
                  }
                }
              },
              test_groups: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.testGroups',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ConnectionMonitorTestGroupElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ConnectionMonitorTestGroup'
                      }
                  }
                }
              },
              outputs: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.outputs',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'ConnectionMonitorOutputElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'ConnectionMonitorOutput'
                      }
                  }
                }
              },
              notes: {
                client_side_validation: true,
                required: false,
                serialized_name: 'properties.notes',
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
