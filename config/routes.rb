Rails.application.routes.draw do

  get 'buckets/liking/:id', to: 'buckets#liking', as: :liking
  get 'buckets/:id/approve', to: 'buckets#approve', as: :approve
  get 'buckets/approved', to: 'buckets#approved'
  # get 'buckets/my', to: 'buckets#my'

  resources :stuffs do
    get 'my', on: :collection
    get 'change', on: :member
  end
  get 'tags/:tag', to: 'stuffs#index', as: :tag

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  root 'stuffs#index'
end
