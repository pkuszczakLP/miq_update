# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2020_12_01
  module Models
    #
    # Describes the properties of an AssessPatches result.
    #
    class VirtualMachineAssessPatchesResult

      include MsRestAzure

      # @return [PatchOperationStatus] The overall success or failure status of
      # the operation. It remains "InProgress" until the operation completes.
      # At that point it will become "Unknown", "Failed", "Succeeded", or
      # "CompletedWithWarnings.". Possible values include: 'Unknown',
      # 'InProgress', 'Failed', 'Succeeded', 'CompletedWithWarnings'
      attr_accessor :status

      # @return [String] The activity ID of the operation that produced this
      # result. It is used to correlate across CRP and extension logs.
      attr_accessor :assessment_activity_id

      # @return [Boolean] The overall reboot status of the VM. It will be true
      # when partially installed patches require a reboot to complete
      # installation but the reboot has not yet occurred.
      attr_accessor :reboot_pending

      # @return [Integer] The number of critical or security patches that have
      # been detected as available and not yet installed.
      attr_accessor :critical_and_security_patch_count

      # @return [Integer] The number of all available patches excluding
      # critical and security.
      attr_accessor :other_patch_count

      # @return [DateTime] The UTC timestamp when the operation began.
      attr_accessor :start_date_time

      # @return [Array<VirtualMachineSoftwarePatchProperties>] The list of
      # patches that have been detected as available for installation.
      attr_accessor :available_patches

      # @return [ApiError] The errors that were encountered during execution of
      # the operation. The details array contains the list of them.
      attr_accessor :error


      #
      # Mapper for VirtualMachineAssessPatchesResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineAssessPatchesResult',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineAssessPatchesResult',
            model_properties: {
              status: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'status',
                type: {
                  name: 'String'
                }
              },
              assessment_activity_id: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'assessmentActivityId',
                type: {
                  name: 'String'
                }
              },
              reboot_pending: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'rebootPending',
                type: {
                  name: 'Boolean'
                }
              },
              critical_and_security_patch_count: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'criticalAndSecurityPatchCount',
                type: {
                  name: 'Number'
                }
              },
              other_patch_count: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'otherPatchCount',
                type: {
                  name: 'Number'
                }
              },
              start_date_time: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'startDateTime',
                type: {
                  name: 'DateTime'
                }
              },
              available_patches: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'availablePatches',
                type: {
                  name: 'Sequence',
                  element: {
                      client_side_validation: true,
                      required: false,
                      serialized_name: 'VirtualMachineSoftwarePatchPropertiesElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'VirtualMachineSoftwarePatchProperties'
                      }
                  }
                }
              },
              error: {
                client_side_validation: true,
                required: false,
                read_only: true,
                serialized_name: 'error',
                type: {
                  name: 'Composite',
                  class_name: 'ApiError'
                }
              }
            }
          }
        }
      end
    end
  end
end
