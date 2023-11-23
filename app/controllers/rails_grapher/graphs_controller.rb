module RailsGrapher
  class GraphsController < ApplicationController
    def index
      @graphs = Graph.all
    end
  end
end
