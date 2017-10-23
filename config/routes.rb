Rails.application.routes.draw do
  resources :comments
  resources :groups
  resources :forums
  resources :publications
  resources :comics
  resources :projects
  devise_for :users

  root 'comics#index'
end
