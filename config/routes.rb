Rails.application.routes.draw do
  root   "pages#home"
  resources :users
  resources :sessions

  namespace :admin do
    resources :categories
    resources :users do
      member do
          put "add_admin"
          put "remove_admin"
        end
    end
  end

  delete '/logout', to: 'sessions#destroy'
end