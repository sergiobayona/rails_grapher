module RailsGrapher
  class ControllerMeta
    DEFINITIONS = %w[actions]

    def initialize(controller)
      @controller = controller
    end

    def actions
      @controller.action_methods.to_a.sort
    end
  end
end
