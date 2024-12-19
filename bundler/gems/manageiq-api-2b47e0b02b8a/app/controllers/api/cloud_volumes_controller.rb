module Api
  class CloudVolumesController < BaseProviderController
    include Subcollections::Tags
    include Subcollections::CloudVolumeSnapshots

    def create_resource(type, _id = nil, data = {})
      create_ems_resource(type, data, :supports => true) do |ems, klass|
        {:task_id => klass.create_volume_queue(User.current_userid, ems, data)}
      end
    end

    def edit_resource(type, id, data = {})
      api_resource(type, id, "Updating", :supports => :update) do |cloud_volume|
        {:task_id => cloud_volume.update_volume_queue(User.current_userid, data.deep_symbolize_keys)}
      end
    end

    def safe_delete_resource(type, id, _data = {})
      api_resource(type, id, "Deleting", :supports => :safe_delete) do |cloud_volume|
        {:task_id => cloud_volume.safe_delete_volume_queue(User.current_userid)}
      end
    end

    def delete_resource_main_action(_type, cloud_volume, _data)
      # TODO: ensure_supports(type, cloud_volume, :delete)
      {:task_id => cloud_volume.delete_volume_queue(User.current_userid)}
    end

    def create_backup_resource(type, id, data)
      api_resource(type, id, "Creating backup", :supports => :backup_create) do |cloud_volume|
        {:task_id => cloud_volume.backup_create_queue(User.current_userid, data['resources'])}
      end
    end

    def restore_backup_resource(type, id, data)
      api_resource(type, id, "Restoring backup for", :supports => :backup_restore) do |cloud_volume|
        backup = cloud_volume.cloud_volume_backups.where(:id => data['resources']['backup_id']).first
        {:task_id => cloud_volume.backup_restore_queue(User.current_userid, backup['ems_ref'])}
      end
    end

    def attach_resource(type, id, data = {})
      api_resource(type, id, "Attaching Resource to", :supports => :attach) do |cloud_volume|
        raise BadRequestError, "Must specify a vm_id" if data["vm_id"].blank?

        vm = resource_search(data["vm_id"], :vms)
        {:task_id => cloud_volume.attach_volume_queue(User.current_userid, vm.ems_ref, data["device"].presence)}
      end
    rescue => err
      action_result(false, err.to_s)
    end

    def detach_resource(type, id, data = {})
      api_resource(type, id, "Detaching Resource from", :supports => :detach) do |cloud_volume|
        raise BadRequestError, "Must specify a vm_id" if data["vm_id"].blank?

        vm = resource_search(data["vm_id"], :vms)
        {:task_id => cloud_volume.detach_volume_queue(User.current_userid, vm.ems_ref)}
      end
    rescue => err
      action_result(false, err.to_s)
    end

    def clone_resource(type, id, data = {})
      api_resource(type, id, "Cloning Resource from", :supports => :clone) do |cloud_volume|
        raise BadRequestError, "Must specify a name" if data["name"].blank?

        {:task_id => cloud_volume.clone_volume_queue(User.current_userid, data)}
      end
    rescue => err
      action_result(false, err.to_s)
    end
  end
end
