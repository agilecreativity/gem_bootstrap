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
  spec.required_ruby_version = '>= 1.9.3'
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
  spec.add_runtime_dependency 'activesupport', '~> 4.2'
  spec.add_runtime_dependency 'grit' , '~> 2.5'
  spec.add_runtime_dependency 'thor', '~> 0.19'
  spec.add_development_dependency 'awesome_print', '~> 1.6'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'gem-ctags', '~> 1.0'
  spec.add_development_dependency 'guard', '~> 2.12'
  spec.add_development_dependency 'guard-minitest', '~> 2.4'
  spec.add_development_dependency 'minitest', '~> 5.6'
  spec.add_development_dependency 'minitest-spec-context'#, '~> 0.0.3'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'pry-byebug', '~> 3.1' if RUBY_VERSION >= '2.0.0'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rubocop', '~> 0.31'
  spec.add_development_dependency 'yard', '~> 0.8'
end
