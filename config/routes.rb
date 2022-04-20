Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        post :create_developer, to: "registrations#developer"
        post :create_representative, to: "registrations#representative"
        delete :logout, to: "sessions#logout" 
        get :logged_in, to: "sessions#logged_in"
        post :log_in, to: "sessions#create"
        resources :projects
        resources :non_profits
        get '/developer/:id/projects', to: "developers#projects"
        get '/developer/:id/', to: "developers#show"
    end
  end
end
