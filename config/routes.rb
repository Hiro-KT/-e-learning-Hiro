Rails.application.routes.draw do

  get 'categories/index'
  root   "pages#home"
  resources :users
  resources :sessions

  namespace :admin do
    resources :categories do
      resources :words
    end
    resources :users do
      member do
        put "add_admin"
        put "remove_admin"
      end
    end
  end

   delete '/logout', to: 'sessions#destroy'

end