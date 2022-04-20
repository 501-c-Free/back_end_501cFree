class Api::V1::DevelopersController < ApplicationController

    def index 
        render json: DeveloperSerializer.new(Developer.all)
    end

    def show 
        render json: DeveloperSerializer.new(Developer.find(params[:id]))
    end
    
    def projects 
        render json: DeveloperProjectsSerializer.new(Developer.find(params[:id]))
    end
end