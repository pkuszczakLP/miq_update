ManageIQ::Providers::Openstack::NetworkManager::CloudNetwork.include(ActsAsStiLeafClass)

class ManageIQ::Providers::IbmPowerVc::NetworkManager::CloudNetwork < ManageIQ::Providers::Openstack::NetworkManager::CloudNetwork
  require_nested :Private
  require_nested :Public
end
