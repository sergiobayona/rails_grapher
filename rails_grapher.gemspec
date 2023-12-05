require_relative 'lib/rails_grapher/version'

Gem::Specification.new do |spec|
  spec.name        = 'rails_grapher'
  spec.version     = RailsGrapher::VERSION
  spec.authors     = ['Sergio Bayona']
  spec.email       = ['bayona.sergio@gmail.com']
  spec.homepage    = 'https://github.com/sergiobayona/rails_grapher'
  spec.summary     = 'Analyze your Ruby on Rails codebase'
  spec.description = 'Discover and visualize the structure of your Ruby on Rails codebase'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/sergiobayona/rails_grapher'
  spec.metadata['changelog_uri'] = 'https://github.com/sergiobayona/rails_grapher/CHANGELOG.'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'jbuilder'
  spec.add_dependency 'rails', '>= 7.1.2'
  spec.add_dependency 'rubocop-ast'
  spec.add_development_dependency 'bcrypt'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rspec-activemodel-mocks'
  spec.add_development_dependency 'rspec-json_expectations'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rails'
  spec.add_development_dependency 'rubocop-rspec'
end
