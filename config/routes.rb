RailsGrapher::Engine.routes.draw do
  # resources :graphs, only: %i[index show]
  get 'graph', to: 'graphs#index'
  get 'graph/:type', to: 'graphs#show'
end
