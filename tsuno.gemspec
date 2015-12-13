# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tsuno/version'

Gem::Specification.new do |spec|
  spec.name          = 'tsuno'
  spec.version       = Tsuno::VERSION
  spec.authors       = ['Justin Harrison']
  spec.email         = ['justin@matthin.com']

  spec.summary       = 'Tsuno is an application which is useful for displaying
                        your GPA for a specific semester.'
  spec.homepage      = 'https://github.com/matthin/tsuno'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('lib/**/*')
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency('bundler', '~> 1.10')
  spec.add_development_dependency('rake', '~> 10.0')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('yard')
end
