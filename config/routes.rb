Rails.application.routes.draw do
  resources :users, only: %i[ edit show update ]
  resources :lessons
  resources :trails
  resource :session
  resources :passwords, param: :token
  resources :lessons do
    post "complete", on: :member
  end
  resources :trails do
    post "favorite", to: "favorites#create"
    delete "unfavorite", to: "favorites#destroy"
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
