Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root 'categories#index'
    resources :categories
    resources :products
  end
  root 'products#index'
  resources :products
end
