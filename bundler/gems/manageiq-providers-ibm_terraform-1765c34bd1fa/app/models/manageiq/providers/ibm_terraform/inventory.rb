class ManageIQ::Providers::IbmTerraform::Inventory < ManageIQ::Providers::Inventory
  require_nested :Collector
  require_nested :Parser
  require_nested :Persister
end
