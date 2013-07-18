GameApp::Application.routes.draw do

  resources :games do
    resources :tictactoe_moves
  end
  resources :playings
  resources :sessions, only: [:create, :destroy]
  resources :users

  get '/my_profile', to: 'users#my_profile', as: :my_profile
  get '/login', to: 'sessions#new'

  root to: 'games#new'

end



















#   get '/login', to: 'sessions#new'

#   root to: "games#new"

#   resources :tictactoe_moves
#   resources :games   # do
#   # get '/move/:move_square', action: 'move', as: 'move', on: :member
#   # end
#   resources :playings
#   resources :users
#   resources :sessions, only: [:create, :destroy]

#   # get '/search', to: 'search#index', as: 'new_search'
#   # post '/search', to: 'search#search', as: 'search'

# end










