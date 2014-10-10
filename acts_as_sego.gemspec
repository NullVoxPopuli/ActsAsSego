# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "acts_as_sego/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_sego"
  s.version     = ActsAsSego::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = "MIT"
  s.authors     = ["L. Preston Sego III"]
  s.email       = "LPSego3+dev@gmail.com"
  s.homepage    = "https://github.com/NullVoxPopuli/ActsAsSego"
  s.summary     = "ActsAsSego-#{ActsAsSego::VERSION}"
  s.description = "Positive affirmation in a realm foreign to many. Helpful suggestions when in despair. "


  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "meta_instance"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "codeclimate-test-reporter"

end