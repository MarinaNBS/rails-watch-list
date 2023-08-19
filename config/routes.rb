Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lists#index"
  # get '/lists', to: 'lists#index'

  # get 'lists/new', to: 'lists#new', as: :new
  # post 'lists', to: 'lists#create'

  # get '/lists/:id', to: 'lists#show', as: :list

  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:new, :create, :index]
  end
  resources :bookmarks, only: [:destroy]
  resources :movies, only: [:index, :show]
end
