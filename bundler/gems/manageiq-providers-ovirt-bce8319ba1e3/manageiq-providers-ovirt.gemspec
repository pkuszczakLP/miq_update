# -*- encoding: utf-8 -*-
# stub: manageiq-providers-ovirt 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-ovirt".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the oVirt provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/ovirt/connection_manager.rb".freeze, "app/models/manageiq/providers/ovirt/dialog_field_visibility_service.rb".freeze, "app/models/manageiq/providers/ovirt/discovery.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/admin_ui.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/api_integration.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/cluster.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/datacenter.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/disk_attachment_builder.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/distributed_virtual_switch.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/event_fetcher.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/event_parser.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/event_target_parser.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/external_distributed_virtual_switch.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/folder.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/futures_collector.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/host.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/inventory.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/inventory/disks_helper.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/iso_datastore.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/metrics_capture.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/metrics_collector_worker.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/metrics_collector_worker/runner.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/ovirt_services.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision/cloning.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision/configuration.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision/configuration/container.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision/configuration/network.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision/disk.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision/placement.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision/state_machine.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_via_iso.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_via_iso/cloning.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_via_iso/configuration.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_via_iso/state_machine.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_via_pxe.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_via_pxe/cloning.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_via_pxe/configuration.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_via_pxe/state_machine.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_workflow.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/provision_workflow/dialog_field_validation.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/refresher.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/resource_pool.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/scanning.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/scanning/job.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/snapshot.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/snapshot_disks_mixin.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/storage.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/template.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm/operations.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm/operations/configuration.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm/operations/guest.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm/operations/power.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm/operations/relocation.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm/operations/snapshot.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm/reconfigure.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm/remote_console.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm_or_template_shared.rb".freeze, "app/models/manageiq/providers/ovirt/infra_manager/vm_or_template_shared/scanning.rb".freeze, "app/models/manageiq/providers/ovirt/inventory.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/collector.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/collector/infra_manager.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/collector/network_manager.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/collector/target_collection.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/parser.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/parser/infra_manager.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/parser/network_manager.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/persister.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/persister/definitions/network_collections.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/persister/infra_manager.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/persister/network_manager.rb".freeze, "app/models/manageiq/providers/ovirt/inventory/persister/target_collection.rb".freeze, "app/models/manageiq/providers/ovirt/linked_clone_visibility_service.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/cloud_network.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/cloud_network/private.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/cloud_network/public.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/cloud_subnet.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/floating_ip.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/metrics_collector_worker/runner.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/network_port.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/network_router.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/refresher.rb".freeze, "app/models/manageiq/providers/ovirt/network_manager/security_group.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "content/miq_dialogs/miq_provision_ovirt_dialogs_clone_to_template.yaml".freeze, "content/miq_dialogs/miq_provision_ovirt_dialogs_clone_to_vm.yaml".freeze, "content/miq_dialogs/miq_provision_ovirt_dialogs_template.yaml".freeze, "lib/manageiq/providers/ovirt.rb".freeze, "lib/manageiq/providers/ovirt/engine.rb".freeze, "lib/manageiq/providers/ovirt/legacy/event_monitor.rb".freeze, "lib/manageiq/providers/ovirt/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/ovirt.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-ovirt.gemspec".freeze, "systemd/manageiq-providers-ovirt_infra_manager_event_catcher.target".freeze, "systemd/manageiq-providers-ovirt_infra_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-ovirt_infra_manager_metrics_collector.target".freeze, "systemd/manageiq-providers-ovirt_infra_manager_metrics_collector@.service".freeze, "systemd/manageiq-providers-ovirt_infra_manager_refresh.target".freeze, "systemd/manageiq-providers-ovirt_infra_manager_refresh@.service".freeze, "systemd/manageiq-providers-ovirt_network_manager_refresh.target".freeze, "systemd/manageiq-providers-ovirt_network_manager_refresh@.service".freeze, "tools/handle_rhv_storage_duplication.rb".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-ovirt".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the oVirt provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ovirt-engine-sdk>.freeze, ["~> 4.4.0"])
    s.add_runtime_dependency(%q<ovirt_metrics>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<ovirt-engine-sdk>.freeze, ["~> 4.4.0"])
    s.add_dependency(%q<ovirt_metrics>.freeze, ["~> 3.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end