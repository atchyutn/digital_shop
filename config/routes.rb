Rails.application.routes.draw do
  devise_for :users, :controllers => { sessions: "custom/sessions", registrations: "custom/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root 'categories#index'
    resources :users
    resources :categories
    resources :taxes
    resources :products
  end
  
  root 'products#index'
  
  get 'checkout/cart', to: 'checkout#cart'
  get 'checkout/product/:product_id', to: 'checkout#product'
  get 'checkout/complete', to: 'checkout#complete'
  post 'checkout/complete', to: 'checkout#request_twof_authentication'
  post 'checkout/verify_payment', to: 'checkout#verify_authentication'
  
  get 'orders', to: 'orders#index'
  get 'orders/:id', to: 'orders#show'
  get 'orders/:id/resend_order_conformation', to: 'orders#resend_order_conformation'
  
  post 'add_to_cart', to: 'carts#add'
  post 'remove_from_cart', to: 'carts#remove'
end
