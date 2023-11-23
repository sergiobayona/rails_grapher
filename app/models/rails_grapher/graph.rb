module RailsGrapher
  class Graph
    def self.all
      all = {}
      all[:project_models] = project_models
      all
      # project_models
      # project_controllers
      # project_views
      # project_routes
      # project_helpers
      # project_mailers
      # project_jobs
      # project_services
      # project_policies
      # project_serializers
      # project_workers
      # project_channels
      # project_presenters
      # project_decorators
      # project_uploaders
      # project_concerns
      # project_libs
      # project_initializers
      # project_configurations
      # project_environments
      # project_migrations
      # project_seeds
      # project_factories
      # project_fixtures
      # project_tests
      # project_tasks
      # project_rake_tasks
      # project_generators
      # project_rake_tasks
      # project_routes
      # project_gems
      # project_javascripts
      # project_stylesheets
      # project_images
      # project_fonts
      # project_vendor
      # project_public
      # project_log
      # project_tmp
      # project_db
      # project_bin
      # project_app
      # project_config
      # project_lib
    end

    def self.project_models
      ProjectModel.all
    end
  end
end
