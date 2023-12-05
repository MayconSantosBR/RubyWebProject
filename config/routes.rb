Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :people do
    collection do
      get 'list', to: 'people#get'
    end

    post 'people/delete', to: 'people#destroy', as: 'delete'
    post 'people/update', to: 'people#update', as: 'update'    
  end

  post '/create', to: 'people#create', as: 'create'

  get '/login', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/register_form', to: 'sessions#register_form'
  post '/register', to: 'sessions#register'

  resources :users
  resources :establishments

  get '/login', to: 'sessions#new'
  root to: 'sessions#new'
  get 'home', to: 'homepage#index'
end
