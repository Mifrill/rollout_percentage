require_relative 'lib/rollout_percentage'

Gem::Specification.new do |spec|
  spec.name          = 'rollout_percentage'
  spec.version       = RolloutPercentage::VERSION
  spec.authors       = ['Aleksey Strizhak']
  spec.email         = ['alexei.mifrill.strizhak@gmail.com']

  spec.summary       = 'Randomizer by percentage'
  spec.description   = 'Use client for rollout features by percentage'
  spec.homepage      = 'https://github.com/Mifrill/rollout_percentage.git'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/Mifrill/rollout_percentage/blob/master/CHANGELOG.md'

  spec.require_paths = ['lib']
  spec.files         = Dir['{lib}/**/*'] + %w[LICENSE.txt]

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rspec-its'
end
