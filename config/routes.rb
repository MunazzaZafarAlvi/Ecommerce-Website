Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers
  root 'home#index'
  # config/routes.rb
  resources :products, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # Defines the root path route ("/")
  # root "posts#index"

  get '/about', to: 'home#about_us', as: 'about_us'
  get 'products', to: 'products#index'
  get '/faq', to: 'home#faq' , as: 'FAQ'
  get 'faq', to: 'pages#faq'
  get 'about', to: 'pages#about'
  get 'products', to: 'products#index'
  get 'products/:category', to: 'products#show', as: 'category_products'
  get 'cart', to: 'cart#show'
  delete 'logout', to: 'sessions#destroy'
  post '/orders/add_to_cart', to: 'orders#add_to_cart', as: 'add_to_cart'
  resources :products, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :orders do
    get 'add_to_cart', on: :collection
    resource :payment, only: [:new, :create]
  end
end
