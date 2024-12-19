# -*- encoding: utf-8 -*-
# stub: manageiq-providers-vmware 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-vmware".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the VMware provider.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/models/manageiq/providers/vmware/cloud_manager.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/availability_zone.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/event_catcher/event.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/event_catcher/stream.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/event_catcher_mixin.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/event_parser.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/manager_events_mixin.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/orchestration_service_option_converter.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/orchestration_stack.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/orchestration_stack/status.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/orchestration_template.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/ovf_template.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/refresher.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/snapshot.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/template.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/vm.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/vm/operations.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/vm/operations/power.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/vm/operations/snapshot.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/vm/reconfigure.rb".freeze, "app/models/manageiq/providers/vmware/cloud_manager/vm/remote_console.rb".freeze, "app/models/manageiq/providers/vmware/container_manager.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/container.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/container_group.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/container_node.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/container_template.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/event_parser.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/refresh_worker/watch_thread.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/refresher.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/service_instance.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/service_offering.rb".freeze, "app/models/manageiq/providers/vmware/container_manager/service_parameters_set.rb".freeze, "app/models/manageiq/providers/vmware/discovery.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/cis_connect_mixin.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/cluster.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/datacenter.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/distributed_virtual_switch.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/ems_ref_obj_mixin.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/event_parser.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/folder.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/host.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/host_esx.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/host_virtual_switch.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/cache.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/collector.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/collector/property_collector.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/parser.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/parser/compute_resource.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/parser/datastore.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/parser/distributed_virtual_switch.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/parser/host_system.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/parser/resource_pool.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/parser/virtual_machine.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/persister.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/persister/batch.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/persister/full.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/persister/targeted.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/inventory/saver.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/metrics_capture.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/metrics_collector_worker.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/metrics_collector_worker/runner.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/opaque_switch.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/operations_worker.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/operations_worker/runner.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/orchestration_template.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/ovf_service.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/ovf_service_template.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision/cloning.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision/configuration.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision/configuration/container.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision/configuration/disk.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision/configuration/network.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision/customization.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision/placement.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision/state_machine.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision_via_pxe.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision_via_pxe/cloning.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision_via_pxe/pxe.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision_via_pxe/state_machine.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision_workflow.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/provision_workflow/dialog_field_validation.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/refresh_parser.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/refresher.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/resource_pool.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/scanning.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/scanning/job.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/snapshot.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/storage.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/storage_cluster.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/template.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/template/scanning.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vim_connect_mixin.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm/operations.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm/operations/guest.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm/operations/snapshot.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm/reconfigure.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm/remote_console.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm/scanning.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm_or_template_shared.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm_or_template_shared/disconnect.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm_or_template_shared/operations.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm_or_template_shared/operations/configuration.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm_or_template_shared/operations/power.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm_or_template_shared/operations/relocation.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm_or_template_shared/refresh_on_scan.rb".freeze, "app/models/manageiq/providers/vmware/infra_manager/vm_or_template_shared/scanning.rb".freeze, "app/models/manageiq/providers/vmware/inventory.rb".freeze, "app/models/manageiq/providers/vmware/inventory/collector.rb".freeze, "app/models/manageiq/providers/vmware/inventory/collector/cloud_manager.rb".freeze, "app/models/manageiq/providers/vmware/inventory/collector/container_manager.rb".freeze, "app/models/manageiq/providers/vmware/inventory/collector/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/vmware/inventory/collector/network_manager.rb".freeze, "app/models/manageiq/providers/vmware/inventory/parser.rb".freeze, "app/models/manageiq/providers/vmware/inventory/parser/cloud_manager.rb".freeze, "app/models/manageiq/providers/vmware/inventory/parser/container_manager.rb".freeze, "app/models/manageiq/providers/vmware/inventory/parser/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/vmware/inventory/parser/network_manager.rb".freeze, "app/models/manageiq/providers/vmware/inventory/persister.rb".freeze, "app/models/manageiq/providers/vmware/inventory/persister/cloud_manager.rb".freeze, "app/models/manageiq/providers/vmware/inventory/persister/container_manager.rb".freeze, "app/models/manageiq/providers/vmware/inventory/persister/container_manager/watch_notice.rb".freeze, "app/models/manageiq/providers/vmware/inventory/persister/network_manager.rb".freeze, "app/models/manageiq/providers/vmware/manager_auth_mixin.rb".freeze, "app/models/manageiq/providers/vmware/network_manager.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/cloud_network.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/cloud_network/org_vdc_net.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/cloud_network/vapp_net.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/cloud_subnet.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/floating_ip.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/load_balancer.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/load_balancer_health_check.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/load_balancer_listener.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/load_balancer_pool.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/load_balancer_pool_member.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/network_port.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/network_router.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/refresher.rb".freeze, "app/models/manageiq/providers/vmware/network_manager/security_group.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/property_specs/ems_inventory.yml".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "config/traversal_specs/root_folder.yml".freeze, "content/miq_dialogs/miq_provision_vmware_cluster_dialogs_template.yaml".freeze, "content/miq_dialogs/miq_provision_vmware_dialogs_clone_to_template.yaml".freeze, "content/miq_dialogs/miq_provision_vmware_dialogs_clone_to_vm.yaml".freeze, "content/miq_dialogs/miq_provision_vmware_dialogs_ovf.yaml".freeze, "content/miq_dialogs/miq_provision_vmware_dialogs_template.yaml".freeze, "content/miq_dialogs/miq_provision_vmware_folder_dialogs_template.yaml".freeze, "lib/manageiq/providers/vmware.rb".freeze, "lib/manageiq/providers/vmware/engine.rb".freeze, "lib/manageiq/providers/vmware/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/vmware.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-vmware.gemspec".freeze, "systemd/manageiq-providers-vmware_cloud_manager_event_catcher.target".freeze, "systemd/manageiq-providers-vmware_cloud_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-vmware_cloud_manager_refresh.target".freeze, "systemd/manageiq-providers-vmware_cloud_manager_refresh@.service".freeze, "systemd/manageiq-providers-vmware_container_manager_event_catcher.target".freeze, "systemd/manageiq-providers-vmware_container_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-vmware_container_manager_refresh.target".freeze, "systemd/manageiq-providers-vmware_container_manager_refresh@.service".freeze, "systemd/manageiq-providers-vmware_infra_manager_event_catcher.target".freeze, "systemd/manageiq-providers-vmware_infra_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-vmware_infra_manager_metrics_collector.target".freeze, "systemd/manageiq-providers-vmware_infra_manager_metrics_collector@.service".freeze, "systemd/manageiq-providers-vmware_infra_manager_operations.target".freeze, "systemd/manageiq-providers-vmware_infra_manager_operations@.service".freeze, "systemd/manageiq-providers-vmware_infra_manager_refresh.target".freeze, "systemd/manageiq-providers-vmware_infra_manager_refresh@.service".freeze, "tools/event_history.rb".freeze, "workers/event_catcher/event_catcher.rb".freeze, "workers/event_catcher/event_parser.rb".freeze, "workers/event_catcher/worker".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-vmware".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the VMware provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fog-vcloud-director>.freeze, ["~> 0.3.0"])
    s.add_runtime_dependency(%q<ffi-vix_disk_lib>.freeze, ["~> 1.1"])
    s.add_runtime_dependency(%q<rbvmomi2>.freeze, ["~> 3.5"])
    s.add_runtime_dependency(%q<vmware_web_service>.freeze, ["~> 3.2"])
    s.add_runtime_dependency(%q<vsphere-automation-sdk>.freeze, ["~> 0.4.7"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<fog-vcloud-director>.freeze, ["~> 0.3.0"])
    s.add_dependency(%q<ffi-vix_disk_lib>.freeze, ["~> 1.1"])
    s.add_dependency(%q<rbvmomi2>.freeze, ["~> 3.5"])
    s.add_dependency(%q<vmware_web_service>.freeze, ["~> 3.2"])
    s.add_dependency(%q<vsphere-automation-sdk>.freeze, ["~> 0.4.7"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
