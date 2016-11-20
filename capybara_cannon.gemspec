# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara_cannon'

Gem::Specification.new do |spec|
  spec.name = 'capybara_cannon'
  spec.version = CapybaraCannon::VERSION
  spec.authors = ['alpaca-tc']
  spec.email = ['alpaca-tc@alpaca.tc']

  spec.summary = %q{Capybara DSL evaluator}
  spec.description = %q{Capybara DSL evaluator}
  spec.homepage = 'https://github.com/alpaca-tc/capybara_cannon'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = 'lib'
  spec.bindir = 'bin'
  spec.executables = ['capybara_cannon']

  spec.add_runtime_dependency 'capybara', '~> 2.10', '>= 2.10.0'
  spec.add_runtime_dependency 'poltergeist', '~> 1.11', '>= 1.11.0'
  spec.add_runtime_dependency 'selenium-webdriver', '~> 3.0', '>= 3.0.0'
  spec.add_runtime_dependency 'pry', '~> 0.10', '>= 0.10.0'
end
