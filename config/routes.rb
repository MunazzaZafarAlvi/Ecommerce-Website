Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  root 'home#index'
  authenticated :admin do
    root to: 'admin_dashboard#index', as: :authenticated_admin_root
  end
  authenticated :customer do
    root to: 'customer_dashboard#index', as: :authenticated_customer_root
  end
end
