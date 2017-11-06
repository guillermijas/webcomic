Rails.application.routes.draw do
  resources :comics do
    collection do
      get 'top_rated'
      get 'free'
      get 'favourites'
      get 'pay_premium'
    end
    resources :publications
    resources :forums do
      resources :groups do
        resources :comments
      end
    end
  end

  get 'comics/:id/save_favourite', to: 'comics#save_favourite', as: 'save_favourite_comic'
  get 'comics/:id/pay_comic', to: 'comics#pay_comic', as: 'pay_comic'

  devise_for :users

  root 'comics#index'
end
