# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'netzke-generators/version'

Gem::Specification.new do |gem|
  gem.name          = "netzke-generators"
  gem.version       = Netzke::Generators::VERSION
  gem.authors       = ["Mike"]
  gem.email         = ["mike@otep.ch"]
  gem.description   = %q{Generators for Netzke Components}
  gem.summary       = %q{Let's you create Netzke Components through rails generators}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
