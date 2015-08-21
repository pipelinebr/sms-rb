# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smsrb/version'

Gem::Specification.new do |spec|
  spec.name          = "smsrb"
  spec.version       = Smsrb::VERSION
  spec.authors       = ["Filipe Monteiro"]
  spec.email         = ["dev@pipeline.com.br"]
  spec.summary       = %q{Gem for send text messages}
  spec.description   = %q{Gem for send text messages}
  spec.homepage      = "https://github.com/pipelinebr/sms-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "rspec"
end
