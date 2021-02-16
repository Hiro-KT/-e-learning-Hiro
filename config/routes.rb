Rails.application.routes.draw do
  root   "pages#home"
  resources :users
  resources :sessions

  namespace :admin do
    resources :users do
      member do
          # Add route to add_admin here
          put "add_admin"
          # Add route to remove_admin here
          put "remove_admin"
        end
    end
  end

  delete '/logout', to: 'sessions#destroy'
end