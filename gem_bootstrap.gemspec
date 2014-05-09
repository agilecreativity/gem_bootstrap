# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem_bootstrap/version'

Gem::Specification.new do |spec|
  spec.name          = 'gem_bootstrap'
  spec.version       = GemBootstrap::VERSION
  spec.authors       = ['Burin Choomnuan']
  spec.email         = ['agilecreativity@gmail.com']
  spec.summary       = %q{Bootstrap the creation of ruby gem so that you don't have to start from scratch}
  spec.description   = %q{Bootstrap the creation of ruby gem so that you don't have to start from scratch.
                          Build with simple, sensible default and very easy to extend}
  spec.homepage      = 'https://github.com/agilecreativity/cli_bootstrap'
  spec.license       = 'MIT'
  spec.files         = Dir.glob("{bin,lib,templates}/**/*") + %w(Gemfile
                                                                 Rakefile
                                                                 gem_bootstrap.gemspec
                                                                 README.md
                                                                 CHANGELOGS.md
                                                                 LICENSE
                                                                 .rubocop.yml
                                                                 .gitignore
                                                                 rubocop-todo.yml)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob('test/**/*')
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'thor', '~> 0.19'
  spec.add_runtime_dependency 'grit', '~> 2.5'
  spec.add_runtime_dependency 'code_lister', '~> 0.0.8'
  spec.add_development_dependency 'awesome_print', '~> 1.2'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'gem-ctags', '~> 1.0'
  spec.add_development_dependency 'minitest', '~> 5.3'
  spec.add_development_dependency 'minitest-spec-context', '~> 0.0.3'
  spec.add_development_dependency 'guard', '~> 2.6'
  spec.add_development_dependency 'guard-minitest', '~> 2.2'
  spec.add_development_dependency 'pry', '~> 0.9'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rubocop', '~> 0.21'
  spec.add_development_dependency 'yard', '~> 0.8.7'
end
