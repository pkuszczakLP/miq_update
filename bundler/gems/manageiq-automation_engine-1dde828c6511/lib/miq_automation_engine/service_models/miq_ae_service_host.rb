module MiqAeMethodService
  class MiqAeServiceHost < MiqAeServiceModelBase
    require_relative "mixins/miq_ae_service_custom_attribute_mixin"
    include MiqAeServiceCustomAttributeMixin
    require_relative "mixins/miq_ae_service_ems_operations_mixin"
    include MiqAeServiceEmsOperationsMixin
    require_relative "mixins/miq_ae_service_remove_from_vmdb_mixin"
    include MiqAeServiceRemoveFromVmdb

    expose :read_only_storages
    expose :writable_storages,                                :method => :writable_accessible_storages
    expose :ems_folder,            :association => true,      :method => :owning_folder
    expose :datacenter,            :association => true,      :method => :owning_datacenter
    expose :authentication_userid
    expose :authentication_password
    expose :event_log_threshold?
    expose :to_s
    expose :domain
    expose :set_node_maintenance
    expose :unset_node_maintenance
    expose :external_get_node_maintenance

    METHODS_WITH_NO_ARGS = %w[scan].freeze
    METHODS_WITH_NO_ARGS.each do |m|
      define_method(m) do
        sync_or_async_ems_operation(false, m)
        true
      end
    end

    def credentials(type = :remote)
      object_send(:auth_user_pwd, type)
    end

    def ems_custom_keys
      ar_method do
        @object.ems_custom_attributes.collect(&:name)
      end
    end

    def ems_custom_get(key)
      ar_method do
        c1 = @object.ems_custom_attributes.find_by(:name => key.to_s)
        c1.try(:value)
      end
    end

    def ems_custom_set(attribute, value)
      sync_or_async_ems_operation(false, 'set_custom_field', [attribute, value])
      true
    end

    def ssh_exec(script)
      object_send(:ssh_run_script, script)
    end

    def get_realtime_metric(metric, range, function)
      object_send(:get_performance_metric, :realtime, metric, range, function)
    end

    def current_memory_usage
      object_send(:current_memory_usage)
    end

    def current_cpu_usage
      object_send(:current_cpu_usage)
    end

    def current_memory_headroom
      object_send(:current_memory_headroom)
    end

    def show_url
      URI.join(MiqRegion.my_region.remote_ui_url, "host/show/#{@object.id}").to_s
    end
  end
end
