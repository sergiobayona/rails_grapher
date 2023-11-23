RailsGrapher::Engine.routes.draw do
  resources :graphs, only: %i[index show]
end
