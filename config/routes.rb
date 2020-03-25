Rails.application.routes.draw do
  root to: 'pages#home'
  get 'user_orders', to: 'pages#user_orders', as: :user_orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
