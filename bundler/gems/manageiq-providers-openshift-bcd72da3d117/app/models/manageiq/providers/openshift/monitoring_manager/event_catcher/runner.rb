class ManageIQ::Providers::Openshift::MonitoringManager::EventCatcher::Runner < ManageIQ::Providers::BaseManager::EventCatcher::Runner
  include ManageIQ::Providers::Kubernetes::MonitoringManager::EventCatcher::RunnerMixin
end
