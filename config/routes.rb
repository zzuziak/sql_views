Rails.application.routes.draw do
  root to: 'pages#home'
  get 'user_orders', to: 'pages#user_orders', as: :user_orders
end
