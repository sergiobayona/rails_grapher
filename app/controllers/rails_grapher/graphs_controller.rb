module RailsGrapher
  class GraphsController < ApplicationController
    def index
      @graphs = Graph.all
      render json: @graphs
    end
  end
end
