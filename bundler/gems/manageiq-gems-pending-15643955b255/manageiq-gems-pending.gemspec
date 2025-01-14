# -*- encoding: utf-8 -*-
# stub: manageiq-gems-pending 0.1.0 ruby lib lib/gems/pending lib/gems/pending/util

Gem::Specification.new do |s|
  s.name = "manageiq-gems-pending".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, "lib/gems/pending".freeze, "lib/gems/pending/util".freeze]
  s.authors = ["ManageIQ Developers".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-09-12"
  s.description = "Classes pending extraction to their own gems.".freeze
  s.files = [".codeclimate.yml".freeze, ".github/workflows/ci.yaml".freeze, ".gitignore".freeze, ".rspec".freeze, ".rspec_ci".freeze, ".rubocop.yml".freeze, ".rubocop_cc.yml".freeze, ".rubocop_local.yml".freeze, ".whitesource".freeze, ".yamllint".freeze, "CHANGELOG.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "bin/console".freeze, "bin/setup".freeze, "bundler.d/.gitkeep".freeze, "lib/gems/pending/.gitignore".freeze, "lib/gems/pending/util/duplicate_blocker.rb".freeze, "lib/gems/pending/util/duplicate_blocker/dedup_handler.rb".freeze, "lib/gems/pending/util/duplicate_blocker/duplicate_found_exception.rb".freeze, "lib/gems/pending/util/miq-encode.rb".freeze, "lib/gems/pending/util/miq-exception.rb".freeze, "lib/gems/pending/util/miq-extensions.rb".freeze, "lib/gems/pending/util/miq-hash_struct.rb".freeze, "lib/gems/pending/util/miq-ipmi.rb".freeze, "lib/gems/pending/util/miq-process.rb".freeze, "lib/gems/pending/util/miq-system.rb".freeze, "lib/gems/pending/util/miq-xml.rb".freeze, "lib/gems/pending/util/miq_file_storage.rb".freeze, "lib/gems/pending/util/miq_ftp_lib.rb".freeze, "lib/gems/pending/util/miq_logger_processor.rb".freeze, "lib/gems/pending/util/miq_object_storage.rb".freeze, "lib/gems/pending/util/mount/miq_generic_mount_session.rb".freeze, "lib/gems/pending/util/mount/miq_glusterfs_session.rb".freeze, "lib/gems/pending/util/mount/miq_local_mount_session.rb".freeze, "lib/gems/pending/util/mount/miq_nfs_session.rb".freeze, "lib/gems/pending/util/mount/miq_smb_session.rb".freeze, "lib/gems/pending/util/object_storage/miq_ftp_storage.rb".freeze, "lib/gems/pending/util/object_storage/miq_s3_storage.rb".freeze, "lib/gems/pending/util/object_storage/miq_swift_storage.rb".freeze, "lib/gems/pending/util/require_with_logging.rb".freeze, "lib/gems/pending/util/win32/miq-powershell.rb".freeze, "lib/gems/pending/util/win32/miq-psd.ps1".freeze, "lib/gems/pending/util/win32/miq-wmi-linux.rb".freeze, "lib/gems/pending/util/win32/miq-wmi-mswin.rb".freeze, "lib/gems/pending/util/win32/miq-wmi.rb".freeze, "lib/gems/pending/util/win32/nt_util.rb".freeze, "lib/gems/pending/util/xml/miq_nokogiri.rb".freeze, "lib/gems/pending/util/xml/miq_rexml.rb".freeze, "lib/gems/pending/util/xml/xml_diff.rb".freeze, "lib/gems/pending/util/xml/xml_hash.rb".freeze, "lib/gems/pending/util/xml/xml_patch.rb".freeze, "lib/gems/pending/util/xml/xml_utils.rb".freeze, "lib/manageiq-gems-pending.rb".freeze, "lib/manageiq/gems/pending.rb".freeze, "lib/manageiq/gems/pending/version.rb".freeze, "manageiq-gems-pending.gemspec".freeze]
  s.homepage = "https://github.com/ManageIQ/manageiq-gems-pending/".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new("> 2.4".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Core utility classes for ManageIQ.".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, ["~> 6.0"])
    s.add_runtime_dependency(%q<awesome_spawn>.freeze, ["~> 1.5"])
    s.add_runtime_dependency(%q<aws-sdk-s3>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<bundler>.freeze, ["~> 2.1", ">= 2.1.4", "!= 2.2.10"])
    s.add_runtime_dependency(%q<fog-openstack>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<more_core_extensions>.freeze, ["~> 4.4"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.14", ">= 1.14.3"])
    s.add_runtime_dependency(%q<sys-proctable>.freeze, ["~> 1.2.5"])
    s.add_runtime_dependency(%q<sys-uname>.freeze, ["~> 1.2.1"])
    s.add_runtime_dependency(%q<win32ole>.freeze, ["~> 1.8.8"])
    s.add_development_dependency(%q<ftpd>.freeze, ["~> 2.1.0"])
    s.add_development_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9.1"])
    s.add_development_dependency(%q<xml-simple>.freeze, ["~> 1.1.0"])
  else
    s.add_dependency(%q<activesupport>.freeze, ["~> 6.0"])
    s.add_dependency(%q<awesome_spawn>.freeze, ["~> 1.5"])
    s.add_dependency(%q<aws-sdk-s3>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.1", ">= 2.1.4", "!= 2.2.10"])
    s.add_dependency(%q<fog-openstack>.freeze, ["~> 1.0"])
    s.add_dependency(%q<more_core_extensions>.freeze, ["~> 4.4"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.14", ">= 1.14.3"])
    s.add_dependency(%q<sys-proctable>.freeze, ["~> 1.2.5"])
    s.add_dependency(%q<sys-uname>.freeze, ["~> 1.2.1"])
    s.add_dependency(%q<win32ole>.freeze, ["~> 1.8.8"])
    s.add_dependency(%q<ftpd>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<manageiq-style>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.21.2"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.9.1"])
    s.add_dependency(%q<xml-simple>.freeze, ["~> 1.1.0"])
  end
end
