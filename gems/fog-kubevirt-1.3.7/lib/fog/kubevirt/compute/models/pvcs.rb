require 'fog/core/collection'
require 'fog/kubevirt/compute/models/pvc'
require 'fog/kubevirt/compute/utils/unit_converter'

module Fog
  module Kubevirt
    class Compute
      class Pvcs < Fog::Collection

        attr_reader :kind, :resource_version

        model Fog::Kubevirt::Compute::Pvc

        def all(filters = {})
          pvcs = service.list_pvcs(filters)
          @kind = pvcs.kind
          @resource_version = pvcs.resource_version
          load pvcs
        end

        def get(name)
          new service.get_pvc(name)
        end

        # Creates a pvc using provided paramters:
        # https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims
        # :name [String] - name of a pvc
        # :namespace [String] - the namespace of the PVC, should be the same as POD's pvc
        # :storage_class [String] - the storage class name of the pvc
        # :volume_name [String] - The volume name to
        # :volume_mode [String] - Filesystem or block device
        # :accessModes [Arr] - the access modes for the volume, values are specified here:
        # :requests [Hash] - the request for storage resource, i.e. { :storage => "20Gi" }
        # :limits [Hash] - the maximum amount of storage to consume, i.e. { :storage => "20Gi" }
        # :match_labels [Hash] - label query over volumes for binding
        # :match_expressions [Hash] - list of label selector requirements
        # @param [Hash] attributes containing details about pvc to be created.
        def create(args = {})
          name = args[:name]

          pvc = {
            :apiVersion => "v1",
            :kind => "PersistentVolumeClaim",
            :metadata => {
              :name      => name,
              :namespace => args[:namespace]
            },
            :spec => {
              :storageClassName => args[:storage_class],
              :resources        => {}
            }
          }

          # requests is required
          check_size(args[:requests])
          pvc[:spec][:resources].merge!(:requests => args[:requests])
          check_size(args[:limits]) if args[:limits]
          pvc[:spec][:resources].merge!(:limits => args[:limits]) if args[:limits]

          if args[:match_labels] || args[:match_expressions]
            pvc[:spec][:selector] = {}
            pvc[:spec][:selector].merge!(:matchLabels => args[:match_labels]) if args[:match_labels]
            pvc[:spec][:selector].merge!(:matchExpressions => args[:match_expressions]) if args[:match_expressions]
          end

          # access mode is required
          pvc[:spec][:accessModes] = args[:access_modes]
          pvc[:spec][:volumeMode] = args[:volume_mode] if args[:volume_mode]
          pvc[:spec][:volumeName] = args[:volume_name] if args[:volume_name]
          service.create_pvc(pvc)
        end

        def delete(name)
          begin
            pvc = get(name)
          rescue ::Fog::Kubevirt::Errors::ClientError
            # the pvc doesn't exist
            pvc = nil
          end

          service.delete_pvc(name) unless pvc.nil?
        end

        private

        def check_size(value)
          ::Fog::Kubevirt::Utils::UnitConverter.validate(value[:storage])
        end
      end
    end
  end
end
