# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mredis/version'

Gem::Specification.new do |spec|
  spec.name          = "mredis"
  spec.version       = Mredis::VERSION
  spec.authors       = ["Dao Anh Khoa"]
  spec.email         = ["khoada@lifetimetech.vn"]
  spec.description   = "Use redis to save and suggestion keyword"
  spec.summary       = "Search suggestion"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
