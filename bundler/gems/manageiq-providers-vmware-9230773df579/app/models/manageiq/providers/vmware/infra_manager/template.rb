class ManageIQ::Providers::Vmware::InfraManager::Template < ManageIQ::Providers::InfraManager::Template
  include_concern 'ManageIQ::Providers::Vmware::InfraManager::VmOrTemplateShared'

  include_concern 'Scanning'

  supports :provisioning do
    if ext_management_system
      unsupported_reason_add(:provisioning, ext_management_system.unsupported_reason(:provisioning)) unless ext_management_system.supports?(:provisioning)
    else
      unsupported_reason_add(:provisioning, _('not connected to ems'))
    end
  end

  supports :terminate
  supports :rename
  supports :set_description
end
