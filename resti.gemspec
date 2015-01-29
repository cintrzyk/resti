# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'resti/version'

Gem::Specification.new do |s|
  s.name        = 'resti'
  s.version     = Resti::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = %q{PayPal REST integration}
  s.description = %q{PayPal REST integration}
  s.authors     = ['Marcin Brzeziński']
  s.email       = 'cintrzyk@gmail.com'
  s.homepage    = 'http://github.com/cintrzyk/resti'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.require_paths = %w(lib)
  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency 'paypal-sdk-rest', '~> 0.10'
  s.add_dependency 'rails', '~> 4.1.9'

  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.1'
end
