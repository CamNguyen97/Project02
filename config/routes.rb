Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
   devise_for :users
    root to: "homes#index"
    get "/event", to: "events#index"
    get "/booking", to: "tickets#index"
    resources :homes
    resources :searchs
    resources :tickets do
      get "Getvalue", action: "loadData"
    end

    namespace :admin do
    resources :homes do
      get "delete"
    end
    resources :movies do
      get "delete"
    end
    resources :schedules do
      get "delete"
      get "Getdata", action: "getdataTime"
    end
    resources :cinemarooms do
      get "delete"
    end
    resources :seats do
      get "delete"
      get "seatGet", action: "cinemaroom_getdata"
    end
    resources :users do
      get "delete"
    end
    resources :studios do
      get "delete"
    end
    resources :movietypes do
      get "delete"
    end
    resources :movies_movietypes do
      get "delete"
    end
    resources :schedule_times do
      get "delete"
    end
    end

  end
end
