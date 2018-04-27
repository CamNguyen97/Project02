Rails.application.routes.draw do
  root to: "homes#index"
  get "/about", to: "abouts#index"
  get "/contact", to: "contacts#index"
  get "/event", to: "events#index"
  get "/booking", to: "tickets#index"
  resources :homes
  resources :searchs
  resources :schedules
  
  namespace :admin do
    resources :homes
    resources :movies
    resources :schedules
    resources :cinemarooms
    resources :seats
    resources :users
    resources :studios
    resources :movietypes
    resources :movies_movietypes
    resources :schedule_times
   end
end
