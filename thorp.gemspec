# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'thorp/version'

Gem::Specification.new do |spec|
  spec.name          = "thorp"
  spec.version       = Thorp::VERSION
  spec.authors       = ["Dean Hallman"]
  spec.email         = ["rdhallman@gmail.com"]

  spec.summary       = %q{Thorp is Thor with a plugin system added.}
  spec.description   = %q{Thorp augments Thor's command lookup logic to allow thor commands to come from different gems.}
  spec.homepage      = "http://bitbucket/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.3'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "thor", ">= 0.19.1"
end
