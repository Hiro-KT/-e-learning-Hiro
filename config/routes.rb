Rails.application.routes.draw do
  root   "pages#home"

  namespace :admin do
    resources :users
  end
  
  resources :sessions

  delete '/logout', to: 'sessions#destroy'
end