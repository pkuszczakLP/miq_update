# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::Compute::Mgmt::V2019_07_01
  module Models
    #
    # Describes a virtual machine scale set operating system disk.
    #
    class VirtualMachineScaleSetOSDisk

      include MsRestAzure

      # @return [String] The disk name.
      attr_accessor :name

      # @return [CachingTypes] Specifies the caching requirements. <br><br>
      # Possible values are: <br><br> **None** <br><br> **ReadOnly** <br><br>
      # **ReadWrite** <br><br> Default: **None for Standard storage. ReadOnly
      # for Premium storage**. Possible values include: 'None', 'ReadOnly',
      # 'ReadWrite'
      attr_accessor :caching

      # @return [Boolean] Specifies whether writeAccelerator should be enabled
      # or disabled on the disk.
      attr_accessor :write_accelerator_enabled

      # @return [DiskCreateOptionTypes] Specifies how the virtual machines in
      # the scale set should be created.<br><br> The only allowed value is:
      # **FromImage** \u2013 This value is used when you are using an image to
      # create the virtual machine. If you are using a platform image, you also
      # use the imageReference element described above. If you are using a
      # marketplace image, you  also use the plan element previously described.
      # Possible values include: 'FromImage', 'Empty', 'Attach'
      attr_accessor :create_option

      # @return [DiffDiskSettings] Specifies the ephemeral disk Settings for
      # the operating system disk used by the virtual machine scale set.
      attr_accessor :diff_disk_settings

      # @return [Integer] Specifies the size of the operating system disk in
      # gigabytes. This element can be used to overwrite the size of the disk
      # in a virtual machine image. <br><br> This value cannot be larger than
      # 1023 GB
      attr_accessor :disk_size_gb

      # @return [OperatingSystemTypes] This property allows you to specify the
      # type of the OS that is included in the disk if creating a VM from
      # user-image or a specialized VHD. <br><br> Possible values are: <br><br>
      # **Windows** <br><br> **Linux**. Possible values include: 'Windows',
      # 'Linux'
      attr_accessor :os_type

      # @return [VirtualHardDisk] Specifies information about the unmanaged
      # user image to base the scale set on.
      attr_accessor :image

      # @return [Array<String>] Specifies the container urls that are used to
      # store operating system disks for the scale set.
      attr_accessor :vhd_containers

      # @return [VirtualMachineScaleSetManagedDiskParameters] The managed disk
      # parameters.
      attr_accessor :managed_disk


      #
      # Mapper for VirtualMachineScaleSetOSDisk class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          client_side_validation: true,
          required: false,
          serialized_name: 'VirtualMachineScaleSetOSDisk',
          type: {
            name: 'Composite',
            class_name: 'VirtualMachineScaleSetOSDisk',
            model_properties: {
              name: {
                client_side_validation: true,
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              caching: {
                client_side_validation: true,
                required: false,
                serialized_name: 'caching',
                type: {
                  name: 'Enum',
                  module: 'CachingTypes'
                }
              },
              write_accelerator_enabled: {
                client_side_validation: true,
                required: false,
                serialized_name: 'writeAcceleratorEnabled',
                type: {
                  name: 'Boolean'
                }
              },
              create_option: {
                client_side_validation: true,
                required: true,
                serialized_name: 'createOption',
                type: {
                  name: 'String'
                }
              },
              diff_disk_settings: {
                client_side_validation: true,
                required: false,
                serialized_name: 'diffDiskSettings',
                type: {
                  name: 'Composite',
                  class_name: 'DiffDiskSettings'
                }
              },
              disk_size_gb: {
                client_side_validation: true,
                required: false,
                serialized_name: 'diskSizeGB',
                type: {
                  name: 'Number'
                }
              },
              os_type: {
                client_side_validation: true,
                required: false,
                serialized_name: 'osType',
                type: {
                  name: 'Enum',
                  module: 'OperatingSystemTypes'
                }
              },
              image: {
                client_side_validation: true,
                required: false,
                serialized_name: 'image',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualHardDisk'
                }
              },
              vhd_containers: {
                client_side_validation: true,
                required: false,
                serialized_name: 'vhdContainers',
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
              managed_disk: {
                client_side_validation: true,
                required: false,
                serialized_name: 'managedDisk',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualMachineScaleSetManagedDiskParameters'
                }
              }
            }
          }
        }
      end
    end
  end
end
