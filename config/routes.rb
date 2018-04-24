Rails.application.routes.draw do

   namespace :admin do
   	 resources :homes
   	 resources :movies
   end

end
