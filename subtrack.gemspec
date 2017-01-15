# coding: utf-8
lib = File.expand_path '../lib', __FILE__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
require 'subtrack/gem'

Gem::Specification.new do |spec|
  spec.name          = Subtrack::NAME
  spec.version       = Subtrack::VERSION
  spec.authors       = ['cfillion']
  spec.email         = ['subtrack@cfillion.tk']
  spec.summary       = Subtrack::SUMMARY
  spec.homepage      = 'https://github.com/cfillion/subtrack'
  spec.license       = 'GPL-3.0+'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'commander', '~> 4.4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov', '~> 0.11'
end
