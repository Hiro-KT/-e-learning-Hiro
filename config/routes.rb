Rails.application.routes.draw do
  root   "pages#home"
  get    "users/index"
  get    "sessions/new"
  resources :users
  resources :sessions
end