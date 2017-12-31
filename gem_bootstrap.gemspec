# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem_bootstrap/version'

Gem::Specification.new do |spec|
  spec.name          = 'gem_bootstrap'
  spec.version       = GemBootstrap::VERSION
  spec.authors       = ['Burin Choomnuan']
  spec.email         = ['agilecreativity@gmail.com']
  spec.summary       = "Bootstrap the creation of ruby gem so that you don't have to start from scratch"
  spec.description   = "Bootstrap the creation of ruby gem so that you don't have to start from scratch.
                        Build with simple, sensible default and very easy to extend.
                        TL;DR; create new gem with `gem_bootstrap awesome_gem -g github_id -e your@email.com -a 'John Guru'`"
  spec.homepage      = 'https://github.com/agilecreativity/gem_bootstrap'
  spec.required_ruby_version = '>= 2.0.0'
  spec.license       = 'MIT'
  spec.files         = Dir.glob('{bin,lib,templates}/**/*') + %w(Gemfile
                                                                 Rakefile
                                                                 gem_bootstrap.gemspec
                                                                 README.md
                                                                 CHANGELOG.md
                                                                 LICENSE
                                                                 .rubocop.yml
                                                                 .gitignore)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob('test/**/*')
  spec.require_paths = ['lib']

  spec.add_development_dependency 'awesome_print', '~> 1.8'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'guard', '~> 2.14'
  spec.add_development_dependency 'guard-minitest', '~> 2.4'
  spec.add_development_dependency 'minitest', '~> 5.10'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'pry-byebug', '~> 3.5'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rubocop', '~> 0.52'
  spec.add_development_dependency 'yard', '~> 0.9'

  spec.add_runtime_dependency 'activesupport', '~> 5.1'
  spec.add_runtime_dependency 'grit' , '~> 2.5'
  spec.add_runtime_dependency 'thor', '~> 0.20'
end
