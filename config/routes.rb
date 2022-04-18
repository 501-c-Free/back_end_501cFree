Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        post :create_developer, to: "registrations#developer"
        delete :logout, to: "sessions#logout" 
        get :logged_in, to: "sessions#logged_in"
        post :log_in, to: "sessions#create"
    end
  end
end
