Rails.application.routes.draw do

  resources :styles
  resources :memberships
  resources :beer_clubs
  #resources :users
  resources :users do
    post 'toggle_activity', on: :member
  end

  resource :session, only: [:new, :create, :destroy]
  

  resources :places, only: [:index, :show]

  post 'places', to:'places#search'

  get '/', to: 'breweries#index'

  get 'brewerylist', to:'breweries#list'

  get 'beerlist', to:'beers#list'
  get 'kaikki_bisset', to: 'beers#index'

  get 'signup', to: 'users#new'

  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'

  

  # get 'ratings', to: 'ratings#index'
  # get 'ratings/new', to:'ratings#new'
  # post 'ratings', to: 'ratings#create'

  resources :ratings, only: [:index, :new, :create, :destroy]

  resources :beers
  resources :breweries do
    post 'toggle_activity', on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
