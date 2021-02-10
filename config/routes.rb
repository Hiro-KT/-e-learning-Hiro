Rails.application.routes.draw do
  root   "pages#home"
  resources :users
  resources :sessions

  delete '/logout', to: 'sessions#destroy'
end