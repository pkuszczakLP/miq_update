ManageIQ::Providers::Ovirt::NetworkManager.include(ActsAsStiLeafClass)

class ManageIQ::Providers::Redhat::NetworkManager < ManageIQ::Providers::Ovirt::NetworkManager
  require_nested :CloudNetwork
  require_nested :CloudSubnet
  require_nested :FloatingIp
  require_nested :NetworkPort
  require_nested :NetworkRouter
  require_nested :RefreshWorker
  require_nested :Refresher
  require_nested :SecurityGroup

  include ManageIQ::Providers::Openstack::ManagerMixin
  include SupportsFeatureMixin

  def self.ems_type
    @ems_type ||= "redhat_network".freeze
  end

  def self.description
    @description ||= "Redhat Network".freeze
  end
end
