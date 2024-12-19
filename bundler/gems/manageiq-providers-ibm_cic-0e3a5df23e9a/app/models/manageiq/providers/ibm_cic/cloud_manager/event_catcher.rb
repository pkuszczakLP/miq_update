ManageIQ::Providers::Openstack::CloudManager::EventCatcher.include(ActsAsStiLeafClass)

class ManageIQ::Providers::IbmCic::CloudManager::EventCatcher < ManageIQ::Providers::Openstack::CloudManager::EventCatcher
  require_nested :Runner

  def self.settings_name
    :event_catcher_ibm_cic
  end
end
