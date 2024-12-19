# -*- encoding: utf-8 -*-
# stub: manageiq-providers-google 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-google".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the Google provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/google/cloud_manager.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/auth_key_pair.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/availability_zone.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/cloud_database.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/cloud_database_flavor.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/cloud_volume.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/cloud_volume_snapshot.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/event_catcher/stream.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/event_parser.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/flavor.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/metrics_capture.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/metrics_collector_worker.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/metrics_collector_worker/runner.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/provision.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/provision/cloning.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/provision/disk.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/provision/state_machine.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/provision_workflow.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/refresher.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/template.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/vm.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/vm/operations.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/vm/operations/guest.rb".freeze, "app/models/manageiq/providers/google/cloud_manager/vm/operations/power.rb".freeze, "app/models/manageiq/providers/google/container_manager.rb".freeze, "app/models/manageiq/providers/google/container_manager/container.rb".freeze, "app/models/manageiq/providers/google/container_manager/container_group.rb".freeze, "app/models/manageiq/providers/google/container_manager/container_node.rb".freeze, "app/models/manageiq/providers/google/container_manager/container_template.rb".freeze, "app/models/manageiq/providers/google/container_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/google/container_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/google/container_manager/event_parser.rb".freeze, "app/models/manageiq/providers/google/container_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/google/container_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/google/container_manager/refresh_worker/watch_thread.rb".freeze, "app/models/manageiq/providers/google/container_manager/refresher.rb".freeze, "app/models/manageiq/providers/google/container_manager/service_instance.rb".freeze, "app/models/manageiq/providers/google/container_manager/service_offering.rb".freeze, "app/models/manageiq/providers/google/container_manager/service_parameters_set.rb".freeze, "app/models/manageiq/providers/google/event_catcher_mixin.rb".freeze, "app/models/manageiq/providers/google/inventory.rb".freeze, "app/models/manageiq/providers/google/inventory/collector.rb".freeze, "app/models/manageiq/providers/google/inventory/collector/cloud_manager.rb".freeze, "app/models/manageiq/providers/google/inventory/collector/container_manager.rb".freeze, "app/models/manageiq/providers/google/inventory/collector/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/google/inventory/collector/network_manager.rb".freeze, "app/models/manageiq/providers/google/inventory/parser.rb".freeze, "app/models/manageiq/providers/google/inventory/parser/cloud_manager.rb".freeze, "app/models/manageiq/providers/google/inventory/parser/container_manager.rb".freeze, "app/models/manageiq/providers/google/inventory/parser/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/google/inventory/parser/network_manager.rb".freeze, "app/models/manageiq/providers/google/inventory/persister.rb".freeze, "app/models/manageiq/providers/google/inventory/persister/cloud_manager.rb".freeze, "app/models/manageiq/providers/google/inventory/persister/container_manager.rb".freeze, "app/models/manageiq/providers/google/inventory/persister/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/google/inventory/persister/network_manager.rb".freeze, "app/models/manageiq/providers/google/manager_mixin.rb".freeze, "app/models/manageiq/providers/google/network_manager.rb".freeze, "app/models/manageiq/providers/google/network_manager/cloud_network.rb".freeze, "app/models/manageiq/providers/google/network_manager/cloud_subnet.rb".freeze, "app/models/manageiq/providers/google/network_manager/floating_ip.rb".freeze, "app/models/manageiq/providers/google/network_manager/load_balancer.rb".freeze, "app/models/manageiq/providers/google/network_manager/load_balancer_health_check.rb".freeze, "app/models/manageiq/providers/google/network_manager/load_balancer_listener.rb".freeze, "app/models/manageiq/providers/google/network_manager/load_balancer_pool.rb".freeze, "app/models/manageiq/providers/google/network_manager/load_balancer_pool_member.rb".freeze, "app/models/manageiq/providers/google/network_manager/network_port.rb".freeze, "app/models/manageiq/providers/google/network_manager/network_router.rb".freeze, "app/models/manageiq/providers/google/network_manager/security_group.rb".freeze, "app/models/manageiq/providers/google/resource.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "lib/manageiq/providers/google.rb".freeze, "lib/manageiq/providers/google/engine.rb".freeze, "lib/manageiq/providers/google/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/google.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-google.gemspec".freeze, "systemd/manageiq-providers-google_cloud_manager_event_catcher.target".freeze, "systemd/manageiq-providers-google_cloud_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-google_cloud_manager_metrics_collector.target".freeze, "systemd/manageiq-providers-google_cloud_manager_metrics_collector@.service".freeze, "systemd/manageiq-providers-google_cloud_manager_refresh.target".freeze, "systemd/manageiq-providers-google_cloud_manager_refresh@.service".freeze, "systemd/manageiq-providers-google_container_manager_event_catcher.target".freeze, "systemd/manageiq-providers-google_container_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-google_container_manager_refresh.target".freeze, "systemd/manageiq-providers-google_container_manager_refresh@.service".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-google".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the Google provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fog-google>.freeze, ["~> 1.18"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<fog-google>.freeze, ["~> 1.18"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end