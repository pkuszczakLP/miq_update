module MiqAeMethodService
  class MiqAeServiceLoadBalancer < MiqAeServiceModelBase
    require_relative "mixins/miq_ae_service_retirement_mixin"
    include MiqAeServiceRetirementMixin
    require_relative "mixins/miq_ae_service_remove_from_vmdb_mixin"
    include MiqAeServiceRemoveFromVmdb

    expose :ems_ref
    expose :raw_delete_load_balancer
    expose :raw_update_load_balancer
    expose :raw_exists?

    def add_to_service(service)
      error_msg = "service must be a MiqAeServiceService"
      raise ArgumentError, error_msg unless service.kind_of?(MiqAeMethodService::MiqAeServiceService)

      ar_method { wrap_results(Service.find_by(:id => service.id).add_resource!(@object)) }
    end

    def normalized_live_status
      @object.raw_status
    rescue MiqException::MiqLoadBalancerNotExistError => err
      ['not_exist', err.message]
    end
  end
end
