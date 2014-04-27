Rails.application.routes.draw do

  get 'buckets/liking/:id', to: 'buckets#liking', as: :liking
  get 'buckets/:id/approve', to: 'buckets#approve', as: :approve
  get 'buckets/approved', to: 'buckets#approved'
  # get 'buckets/my', to: 'buckets#my'

  get 'stuffs/:stuff_id/like_toggle', to: 'likes#like_toggle', as: 'stuff_like_toggle'

  get 'wishlist', to: 'stuffs#liked', as: 'wishlist'
  get 'my_bucket', to: 'stuffs#my', as: 'my_stuffs'

  get 'matches', to: 'matches#index'

  resources :stuffs do
    get 'change', on: :member
    get 'popup', to: 'stuffs#show_popup'
  end
  get 'tags/:tag', to: 'stuffs#index', as: :tag

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  root 'stuffs#index'
end
