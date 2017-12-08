Rails.application.routes.draw do
  devise_for :users

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :direct_messages
  get 'edit_profile' => 'users#edit'
  patch 'profile' => 'users#update'

  resources :uploads

  root to: "chatrooms#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
