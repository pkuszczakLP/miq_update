# -*- encoding: utf-8 -*-
# stub: manageiq-ssh-util 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "manageiq-ssh-util".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.date = "2020-05-06"
  s.description = "ManageIQ wrapper library for net-ssh".freeze
  s.homepage = "https://github.com/ManageIQ/manageiq-ssh-util".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rubygems_version = "3.2.33".freeze
  s.summary = "ManageIQ wrapper library for net-ssh".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<net-ssh>.freeze, ["~> 4.2"])
    s.add_runtime_dependency(%q<net-sftp>.freeze, ["~> 2.1"])
    s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    s.add_dependency(%q<net-ssh>.freeze, ["~> 4.2"])
    s.add_dependency(%q<net-sftp>.freeze, ["~> 2.1"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
