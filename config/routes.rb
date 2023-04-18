Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :id
  resources :messages

  root 'chatrooms#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
end
