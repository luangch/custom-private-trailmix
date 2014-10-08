Rails.application.routes.draw do
  devise_for :users

  mount_griddler

  require "sidekiq/web"
  mount Sidekiq::Web => "/jobs"

  get "/admin_dashboard", to: "admin_dashboard#show", as: :admin_dashboard
  get "/landing", to: "landing#show", as: :new_registration
  get "/search", to: "searches#show"

  resource :export, only: [:new]
  resources :imports, only: [:new, :create]
  resource :settings, only: [:edit, :update]
  resources :subscriptions, only: [:create]

  root to: "dashboard#index", as: "dashboard"
end
