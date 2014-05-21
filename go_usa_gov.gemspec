# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'go_usa_gov/version'

Gem::Specification.new do |spec|
  spec.name          = "go_usa_gov"
  spec.version       = GoUsaGov::VERSION
  spec.authors       = ["Ganesh Kunwar"]
  spec.email         = ["gkunwar09@gmail.com"]
  spec.description   = "Use the go.usa.gov API to shorten or expand URLs"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
