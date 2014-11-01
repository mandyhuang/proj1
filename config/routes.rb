Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/pokemons/:id', to:'pokemons#damage', as:'damage'
  patch '/pokemons/:id', to:'pokemons#capture', as:'capture'
  get 'pokemons/new', to:'pokemons#new', as:'new'
  post '/pokemons', to:'pokemons#create', as:'create'

end
