Rails.application.routes.draw do
  resources :people do
    collection do
      get 'list', to: 'people#get'
    end

    post 'people/delete', to: 'people#destroy', as: 'delete'
    post 'people/update', to: 'people#update', as: 'update'    
  end

  post '/create', to: 'people#create', as: 'create'

  resources :users
  resources :establishments
  get 'homepage/index'
  root to: 'homepage#index'
  get 'home', to: 'homepage#index'
end
