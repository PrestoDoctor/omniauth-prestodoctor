# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-prestodoctor/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-prestodoctor"
  s.version     = OmniAuth::PrestoDoctor::VERSION
  s.authors     = ["Kyle Powers"]
  s.email       = ["kyle@prestodoctor.com"]
  s.homepage    = "https://github.com/PrestoDoctor/omniauth-prestodoctor"
  s.summary     = %q{OmniAuth strategy for PrestoDoctor}
  s.description = %q{OmniAuth strategy for PrestoDoctor}
  s.licenses    = ['MIT']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'multi_json', '~> 1.3'
  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test', '~> 0.6'
  s.add_development_dependency 'simplecov', '~> 0.10'
  s.add_development_dependency 'webmock', '~> 1.20'
end
