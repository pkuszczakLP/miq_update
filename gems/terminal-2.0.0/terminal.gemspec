# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'terminal/version'

Gem::Specification.new do |spec|
  spec.name          = "terminal"
  spec.version       = Terminal::VERSION
  spec.authors       = ["Keith Pitt"]
  spec.email         = ["me@keithpitt.com"]
  spec.summary       = %q{Converts ANSI to HTML}
  spec.description   = %q{Converts ANSI to HTML}
  spec.homepage      = "https://github.com/buildkite/terminal"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "escape_utils", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "benchmark-ips"
  spec.add_development_dependency "method_profiler"
  spec.add_development_dependency "memory_profiler"
end
