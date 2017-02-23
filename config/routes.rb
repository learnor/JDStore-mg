Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy]
  namespace :account do
    resources :orders, :favorites, only: [:index]
    # resources :profiles, only: [:show, :edit, :update]
    get 'profiles/:username', to: 'profiles#show', as: :profile
    get 'profiles/:username/edit', to: 'profiles#edit', as: :edit_profile
    patch 'profiles/:username/edit', to: 'profiles#update', as: :update_profile
  end

  namespace :admin do
    resources :categories
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :deliver
        post :return
      end
    end
  end
  devise_for :users, controllers: { confirmations: 'confirmations'}
  root "welcome#home"
  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts do
    collection do
      delete :clean
      post  :checkout
    end
  end
  resources :cart_items
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  # patch ':username/edit', to: 'profiles#update', as: :update_profile
  # get ':username/edit', to: 'profiles#edit', as: :edit_profile
  # get ':username', to: 'account/profiles#show', as: :profile
end
