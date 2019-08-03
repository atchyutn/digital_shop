Rails.application.routes.draw do
  devise_for :users, :controllers => { sessions: "custom/sessions", registrations: "custom/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root 'categories#index'
    resources :categories
    resources :products
  end
  
  root 'products#index'
  
  get 'buy/cart', to: 'purchase#cart'
  
  post 'add_to_cart', to: 'carts#add'
  post 'remove_from_cart', to: 'carts#remove'
end
