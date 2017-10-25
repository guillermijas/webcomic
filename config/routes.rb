Rails.application.routes.draw do
  resources :comics do
    resources :publications
    resources :forums do
      resources :groups do
        resources :comments
      end
    end
  end
  devise_for :users

  root 'comics#index'
end
