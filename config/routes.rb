Rails.application.routes.draw do
  devise_for :users
  resources :pubs
  root to: 'pages#home'
end
