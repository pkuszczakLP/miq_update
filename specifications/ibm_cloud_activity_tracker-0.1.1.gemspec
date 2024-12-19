# -*- encoding: utf-8 -*-
# stub: ibm_cloud_activity_tracker 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "ibm_cloud_activity_tracker".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/IBM-Cloud/ibm-cloud-sdk-ruby/blob/main/CHANGELOG.md", "homepage_uri" => "https://github.com/IBM-Cloud/ibm-cloud-sdk-ruby", "source_code_uri" => "https://github.com/IBM-Cloud/ibm-cloud-sdk-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["nasar.khan@ibm.com".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-03-09"
  s.email = ["nasar.khan@ibm.com".freeze]
  s.homepage = "https://github.com/IBM-Cloud/ibm-cloud-sdk-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "IBM Cloud Activity Tracker Ruby SDK".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<concurrent-ruby>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<http>.freeze, ["~> 4.4.1"])
    s.add_runtime_dependency(%q<ibm_cloud_sdk_core>.freeze, ["~> 1.1.1"])
    s.add_runtime_dependency(%q<jwt>.freeze, ["~> 2.2.1"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.1"])
    s.add_development_dependency(%q<codecov>.freeze, ["~> 0.1"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["= 0.62"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.16"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 3.4"])
  else
    s.add_dependency(%q<concurrent-ruby>.freeze, ["~> 1.0"])
    s.add_dependency(%q<http>.freeze, ["~> 4.4.1"])
    s.add_dependency(%q<ibm_cloud_sdk_core>.freeze, ["~> 1.1.1"])
    s.add_dependency(%q<jwt>.freeze, ["~> 2.2.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.1"])
    s.add_dependency(%q<codecov>.freeze, ["~> 0.1"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.62"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.16"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.4"])
  end
end