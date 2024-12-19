# -*- encoding: utf-8 -*-
# stub: manageiq-api 4.4.0.pre.pre ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-api".freeze
  s.version = "4.4.0.pre.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ API".freeze
  s.executables = ["manageiq-api".freeze]
  s.files = [".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "ARCHITECTURE.md".freeze, "CHANGELOG.md".freeze, "CONTRIBUTING.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/controllers/api/actions_controller.rb".freeze, "app/controllers/api/alert_actions_controller.rb".freeze, "app/controllers/api/alert_definition_profiles_controller.rb".freeze, "app/controllers/api/alert_definitions_controller.rb".freeze, "app/controllers/api/alerts_controller.rb".freeze, "app/controllers/api/api_controller.rb".freeze, "app/controllers/api/auth_controller.rb".freeze, "app/controllers/api/auth_key_pairs_controller.rb".freeze, "app/controllers/api/authentications_controller.rb".freeze, "app/controllers/api/automate_classes_controller.rb".freeze, "app/controllers/api/automate_controller.rb".freeze, "app/controllers/api/automate_domains_controller.rb".freeze, "app/controllers/api/automate_workspaces_controller.rb".freeze, "app/controllers/api/automation_requests_controller.rb".freeze, "app/controllers/api/availability_zones_controller.rb".freeze, "app/controllers/api/base_controller.rb".freeze, "app/controllers/api/base_controller/action.rb".freeze, "app/controllers/api/base_controller/authentication.rb".freeze, "app/controllers/api/base_controller/generic.rb".freeze, "app/controllers/api/base_controller/logger.rb".freeze, "app/controllers/api/base_controller/manager.rb".freeze, "app/controllers/api/base_controller/normalizer.rb".freeze, "app/controllers/api/base_controller/parameters.rb".freeze, "app/controllers/api/base_controller/parser.rb".freeze, "app/controllers/api/base_controller/renderer.rb".freeze, "app/controllers/api/base_controller/results.rb".freeze, "app/controllers/api/base_provider_controller.rb".freeze, "app/controllers/api/categories_controller.rb".freeze, "app/controllers/api/chargeable_fields_controller.rb".freeze, "app/controllers/api/chargebacks_controller.rb".freeze, "app/controllers/api/cloud_database_flavors_controller.rb".freeze, "app/controllers/api/cloud_databases_controller.rb".freeze, "app/controllers/api/cloud_networks_controller.rb".freeze, "app/controllers/api/cloud_object_store_containers_controller.rb".freeze, "app/controllers/api/cloud_object_store_objects_controller.rb".freeze, "app/controllers/api/cloud_subnets_controller.rb".freeze, "app/controllers/api/cloud_templates_controller.rb".freeze, "app/controllers/api/cloud_tenants_controller.rb".freeze, "app/controllers/api/cloud_volume_snapshots_controller.rb".freeze, "app/controllers/api/cloud_volume_types_controller.rb".freeze, "app/controllers/api/cloud_volumes_controller.rb".freeze, "app/controllers/api/clusters_controller.rb".freeze, "app/controllers/api/conditions_controller.rb".freeze, "app/controllers/api/configuration_profiles_controller.rb".freeze, "app/controllers/api/configuration_script_payloads_controller.rb".freeze, "app/controllers/api/configuration_script_sources_controller.rb".freeze, "app/controllers/api/configuration_scripts_controller.rb".freeze, "app/controllers/api/configured_systems_controller.rb".freeze, "app/controllers/api/container_groups_controller.rb".freeze, "app/controllers/api/container_images_controller.rb".freeze, "app/controllers/api/container_nodes_controller.rb".freeze, "app/controllers/api/container_projects_controller.rb".freeze, "app/controllers/api/container_templates_controller.rb".freeze, "app/controllers/api/container_volumes_controller.rb".freeze, "app/controllers/api/containers_controller.rb".freeze, "app/controllers/api/currencies_controller.rb".freeze, "app/controllers/api/custom_button_sets_controller.rb".freeze, "app/controllers/api/custom_buttons_controller.rb".freeze, "app/controllers/api/customization_scripts_controller.rb".freeze, "app/controllers/api/customization_templates_controller.rb".freeze, "app/controllers/api/data_stores_controller.rb".freeze, "app/controllers/api/enterprises_controller.rb".freeze, "app/controllers/api/event_definition_sets_controller.rb".freeze, "app/controllers/api/event_streams_controller.rb".freeze, "app/controllers/api/events_controller.rb".freeze, "app/controllers/api/features_controller.rb".freeze, "app/controllers/api/firmware_registries_controller.rb".freeze, "app/controllers/api/firmwares_controller.rb".freeze, "app/controllers/api/flavors_controller.rb".freeze, "app/controllers/api/floating_ips_controller.rb".freeze, "app/controllers/api/generic_object_definitions_controller.rb".freeze, "app/controllers/api/generic_objects_controller.rb".freeze, "app/controllers/api/groups_controller.rb".freeze, "app/controllers/api/guest_devices_controller.rb".freeze, "app/controllers/api/host_aggregates_controller.rb".freeze, "app/controllers/api/host_initiator_groups_controller.rb".freeze, "app/controllers/api/host_initiators_controller.rb".freeze, "app/controllers/api/hosts_controller.rb".freeze, "app/controllers/api/instances_controller.rb".freeze, "app/controllers/api/iso_datastores_controller.rb".freeze, "app/controllers/api/iso_images_controller.rb".freeze, "app/controllers/api/lans_controller.rb".freeze, "app/controllers/api/load_balancers_controller.rb".freeze, "app/controllers/api/measures_controller.rb".freeze, "app/controllers/api/metric_rollups_controller.rb".freeze, "app/controllers/api/metrics_controller.rb".freeze, "app/controllers/api/mixins/central_admin.rb".freeze, "app/controllers/api/mixins/chargeback_assignment.rb".freeze, "app/controllers/api/mixins/genealogy.rb".freeze, "app/controllers/api/mixins/generic_objects.rb".freeze, "app/controllers/api/mixins/pictures.rb".freeze, "app/controllers/api/mixins/policy_simulation.rb".freeze, "app/controllers/api/mixins/report_result_set.rb".freeze, "app/controllers/api/mixins/resource_approve_deny.rb".freeze, "app/controllers/api/mixins/resource_cancel.rb".freeze, "app/controllers/api/mixins/result_downloads.rb".freeze, "app/controllers/api/mixins/service_templates.rb".freeze, "app/controllers/api/mixins/tags.rb".freeze, "app/controllers/api/network_routers_controller.rb".freeze, "app/controllers/api/network_services_controller.rb".freeze, "app/controllers/api/notifications_controller.rb".freeze, "app/controllers/api/orchestration_stacks_controller.rb".freeze, "app/controllers/api/orchestration_templates_controller.rb".freeze, "app/controllers/api/physical_chassis_controller.rb".freeze, "app/controllers/api/physical_racks_controller.rb".freeze, "app/controllers/api/physical_server_profiles_controller.rb".freeze, "app/controllers/api/physical_servers_controller.rb".freeze, "app/controllers/api/physical_storage_families_controller.rb".freeze, "app/controllers/api/physical_storages_controller.rb".freeze, "app/controllers/api/physical_switches_controller.rb".freeze, "app/controllers/api/pictures_controller.rb".freeze, "app/controllers/api/ping_controller.rb".freeze, "app/controllers/api/policies_controller.rb".freeze, "app/controllers/api/policy_actions_controller.rb".freeze, "app/controllers/api/policy_profiles_controller.rb".freeze, "app/controllers/api/providers_controller.rb".freeze, "app/controllers/api/provision_dialogs_controller.rb".freeze, "app/controllers/api/provision_requests_controller.rb".freeze, "app/controllers/api/pxe_image_types_controller.rb".freeze, "app/controllers/api/pxe_images_controller.rb".freeze, "app/controllers/api/pxe_menus_controller.rb".freeze, "app/controllers/api/pxe_servers_controller.rb".freeze, "app/controllers/api/rates_controller.rb".freeze, "app/controllers/api/regions_controller.rb".freeze, "app/controllers/api/reports_controller.rb".freeze, "app/controllers/api/request_tasks_controller.rb".freeze, "app/controllers/api/requests_controller.rb".freeze, "app/controllers/api/resource_pools_controller.rb".freeze, "app/controllers/api/results_controller.rb".freeze, "app/controllers/api/roles_controller.rb".freeze, "app/controllers/api/search_filters_controller.rb".freeze, "app/controllers/api/security_groups_controller.rb".freeze, "app/controllers/api/security_policies_controller.rb".freeze, "app/controllers/api/security_policy_rules_controller.rb".freeze, "app/controllers/api/servers_controller.rb".freeze, "app/controllers/api/service_catalogs_controller.rb".freeze, "app/controllers/api/service_dialogs_controller.rb".freeze, "app/controllers/api/service_offerings_controller.rb".freeze, "app/controllers/api/service_orders_controller.rb".freeze, "app/controllers/api/service_parameters_sets_controller.rb".freeze, "app/controllers/api/service_requests_controller.rb".freeze, "app/controllers/api/service_templates_controller.rb".freeze, "app/controllers/api/services_controller.rb".freeze, "app/controllers/api/settings_controller.rb".freeze, "app/controllers/api/shortcuts_controller.rb".freeze, "app/controllers/api/storage_resources_controller.rb".freeze, "app/controllers/api/storage_services_controller.rb".freeze, "app/controllers/api/subcollections/accounts.rb".freeze, "app/controllers/api/subcollections/alert_actions.rb".freeze, "app/controllers/api/subcollections/alert_definitions.rb".freeze, "app/controllers/api/subcollections/authentications.rb".freeze, "app/controllers/api/subcollections/cdroms.rb".freeze, "app/controllers/api/subcollections/cloud_networks.rb".freeze, "app/controllers/api/subcollections/cloud_subnets.rb".freeze, "app/controllers/api/subcollections/cloud_templates.rb".freeze, "app/controllers/api/subcollections/cloud_tenants.rb".freeze, "app/controllers/api/subcollections/cloud_volume_snapshots.rb".freeze, "app/controllers/api/subcollections/cloud_volume_types.rb".freeze, "app/controllers/api/subcollections/compliances.rb".freeze, "app/controllers/api/subcollections/conditions.rb".freeze, "app/controllers/api/subcollections/configuration_profiles.rb".freeze, "app/controllers/api/subcollections/configuration_script_payloads.rb".freeze, "app/controllers/api/subcollections/configured_systems.rb".freeze, "app/controllers/api/subcollections/custom_attributes.rb".freeze, "app/controllers/api/subcollections/custom_button_events.rb".freeze, "app/controllers/api/subcollections/customization_templates.rb".freeze, "app/controllers/api/subcollections/disks.rb".freeze, "app/controllers/api/subcollections/endpoints.rb".freeze, "app/controllers/api/subcollections/event_streams.rb".freeze, "app/controllers/api/subcollections/events.rb".freeze, "app/controllers/api/subcollections/features.rb".freeze, "app/controllers/api/subcollections/firmware_binaries.rb".freeze, "app/controllers/api/subcollections/flavors.rb".freeze, "app/controllers/api/subcollections/folders.rb".freeze, "app/controllers/api/subcollections/generic_objects.rb".freeze, "app/controllers/api/subcollections/lans.rb".freeze, "app/controllers/api/subcollections/load_balancers.rb".freeze, "app/controllers/api/subcollections/metric_rollups.rb".freeze, "app/controllers/api/subcollections/metrics.rb".freeze, "app/controllers/api/subcollections/network_services.rb".freeze, "app/controllers/api/subcollections/networks.rb".freeze, "app/controllers/api/subcollections/orchestration_stacks.rb".freeze, "app/controllers/api/subcollections/policies.rb".freeze, "app/controllers/api/subcollections/policy_actions.rb".freeze, "app/controllers/api/subcollections/policy_profiles.rb".freeze, "app/controllers/api/subcollections/pxe_images.rb".freeze, "app/controllers/api/subcollections/pxe_menus.rb".freeze, "app/controllers/api/subcollections/quotas.rb".freeze, "app/controllers/api/subcollections/rates.rb".freeze, "app/controllers/api/subcollections/request_tasks.rb".freeze, "app/controllers/api/subcollections/resource_actions.rb".freeze, "app/controllers/api/subcollections/results.rb".freeze, "app/controllers/api/subcollections/schedules.rb".freeze, "app/controllers/api/subcollections/security_groups.rb".freeze, "app/controllers/api/subcollections/security_policies.rb".freeze, "app/controllers/api/subcollections/security_policy_rules.rb".freeze, "app/controllers/api/subcollections/service_dialogs.rb".freeze, "app/controllers/api/subcollections/service_requests.rb".freeze, "app/controllers/api/subcollections/service_templates.rb".freeze, "app/controllers/api/subcollections/settings.rb".freeze, "app/controllers/api/subcollections/snapshots.rb".freeze, "app/controllers/api/subcollections/software.rb".freeze, "app/controllers/api/subcollections/tags.rb".freeze, "app/controllers/api/subcollections/vms.rb".freeze, "app/controllers/api/switches_controller.rb".freeze, "app/controllers/api/tags_controller.rb".freeze, "app/controllers/api/tasks_controller.rb".freeze, "app/controllers/api/templates_controller.rb".freeze, "app/controllers/api/tenant_groups_controller.rb".freeze, "app/controllers/api/tenant_quotas_controller.rb".freeze, "app/controllers/api/tenants_controller.rb".freeze, "app/controllers/api/time_profiles_controller.rb".freeze, "app/controllers/api/users_controller.rb".freeze, "app/controllers/api/vms_controller.rb".freeze, "app/controllers/api/volume_mappings_controller.rb".freeze, "app/controllers/api/widgets_controller.rb".freeze, "app/controllers/api/zones_controller.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/rake".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/api.yml".freeze, "config/routes.rb".freeze, "config/settings.yml".freeze, "config/settings/test.yml".freeze, "exe/manageiq-api".freeze, "lib/api.rb".freeze, "lib/api/api_config.rb".freeze, "lib/api/collection_config.rb".freeze, "lib/api/create_constraint.rb".freeze, "lib/api/environment.rb".freeze, "lib/api/filter.rb".freeze, "lib/api/href.rb".freeze, "lib/api/http_headers.rb".freeze, "lib/api/links_builder.rb".freeze, "lib/api/query_counts.rb".freeze, "lib/api/request_adapter.rb".freeze, "lib/api/routing.rb".freeze, "lib/api/utils.rb".freeze, "lib/manageiq/api.rb".freeze, "lib/manageiq/api/engine.rb".freeze, "lib/manageiq/api/version.rb".freeze, "lib/services/api/authentication_service.rb".freeze, "lib/services/api/error_serializer.rb".freeze, "lib/services/api/metric_rollups_service.rb".freeze, "lib/services/api/metrics_service.rb".freeze, "lib/services/api/options_serializer.rb".freeze, "lib/services/api/request_editor.rb".freeze, "lib/services/api/request_parser.rb".freeze, "lib/services/api/settings_filterer.rb".freeze, "lib/services/api/user_token_service.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/manageiq/api_tasks.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-api.gemspec".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-api".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ API".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<config>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<jbuilder>.freeze, ["~> 2.5", "!= 2.9.0"])
    s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<config>.freeze, [">= 0"])
    s.add_dependency(%q<jbuilder>.freeze, ["~> 2.5", "!= 2.9.0"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end