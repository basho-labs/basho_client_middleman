# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'basho_client_middleman/version'

Gem::Specification.new do |spec|
  spec.name          = "basho_client_middleman"
  spec.version       = BashoClientMiddleman::VERSION
  spec.authors       = ["Bryce Kerley"]
  spec.email         = ["bryce@basho.com"]
  spec.summary       = %q{Shared assets for Basho client documentation sites.}
  spec.description   = %q{Shared images, stylesheets, and javascripts for Basho Riak client documentation sites built using Middleman.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'middleman', '~> 3.3'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'pry'
end
