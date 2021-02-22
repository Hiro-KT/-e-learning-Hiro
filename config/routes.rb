Rails.application.routes.draw do

  root   "pages#home"
  resources :users
  resources :sessions
  resources :categories

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