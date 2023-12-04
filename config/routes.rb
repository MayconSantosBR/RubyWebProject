Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :people
  post '/create', to: 'people#create'

  resources :users
  resources :establishments
  get 'homepage/index'
  root to: 'homepage#index'
  get 'home', to: 'homepage#index'
end
