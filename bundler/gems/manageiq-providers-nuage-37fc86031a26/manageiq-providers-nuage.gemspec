# -*- encoding: utf-8 -*-
# stub: manageiq-providers-nuage 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-providers-nuage".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Authors".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "ManageIQ plugin for the Nuage provider.".freeze
  s.files = [".babelrc".freeze, ".codeclimate.yml".freeze, ".github/CODEOWNERS".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".postcssrc.yml".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, ".yarn/releases/yarn-3.5.0.cjs".freeze, ".yarnrc.yml".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "app/helpers/manageiq/providers/nuage/toolbar_overrides/network_router_center.rb".freeze, "app/javascript/components/create-nuage-cloud-subnet-form.jsx".freeze, "app/javascript/components/create-nuage-cloud-subnet-form.schema.js".freeze, "app/javascript/packs/component-definitions-common.js".freeze, "app/models/manageiq/providers/nuage/ansible_crud_mixin.rb".freeze, "app/models/manageiq/providers/nuage/inventory.rb".freeze, "app/models/manageiq/providers/nuage/inventory/collector.rb".freeze, "app/models/manageiq/providers/nuage/inventory/collector/network_manager.rb".freeze, "app/models/manageiq/providers/nuage/inventory/collector/target_collection.rb".freeze, "app/models/manageiq/providers/nuage/inventory/parser.rb".freeze, "app/models/manageiq/providers/nuage/inventory/parser/network_manager.rb".freeze, "app/models/manageiq/providers/nuage/inventory/persister.rb".freeze, "app/models/manageiq/providers/nuage/inventory/persister/definitions/network_collections.rb".freeze, "app/models/manageiq/providers/nuage/inventory/persister/network_manager.rb".freeze, "app/models/manageiq/providers/nuage/inventory/persister/target_collection.rb".freeze, "app/models/manageiq/providers/nuage/manager_mixin.rb".freeze, "app/models/manageiq/providers/nuage/network_manager.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/cloud_network.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/cloud_network/floating.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/cloud_subnet.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/cloud_subnet/l2.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/cloud_subnet/l3.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/cloud_tenant.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/event_catcher.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/event_catcher/messaging_handler.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/event_catcher/runner.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/event_catcher/stream.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/event_parser.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/event_target_parser.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/floating_ip.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/network_port.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/network_port/bridge.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/network_port/container.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/network_port/host.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/network_port/vm.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/network_router.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/refresh_worker.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/refresh_worker/runner.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/refresher.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/security_group.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/vsd_client.rb".freeze, "app/models/manageiq/providers/nuage/network_manager/vsd_client/rest.rb".freeze, "app/models/manageiq/providers/nuage/refresh_parser_common/helper_methods.rb".freeze, "bin/before_install".freeze, "bin/rails".freeze, "bin/setup".freeze, "bin/update".freeze, "bundler.d/.keep".freeze, "config/secrets.defaults.yml".freeze, "config/settings.yml".freeze, "content/ansible_runner/create-subnet.yml".freeze, "content/ansible_runner/remove-floating-ip.yml".freeze, "content/ansible_runner/remove-policy-group.yml".freeze, "content/ansible_runner/remove-subnet.yml".freeze, "content/ansible_runner/roles/requirements.yml".freeze, "lib/manageiq/providers/nuage.rb".freeze, "lib/manageiq/providers/nuage/engine.rb".freeze, "lib/manageiq/providers/nuage/version.rb".freeze, "lib/tasks/README.md".freeze, "lib/tasks/nuage.rake".freeze, "lib/tasks_private/spec.rake".freeze, "locale/.keep".freeze, "manageiq-providers-nuage.gemspec".freeze, "package.json".freeze, "systemd/manageiq-providers-nuage_network_manager_event_catcher.target".freeze, "systemd/manageiq-providers-nuage_network_manager_event_catcher@.service".freeze, "systemd/manageiq-providers-nuage_network_manager_refresh.target".freeze, "systemd/manageiq-providers-nuage_network_manager_refresh@.service".freeze, "yarn.lock".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-providers-nuage".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ plugin for the Nuage provider.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<excon>.freeze, ["~> 0.71"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  else
    s.add_dependency(%q<excon>.freeze, ["~> 0.71"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
  end
end
