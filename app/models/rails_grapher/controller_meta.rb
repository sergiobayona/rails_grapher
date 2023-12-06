require 'rubocop-ast'
module RailsGrapher
  class ControllerMeta
    extend RuboCop::AST::NodePattern::Macros
    DEFINITIONS = %w[actions]

    def initialize(controller)
      @controller = controller
    end

    def_node_matcher :match_format_call?, <<~PATTERN
      (send
        (lvar :format) %1)
    PATTERN

    def actions
      return unless any_methods_defined_in_class?

      source = fetch_source_from_first_method
      @actions = {}

      source.ast.each_node { |n| process_node(n) }

      @actions
    end

    private

    def any_methods_defined_in_class?
      @controller.instance_methods(false).any?
    end

    def fetch_source_from_first_method
      method_name = @controller.instance_methods(false).first
      file_path = @controller.instance_method(method_name).source_location
      code = File.read(file_path.first)

      RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f)
    end

    def action_method?(node)
      node.type == :def && @controller.action_methods.include?(node.children[0].to_s)
    end

    def add_formats_to_action(node)
      node.each_node do |_n|
        Mime.symbols.each do |format|
          @actions[node.children[0].to_s] ||= []
          @actions[node.children[0].to_s] << format if match_format_call?(_n, format)
        end
      end
    end

    def process_node(node)
      return unless action_method?(node)

      add_formats_to_action(node)
    end
  end
end
