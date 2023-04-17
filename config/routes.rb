Rails.application.routes.draw do
  root 'users#sign_up'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
end
