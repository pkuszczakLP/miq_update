class ManageIQ::Providers::Awx::AutomationManager::ConfiguredSystem <
  ManageIQ::Providers::ExternalAutomationManager::ConfiguredSystem
  include ProviderObjectMixin

  def self.display_name(number = 1)
    n_('Configured System (AWX)', 'Configured Systems (AWX)', number)
  end

  def provider_object(connection = nil)
    (connection || connection_source.connect).api.hosts.find(manager_ref)
  end

  def ext_management_system
    manager
  end

  private

  def connection_source(options = {})
    options[:connection_source] || manager
  end
end
