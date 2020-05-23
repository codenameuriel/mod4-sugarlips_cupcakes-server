Rails.application.routes.draw do
  get '/users/:username', to: 'users#show'
  resources :users
  resources :profiles
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :carts
  resources :cupcakes
end
