ManageIQ::Providers::Openstack::NetworkManager::EventCatcher.include(ActsAsStiLeafClass)

class ManageIQ::Providers::IbmCic::NetworkManager::EventCatcher < ManageIQ::Providers::Openstack::NetworkManager::EventCatcher
  require_nested :Runner

  def self.settings_name
    :event_catcher_ibm_cic_network
  end
end
