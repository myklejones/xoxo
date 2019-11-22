Rails.application.routes.draw do
  resources :conversations
  resources :pictures
  resources :messages
  resources :matches
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :login, only: [:create] 

end
