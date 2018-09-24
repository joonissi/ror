Rails.application.routes.draw do

  resources :users

  resource :session, only: [:new, :create, :destroy]
  
  get '/', to: 'breweries#index'
  get 'kaikki_bisset', to: 'beers#index'

  get 'signup', to: 'users#new'

  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'

  

  # get 'ratings', to: 'ratings#index'
  # get 'ratings/new', to:'ratings#new'
  # post 'ratings', to: 'ratings#create'

  resources :ratings, only: [:index, :new, :create, :destroy]

  resources :beers
  resources :breweries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
