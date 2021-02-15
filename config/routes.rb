Rails.application.routes.draw do
  root   "pages#home"
  resources :users
  resources :sessions

  namespace :admin do
    resources :users
  end

  delete '/logout', to: 'sessions#destroy'
end