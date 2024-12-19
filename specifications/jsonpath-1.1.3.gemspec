# -*- encoding: utf-8 -*-
# stub: jsonpath 1.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "jsonpath".freeze
  s.version = "1.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Joshua Hull".freeze, "Gergely Brautigam".freeze]
  s.date = "2023-05-09"
  s.description = "Ruby implementation of http://goessner.net/articles/JsonPath/.".freeze
  s.email = ["joshbuddy@gmail.com".freeze, "skarlso777@gmail.com".freeze]
  s.executables = ["jsonpath".freeze]
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze, "bin/jsonpath".freeze]
  s.homepage = "https://github.com/joshbuddy/jsonpath".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Ruby implementation of http://goessner.net/articles/JsonPath/".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<multi_json>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<code_stats>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 2.2.0"])
    s.add_development_dependency(%q<phocus>.freeze, [">= 0"])
    s.add_development_dependency(%q<racc>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<multi_json>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<code_stats>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 2.2.0"])
    s.add_dependency(%q<phocus>.freeze, [">= 0"])
    s.add_dependency(%q<racc>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
