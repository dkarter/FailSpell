# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'failspell/version'

Gem::Specification.new do |spec|
  spec.name          = "failspell"
  spec.version       = Failspell::VERSION
  spec.authors       = ["Dorian Karter"]
  spec.email         = ["jobs@doriankarter.com"]

  spec.summary       = %q{A gem to help re-run failed specs in your suite}
  spec.description   = %q{A gem to help re-run failed specs in your suite}
  spec.homepage      = "https://github.com/dkarter/FailSpell"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['fspell']
  spec.require_paths = ["lib"]

  spec.add_dependency 'colorize'
  spec.add_dependency 'thor'
  spec.add_dependency 'highline'
  spec.add_dependency 'json'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'fakefs'
end
