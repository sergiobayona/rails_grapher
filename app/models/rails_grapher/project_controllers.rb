module RailsGrapher
  class ProjectControllers
    def self.all
      Rails.application.eager_load!
      controllers.map { |controller| new(controller) }
    end

    def initialize(controller)
      @controller = controller
    end

    def definition
      ControllerMeta::DEFINITIONS.each_with_object({}) do |attribute, _hash|
        _hash[attribute.to_s] = ControllerMeta.new(@controller).send(attribute)
      end
    end
  end
end
