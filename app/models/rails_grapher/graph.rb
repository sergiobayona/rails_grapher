module RailsGrapher
  class Graph
    COMPONENTS = %w[
      models controllers views
    ]
    # COMPONENTS = %w[
    #   models controllers views routes helpers mailers jobs services policies
    #   serializers workers channels presenters decorators uploaders concerns
    #   libs initializers configurations environments migrations seeds factories
    #   fixtures tests tasks rake_tasks generators routes gems javascripts
    #   stylesheets images fonts vendor public log tmp db bin app config lib
    # ]

    def self.all
      COMPONENTS.each_with_object({}) do |component, hash|
        hash["project_#{component}".to_sym] = send("project_#{component}")
      end
    end

    COMPONENTS.each do |component|
      define_singleton_method("project_#{component}") do
        "RailsGrapher::Project#{component.capitalize}".constantize.all
      end
    end
  end
end
