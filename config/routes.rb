Rails.application.routes.draw do
  namespace :admin do
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
  namespace :account do
    resources :orders, :favorites, only: [:index]
  end
  resources :favorites, only: [:create, :destroy]
end
