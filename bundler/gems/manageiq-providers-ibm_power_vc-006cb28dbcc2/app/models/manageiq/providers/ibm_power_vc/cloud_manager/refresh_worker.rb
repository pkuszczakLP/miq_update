class ManageIQ::Providers::IbmPowerVc::CloudManager::RefreshWorker < ManageIQ::Providers::BaseManager::RefreshWorker
  require_nested :Runner

  def self.settings_name
    :ems_refresh_worker_ibm_power_vc
  end
end
