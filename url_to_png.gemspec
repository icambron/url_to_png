# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_to_png/version'

Gem::Specification.new do |spec|
  spec.name          = "url_to_png"
  spec.version       = UrlToPng::VERSION
  spec.authors       = ["Isaac Cambron"]
  spec.email         = ["isaac@isaaccambron.com"]
  spec.summary       = "Client library for url2png"
  spec.homepage      = "http://github.com/icambron/url_to_png"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', ">= 0.9.0"
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'hashie'

  spec.add_dependency 'json'
  spec.add_dependency 'addressable'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
