module RailsGrapher
  class ProjectViews
    TEMPLATE_TYPES = %w[erb haml slim]

    def self.all
      all_views.each_with_object({}) do |view, res|
        res[view] = new(view).definition
      end
    end

    def initialize(model)
      @model = model
    end

    def definition
      {
        'layouts': [
          {
            'name': 'application.html.erb',
            'format': 'html',
            'template': 'erb',
            'path': 'app/views/layouts/application.html.erb'
          }, {
            'name': 'mailer.html.erb',
            'format': 'html',
            'template': 'erb',
            'path': 'app/views/layouts/mailer.html.erb'
          }
        ]
      }
    end

    def self.all_views
      Dir.glob(Rails.root.join('app', 'views', '**', '*')).reject { |path| File.directory?(path) }
    end
  end
end
