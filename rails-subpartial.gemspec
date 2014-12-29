#!/usr/bin/env ruby
# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails/subpartial/version"

Gem::Specification.new do |spec|
  spec.name          = "rails-subpartial"
  spec.version       = Rails::Subpartial::VERSION
  spec.authors       = ["Kurtis Rainbolt-Greene", "Alexey Osipenko"]
  spec.email         = ["me@kurtisrainboltgreene.name", "alexey@osipenko.in.ua"]
  spec.summary       = %q{Allowing rails to look in subfolders first for partials}
  spec.description   = spec.summary
  spec.homepage      = "http://krainboltgreene.github.io/rails-subpartial"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.executables   = Dir["bin/**/*"].map! { |f| f.gsub(/bin\//, "") }
  spec.test_files    = Dir["test/**/*", "spec/**/*"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails", "~> 4.2.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "pry-doc", "~> 0.6"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
end
