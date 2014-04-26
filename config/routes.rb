Rails.application.routes.draw do

  get 'wishes/list'
  get 'requests', to: 'wishes#requests'
  get '/requests/:id', to: 'wishes#wish_request', as: :wish_request
  get '/add_wish', to: 'wishes#add_wish'

  resources :stuffs do
    get 'my', on: :collection
  end
  get 'tags/:tag', to: 'stuffs#index', as: :tag

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  root 'stuffs#index'
end
