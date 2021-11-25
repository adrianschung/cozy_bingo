Rails.application.routes.draw do
  root 'home#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  namespace :admin do
    resources :bingo_cards do
      resources :teams
    end
  end
end
