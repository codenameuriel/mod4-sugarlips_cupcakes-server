Rails.application.routes.draw do
  get '/users/:username', to: 'users#show'
  resources :users
  resources :profiles
  delete '/carts/remove', to: 'carts#remove'
  resources :carts
  resources :cupcakes
end
