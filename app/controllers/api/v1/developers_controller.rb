class Api::V1::DevelopersController < ApplicationController

    def index 
        render json: DeveloperSerializer.new(Developer.all)
    end

    def show 
        render json: DeveloperSerializer.new(User.find(params[:id]).developer)
    end
    
    def projects 
        render json: ProjectSerializer.new(User.find(params[:id]).developer.projects)
    end

    def update 
       developer = User.find(params[:id]).developer
       developer.github = params[:github]
       developer.linkedin = params[:linkedin]
       developer.save
    end
end