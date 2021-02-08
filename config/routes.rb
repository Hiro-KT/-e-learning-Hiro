Rails.application.routes.draw do
  root   "pages#home"
  get    "users/index"
  resources :users
  resources :sessions
end