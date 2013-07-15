GameApp::Application.routes.draw do

  get '/login', to: 'sessions#new'

  root to: "games#index"

  resources :tictactoe_moves
  resources :games
  resources :playings
  resources :users
  resources :sessions, only: [:create, :destroy]

  # get '/search', to: 'search#index', as: 'new_search'
  # post '/search', to: 'search#search', as: 'search'

end










