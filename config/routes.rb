Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :records
      resources :artists
    end
  end

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # The routes
  post "refresh", controller: :refresh, action: :create
  post "signin", controller: :signin, action: :create
  post "signup", controller: :signup, action: :create
  delete "signin", controller: :signin, action: :destroy


end
