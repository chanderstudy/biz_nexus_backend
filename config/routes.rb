Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/favicon.ico', to: ->(_) { [204, {}, []] }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  namespace :api do
    namespace :v1 do
      resources :districts, only: [:index, :show]
      resources :business_cards, only: [:index, :show] do
        collection do
          get :search
          get :categories
          get :by_category_subcategory
          get :get_sub_categories
          get :all_categories
        end
      end
    end
  end
end
