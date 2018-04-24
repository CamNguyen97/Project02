Rails.application.routes.draw do
  root to: "homes#index"
  get "/about", to: "abouts#index"
  get "/contact", to: "contacts#index"
  get "/event", to: "events#index"
  get "/schedules", to: "schedules#show"
  get "/booking", to: "tickets#index"
  resources :homes
  namespace :admin do
   	resources :homes
   	resources :movies
   end
end
