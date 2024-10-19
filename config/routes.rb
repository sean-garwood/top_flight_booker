Rails.application.routes.draw do
  resources :flights, only: [ :index ]
  resources :bookings, only: [ :new, :create ]

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "flights#index"
end
