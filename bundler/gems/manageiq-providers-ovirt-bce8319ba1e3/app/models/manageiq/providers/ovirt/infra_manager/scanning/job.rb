class ManageIQ::Providers::Ovirt::InfraManager::Scanning::Job < VmScan
  def config_ems_list
    super.tap do |ems_list|
      ems_list['connect'] = false
    end
  end

  def create_scan_args
    super.tap do |scan_args|
      scan_args['permissions'] = {'group' => 36}
    end
  end
end
