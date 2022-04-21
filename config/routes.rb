Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        post :create_developer, to: "registrations#developer"
        post :create_representative, to: "registrations#representative"
        delete :logout, to: "sessions#logout" 
        post :log_in, to: "sessions#create"
        resources :projects
        resources :non_profits
        resources :project_developers, only: [:create]
        get '/developer/:id/projects', to: "developers#projects"
        get '/developer/', to: "developers#index"
        get '/developer/:id/', to: "developers#show"
        patch '/developer/:id/', to: "developers#update"
    end
  end
end