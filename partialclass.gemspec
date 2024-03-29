# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'partialclass/version'

Gem::Specification.new do |spec|
  spec.name          = "partialclass"
  spec.version       = PartialClass::VERSION
  spec.authors       = ["Simon Worthington"]
  spec.email         = ["simon@simonwo.net"]
  spec.summary       = "Specialise a Ruby class by providing some of its initializer arguments or attributes ahead of time."
  spec.homepage      = "https://github.com/simonwo/partialclass"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
